require_relative '../lib/freezer'

describe 'A freezer' do
  it 'has a default capacity of 100 and is initially at room temperature' do
    freezer = Freezer.new
    expect(freezer.capacity).to eq(100)
    expect(freezer.temperature).to eq(70)
  end

  it 'starts with power off and empty contents' do
    freezer = Freezer.new
    expect(freezer.instance_variable_get(:@power)).to eq(:off)
    expect(freezer.instance_variable_get(:@contents)).to eq([])
  end

  it 'can be turned on and off' do
    freezer = Freezer.new
    freezer.turn_on
    expect(freezer.instance_variable_get(:@power)).to eq(:on)
    freezer.turn_off
    expect(freezer.instance_variable_get(:@power)).to eq(:off)
  end

  it 'can have items added to it' do
    freezer = Freezer.new
    fake_item = double('Item', volume: 20)
    freezer.add(fake_item)
    expect(freezer.remaining_capacity).to eq(80)
  end

  it 'can compute remaining capacity based on item volumes' do
    freezer = Freezer.new(50)
    item1 = double('Item', volume: 10)
    item2 = double('Item', volume: 5)
    freezer.add(item1)
    freezer.add(item2)
    expect(freezer.remaining_capacity).to eq(35)
  end

  it 'sets temperature based on level' do
    freezer = Freezer.new
    freezer.set_level(2)
    expect(freezer.temperature).to eq(50)
  end
end
