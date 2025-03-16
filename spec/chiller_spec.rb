require_relative '../lib/chiller'

describe 'A chiller' do
  it 'has a default capacity of 100 and is initially at room temperature' do
    chiller = Chiller.new
    expect(chiller.capacity).to eq(100)
    expect(chiller.temperature).to eq(70)
  end

  it 'starts with power off and empty contents' do
    chiller = Chiller.new
    expect(chiller.instance_variable_get(:@power)).to eq(:off)
    expect(chiller.instance_variable_get(:@contents)).to eq([])
  end

  it 'can be turned on and off' do
    chiller = Chiller.new
    chiller.turn_on
    expect(chiller.instance_variable_get(:@power)).to eq(:on)
    chiller.turn_off
    expect(chiller.instance_variable_get(:@power)).to eq(:off)
  end

  it 'can have items added to it' do
    chiller = Chiller.new
    fake_item = double('Item', volume: 30)
    chiller.add(fake_item)
    expect(chiller.remaining_capacity).to eq(70)
  end

  it 'can compute remaining capacity based on item volumes' do
    chiller = Chiller.new(60)
    item1 = double('Item', volume: 10)
    item2 = double('Item', volume: 15)
    chiller.add(item1)
    chiller.add(item2)
    expect(chiller.remaining_capacity).to eq(35)
  end

  it 'sets temperature based on level (5 degrees per level)' do
    chiller = Chiller.new
    chiller.set_level(3)
    expect(chiller.temperature).to eq(55)
  end
end
