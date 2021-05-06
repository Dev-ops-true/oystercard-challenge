# frozen_string_literal: true

require 'station'

describe Station do
  describe '.new' do
    let(:station) { Station.new('Holland Park', 2) }
    it 'has a name' do
      expect(station.name).to eq('Holland Park')
    end
    it 'has a zone' do
      expect(station.zone).to eq(2)
    end
  end
end
