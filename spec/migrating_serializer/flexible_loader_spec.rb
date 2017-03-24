# frozen_string_literal: true
require 'spec_helper'

SingleCov.covered!

describe MigratingSerializer::FlexibleLoader do
  def self.it_reads_both_types
    it 'reads YAML' do
      serialized   = YAML.dump(object)
      deserialized = MigratingSerializer::FlexibleLoader.load(serialized)

      expect(deserialized).to eq object
    end

    it 'reads JSON' do
      serialized   = JSON.dump(object)
      deserialized = MigratingSerializer::FlexibleLoader.load(serialized)

      expect(deserialized).to eq object
    end
  end

  def self.it_is_consistent
    it 'consistently deserializes JSON data' do
      data = JSON.dump(object)

      50.times do
        data = JSON.dump(MigratingSerializer::FlexibleLoader.load(data))
      end

      deserialized = MigratingSerializer::FlexibleLoader.load(data)

      expect(deserialized).to be_a object.class
      expect(deserialized).to eq   object
    end

    it 'consistently deserializes YAML data' do
      data = YAML.dump(object)

      50.times do
        data = YAML.dump(MigratingSerializer::FlexibleLoader.load(data))
      end

      deserialized = MigratingSerializer::FlexibleLoader.load(data)

      expect(deserialized).to be_a object.class
      expect(deserialized).to eq   object
    end
  end

  describe '.load' do
    describe 'String' do
      let(:object) { 'Foo Bar' }

      it_reads_both_types
      it_is_consistent
    end

    describe 'Array' do
      let(:object) { ['a', 'b', 1, 2, {}] }

      it_reads_both_types
      it_is_consistent
    end

    describe 'Hash' do
      let(:object) { { 'foo' => 'bar', 'bar' => 400 } }

      it_reads_both_types
      it_is_consistent
    end

    describe 'Fixnum' do
      let(:object) { 1234 }

      it_reads_both_types
      it_is_consistent
    end

    describe 'Float' do
      let(:object) { 123.321 }

      it_reads_both_types
      it_is_consistent
    end

    describe 'NilClass' do
      let(:object) { nil }

      it_reads_both_types
      it_is_consistent
    end

    describe 'TrueClass' do
      let(:object) { true }

      it_reads_both_types
      it_is_consistent
    end

    describe 'FalseClass' do
      let(:object) { false }

      it_reads_both_types
      it_is_consistent
    end
  end
end
