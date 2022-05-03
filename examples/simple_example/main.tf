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
  version = "~> 3.53"
}

module "datastore" {
  source     = "../../"
  project    = var.project
  indexes    = file(var.indexes_file_path)
  depends_on = [time_sleep.wait_120_seconds]
}

resource "google_app_engine_application" "app" {
  project     = var.project
  location_id = var.location_id
}

resource "time_sleep" "wait_120_seconds" {
  # sleep 120s for App to get created
  depends_on      = [google_app_engine_application.app]
  create_duration = "120s"
}
