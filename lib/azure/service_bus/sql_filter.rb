#-------------------------------------------------------------------------
# Copyright (c) Microsoft. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#--------------------------------------------------------------------------
require 'azure/service_bus/filter'

module Azure
  module ServiceBus
    class SqlFilter < Filter
      def initialize(hash=nil)
        hash = {} unless hash
        @sql_expression = hash["SqlExpression"]
        @compatibility_level = (hash["CompatibilityLevel"] || 20).to_i
        super()
      end

      attr_accessor :sql_expression
      attr_accessor :compatibility_level
      
      def to_hash(hash={})
        hash["SqlExpression"]=sql_expression if sql_expression
        hash["CompatibilityLevel"]=compatibility_level.to_s if compatibility_level
        super(hash)
      end
    end
  end
end