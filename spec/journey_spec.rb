# frozen_string_literal: true

require 'journey'

describe Journey do
  let(:station) { double(name: 'Victoria', zone: 1) }
  it 'expect a journey to be incomplete' do
    expect(subject).not_to be_complete
  end

  it 'deducts the penalty fare by default' do
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end

  it 'returns itself when exiting a journey' do
    expect(subject.finish(station)).to eq subject
  end

  context 'with an entry_station' do
    subject { described_class.new(station) }

    it 'has entry station' do
      expect(subject.entry_station).to eq station
    end

    it 'deducts the penalty fare when no exit_station' do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end
    context 'with an exit_station' do
      let(:station2) { double(name: 'Holland Park', zone: 2) }

      before do
        subject.finish(station2)
      end

      it 'Calculates a fare' do
        expect(subject.fare).to eq(1)
      end

      it 'Knows if a journey is complete' do
        expect(subject).to be_complete
      end
    end
  end
end
