RSpec.describe "an empty array for items" do
  let(:inventory) {[]}
  it "has no items" do
    expect(inventory.size).to eq(0)
  end
  it 'can have an item added' do
    inventory << "sword"
    expect(inventory).to eq(["sword"])
  end
  it 'can have multiple items added' do
    inventory << "sword"
    inventory << "shield"
    expect(inventory).to eq(["sword","shield"])
  end
end

RSpec.describe 'Define get name method' do
  def user_name(name)
    "Hello #{name}"
  end

  it 'uses get_name method' do
    user_input = user_name('Hero')
    expect(user_input).to eq('Hello Hero')
  end

  context 'within a context group' do
    it 'can still use get_name method' do
      message = user_name('Villain')
      expect(message).to eq('Hello Villain')
    end
  end
end
