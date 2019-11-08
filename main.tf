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

locals {
  path_file            = "${path.module}/tmp/index.yaml"
  null_index_path_file = "${path.module}/null_index/index.yaml"
}

resource "local_file" "cloud-datastore-index-file" {
  content  = var.indexes
  filename = local.path_file
}

resource "null_resource" "cloud-datastore-indices" {
  triggers = {
    changes_in_index_file = sha1(local_file.cloud-datastore-index-file.content)
  }

  provisioner "local-exec" {
    command = "${path.module}/scripts/create-indexes.sh '${var.project}' '${local_file.cloud-datastore-index-file.filename}'"
  }

  provisioner "local-exec" {
    command = "${path.module}/scripts/destroy-indexes.sh '${var.project}' '${local.null_index_path_file}'"
    when    = "destroy"
  }
}
