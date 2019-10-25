/**
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

provider "google" {
  version = "2.18.0"
}

module "datastore" {
  source  = "../../"
  project = var.project_id
  indexes = data.null_data_source.dependency.outputs.indexes
}

resource "google_app_engine_application" "app" {
  project     = var.project_id
  location_id = var.location_id
}

resource "null_resource" "wait_app" {
  provisioner "local-exec" {
    command = "echo sleep 120s for App to get created; sleep 120"
  }
  depends_on = [
    google_app_engine_application.app,
  ]
}

data "null_data_source" "dependency" {
  depends_on = [null_resource.wait_app]

  inputs = {
    trigger = null_resource.wait_app.id
    indexes = file("${path.module}/yaml/index.yaml")
  }
}
