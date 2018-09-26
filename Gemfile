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

ruby '2.4.2'

source 'https://rubygems.org/' do
  # TODO: Need to pin the version of kitchen-terraform until https://github.com/newcontext-oss/kitchen-terraform/issues/272 is fixed
  gem 'kitchen-terraform', :git => 'https://github.com/newcontext-oss/kitchen-terraform.git', :ref => 'e1ed686'
  gem 'kitchen-inspec', :git => 'https://github.com/inspec/kitchen-inspec.git', :ref => '0590f1b'
end
