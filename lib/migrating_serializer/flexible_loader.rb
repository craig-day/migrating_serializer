# frozen_string_literal: true
# rubocop:disable Security/YAMLLoad, Security/JSONLoad
require 'yaml'
require 'json'

module MigratingSerializer
  # This module provides our flexible load method. It will check the data to see
  # if it is YAML and then call `YAML.load` on it. If the data does not appear
  # to be YAML then it will assume JSON and load it.
  module FlexibleLoader
    def self.load(data)
      if data.start_with?('---')
        # we know its YAML
        YAML.load(data)
      else
        # we should be able to read as JSON
        JSON.load(data)
      end
    end
  end
end
