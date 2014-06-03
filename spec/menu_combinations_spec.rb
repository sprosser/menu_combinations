require_relative '../menu_combinations'

describe MenuCombinations do
  let(:file) { File.read ("/Users/sprosser/Documents/menu.txt") }
  let(:new_menu) { MenuCombinations.new file}

  it "sets the targert price" do
    expect(new_menu.target_price).to eq(15.05)
  end

  it "formats prices from string to float" do
    string = "$15.05"
    expect(new_menu.format_price_for string).to eq(15.05)
  end
end
