# frozen_string_literal: true
require 'migrating_serializer/flexible_loader'

# An ActiveRecord compatible serializer module. This will support deserializing
# data that is either YAML or JSON. It will always reserialize the data as JSON.
module MigratingSerializer
  def self.load(data)
    FlexibleLoader.load(data)
  end

  def self.dump(data)
    JSON.dump(data)
  end
end
