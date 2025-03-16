require_relative '../lib/refrigerator'

describe 'A refrigerator' do
  let(:chiller) { double('Chiller', capacity: 60, remaining_capacity: 40, temperature: 55) }
  let(:freezer) { double('Freezer', capacity: 40, remaining_capacity: 30, temperature: 10) }
  let(:reservoir) { double('WaterReservoir', current_water_volume: 5) }
  let(:dispenser) { double('WaterDispenser') }
  let(:fridge) { Refrigerator.new(chiller, freezer, dispenser, reservoir) }

  it 'can chill an item using the chiller' do
    item = double('Item')
    expect(chiller).to receive(:add).with(item)
    fridge.chill(item)
  end

  it 'can freeze an item using the freezer' do
    item = double('Item')
    expect(freezer).to receive(:add).with(item)
    fridge.freeze(item)
  end

  it 'can calculate total capacity' do
    expect(fridge.total_capacity).to eq(100)
  end

  it 'can calculate remaining capacity' do
    expect(fridge.remaining_capacity).to eq(70)
  end

  it 'can be plugged in, turning on chiller and freezer' do
    expect(chiller).to receive(:turn_on)
    expect(freezer).to receive(:turn_on)
    fridge.plug_in
  end

  it 'can be unplugged, turning off chiller and freezer' do
    expect(chiller).to receive(:turn_off)
    expect(freezer).to receive(:turn_off)
    fridge.unplug
  end

  it 'can set chiller and freezer temperature levels' do
    expect(chiller).to receive(:set_level).with(3)
    fridge.set_chiller_level(3)

    expect(freezer).to receive(:set_level).with(2)
    fridge.set_freezer_level(2)
  end

  it 'reports a status string including power, capacity, temps, and water' do
    allow(chiller).to receive(:turn_on)
    allow(freezer).to receive(:turn_on)
  
    fridge.plug_in
    status = fridge.to_s
    expect(status).to include("Power: on")
    expect(status).to include("Storage: 70 of 100 available")
    expect(status).to include("Chiller is 55")
    expect(status).to include("Freezer is 10")
    expect(status).to include("Reservoir has 5 remaining")
  end
  
end
