#!/usr/bin/env bash

# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e

# shellcheck disable=SC2034
if [ -n "${GOOGLE_APPLICATION_CREDENTIALS}" ]; then
    export CLOUDSDK_AUTH_CREDENTIAL_FILE_OVERRIDE="${GOOGLE_APPLICATION_CREDENTIALS}"
fi

if [[ $# -lt 2 ]]; then
  echo "usage: destroy-indexes.sh <project> <indexes_file>" 1>&2
  exit 1
fi

PROJECT=$1
INDEXES_FILE=$2

gcloud datastore indexes cleanup "$INDEXES_FILE" --project="$PROJECT" --quiet
