require "spec_helper"

SingleCov.covered!

describe MigratingSerializer do
  it "has a VERSION" do
    expect(MigratingSerializer::VERSION).to match(/^[\.\da-z]+$/)
  end
end
