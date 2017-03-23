name = "migrating_serializer"
$LOAD_PATH << File.expand_path("../lib", __FILE__)
require "#{name.tr("-", "/")}/version"

Gem::Specification.new name, MigratingSerializer::VERSION do |s|
  s.summary = "Convert YAML serialized columns to JSON by providing support for deserializing both JSON and YAML"
  s.authors = ["Craig Day"]
  s.email = "craigday3@gmail.com"
  s.homepage = "https://github.com/craig-day/#{name}"
  s.files = `git ls-files lib/ bin/ MIT-LICENSE`.split("\n")
  s.license = "MIT"
  s.required_ruby_version = ">= 2.1.0"
end
