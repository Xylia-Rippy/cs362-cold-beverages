require_relative '../lib/water_dispenser'

describe 'A water dispenser' do
  it 'has a reservoir' do
    fake_reservoir = double('Reservoir')
    dispenser = WaterDispenser.new(fake_reservoir)
    expect(dispenser.reservoir).to eq(fake_reservoir)
  end

  it 'dispenses water by draining the reservoir by the vessel volume' do
    fake_reservoir = double('Reservoir')
    vessel = double('Vessel', volume: 12)
  
    expect(fake_reservoir).to receive(:drain).with(12)
    allow(vessel).to receive(:fill)  # <-- add this line
  
    dispenser = WaterDispenser.new(fake_reservoir)
    dispenser.dispense(vessel)
  end
  

  it 'fills the vessel after dispensing' do
    fake_reservoir = double('Reservoir')
    vessel = double('Vessel', volume: 8)
  
    expect(fake_reservoir).to receive(:drain).with(8)
    expect(vessel).to receive(:fill)
  
    dispenser = WaterDispenser.new(fake_reservoir)
    dispenser.dispense(vessel)
  end
  
end
