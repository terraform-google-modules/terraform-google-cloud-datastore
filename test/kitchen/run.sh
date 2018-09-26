#!/bin/bash
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

TEMPDIR=$(pwd)/test/tmp/kitchen
TESTDIR=${BASH_SOURCE%/*}

# Install gems
function bundle_install() {
  bundle install
}

# Execute kitchen tests
function run_kitchen() {
  kitchen create
  kitchen converge
  kitchen verify
  kitchen destroy
}

# Preparing environment
make_testdir
cd "$TEMPDIR" || exit
activate_config
create_main_tf_file
create_outputs_file
bundle_install

# Call to kitchen
run_kitchen

# # # Clean the environment
cd - || exit
clean_workdir
echo "Integration test finished"
