require_relative '../lib/item'

describe 'An item of food or a beverage' do
  it 'has a name' do
    item = Item.new('Soda', 12)
    expect(item.name).to eq('Soda')
  end

  it 'has a volume' do
    item = Item.new('Juice', 16)
    expect(item.volume).to eq(16)
  end
end
