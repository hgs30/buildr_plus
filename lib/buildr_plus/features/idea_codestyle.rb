#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

BuildrPlus::FeatureManager.feature(:idea_codestyle) do |f|
  f.enhance(:ProjectExtension) do
    after_define do |project|
      if project.ipr?
        project.ipr.add_component_from_file("#{File.expand_path(File.dirname(__FILE__))}/idea_codestyle.xml")

        project.ipr.add_code_insight_settings(:extra_excluded_names => %w(graphql.Assert))
        project.ipr.add_nullable_manager
      end
    end
  end
end
