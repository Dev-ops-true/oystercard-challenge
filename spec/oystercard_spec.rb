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

describe 'Oystercard status (in_journey,touch_in or touch_out)' do
  
  it 'is suppose to not be in journey' do
    expect(subject).not_to be_in_journey   
  end

    it 'is suppose to be touch_in' do
    subject.top_up(50)
    subject.touch_in
    expect(subject).to be_in_journey
  end

  it 'Error when insufficient funds' do
    expect { subject.touch_in }.to raise_error "You have insufficient funds"
end

  it 'is suppose to be touch_out' do
    subject.top_up(50)
    subject.touch_in
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

  it 'Reduces the fare from the balance' do
    subject.top_up(50)
    subject.touch_in
    expect{ subject.touch_out }.to change{subject.balance}.by(-Oystercard::MINIMUM_FARE)
  end

end
end 