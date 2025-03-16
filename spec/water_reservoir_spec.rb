require_relative '../lib/water_reservoir'

describe 'A water reservoir' do
  it 'has a default capacity of 10 and is empty by default' do
    reservoir = WaterReservoir.new
    expect(reservoir.capacity).to eq(10)
    expect(reservoir.current_water_volume).to eq(0)
    expect(reservoir).to be_empty
  end

  it 'can be initialized with custom capacity and water volume' do
    reservoir = WaterReservoir.new(25, 10)
    expect(reservoir.capacity).to eq(25)
    expect(reservoir.current_water_volume).to eq(10)
  end

  it 'reports empty when water volume is 0' do
    reservoir = WaterReservoir.new(20, 0)
    expect(reservoir).to be_empty
  end

  it 'can be filled to capacity' do
    reservoir = WaterReservoir.new(15, 3)
    reservoir.fill
    expect(reservoir.current_water_volume).to eq(15)
  end

  it 'can be drained by a specified volume' do
    reservoir = WaterReservoir.new(20, 10)
    reservoir.drain(4)
    expect(reservoir.current_water_volume).to eq(6)
  end
  it 'does not allow draining below zero' do
    reservoir = WaterReservoir.new(10, 2)
    reservoir.drain(5)
    expect(reservoir.current_water_volume).to eq(0)
  end
  
  it 'does not allow draining below zero' do
    reservoir = WaterReservoir.new(10, 2)
    reservoir.drain(5)
    expect(reservoir.current_water_volume).to eq(0)
  end
    
end
