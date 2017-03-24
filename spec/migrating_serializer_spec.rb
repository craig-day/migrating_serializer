# frozen_string_literal: true
require 'spec_helper'

SingleCov.covered!

describe MigratingSerializer do
  let(:ruby) { { 'foo' => 'bar' } }
  let(:json) { JSON.dump(ruby) }

  it 'has a VERSION' do
    expect(MigratingSerializer::VERSION).to match(/^[\.\da-z]+$/)
  end

  describe '.load' do
    let(:yaml) { YAML.dump(ruby) }

    it 'loads YAML' do
      expect(MigratingSerializer.load(yaml)).to eq ruby
    end

    it 'loads JSON' do
      expect(MigratingSerializer.load(json)).to eq ruby
    end
  end

  describe '.dump' do
    let(:dump) { '{"foo":"bar"}' }

    it 'dumps as JSON' do
      expect(MigratingSerializer.dump(ruby)).to eq dump
    end
  end
end
