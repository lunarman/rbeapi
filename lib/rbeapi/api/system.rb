#
# Copyright (c) 2014, Arista Networks, Inc.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
#   Redistributions of source code must retain the above copyright notice,
#   this list of conditions and the following disclaimer.
#
#   Redistributions in binary form must reproduce the above copyright
#   notice, this list of conditions and the following disclaimer in the
#   documentation and/or other materials provided with the distribution.
#
#   Neither the name of Arista Networks nor the names of its
#   contributors may be used to endorse or promote products derived from
#   this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL ARISTA NETWORKS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
# IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
require 'rbeapi/api'

module Rbeapi

  module Api

    ##
    # The System class configures the node system services such as
    # hostname and domain name
    class System < Entity

      ##
      # Returns the system settings
      #
      # @example
      #   {
      #     hostname: <string>
      #   }
      #
      # @return [Hash]  A Ruby hash objec that provides the system settings as
      #   key/value pairs.
      def get()
        response = {}
        response.merge!(parse_hostname(config))
        response
      end

      def parse_hostname(config)
        mdata = /(?<=^hostname\s)(.+)$/.match(config)
        { hostname: mdata.nil? ? '' : mdata[1] }
      end

      ##
      # Configures the system hostname value in the running-config
      #
      # @param [Hash] opts The configuration parameters
      # @option opts [string] :value The value to set the hostname to
      # @option opts [Boolean] :default The value should be set to default
      #
      # @return [Boolean] returns true if the command completed successfully
      def set_hostname(opts = {})
        value = opts[:value]
        default = opts[:default] || false

        case default
        when true
          cmds = ['default hostname']
        when false
          cmds = (value.nil? ? 'no hostname' : \
                               "hostname #{value}")
        end
        configure(cmds)
      end
    end
  end
end
