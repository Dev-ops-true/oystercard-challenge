require 'oystercard'

describe Oystercard do

  it 'Oystercards that have been initialized have a balance of 0' do
    expect(subject.balance).to eq(0)
   end

  describe '#top_up' do

    it { is_expected.to respond_to(:top_up).with(1).argument }
  
    it 'Oystercard will top up the balance with the amount in argument' do
      expect{ subject.top_up 10 }.to change{ subject.balance }.by 10
    end

    it 'does not allow the balance to be more than £90' do
        maximum_balance = Oystercard::MAXIMUM_BALANCE
        subject.top_up maximum_balance
        expect { subject.top_up 1 }.to raise_error "You cannot exceed #{maximum_balance}"
    end

  end
  describe '#deduct' do

    it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'deducts the fare from my balance' do
    expect{subject.deduct 10}.to change{ subject.balance }.by(-10)
    endß
  end

end