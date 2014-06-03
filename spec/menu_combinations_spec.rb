require_relative '../menu_combinations'

describe MenuCombinations do
  let(:file) { File.read("spec/files/menu.txt") }
  let(:new_menu) { MenuCombinations.new file}

  it "sets the targert price" do
    expect(new_menu.target_price).to eq(15.05)
  end

  it "formats prices from string to float" do
    string = "$15.05"
    expect(new_menu.format_price_for string).to eq(15.05)
  end

  it "creates a menu with remaining items in the file" do
    expect(new_menu.menu).to eq({
                                  "mixed fruit"      =>2.15,
                                  "french fries"     =>2.75,
                                  "side salad"       =>3.35,
                                  "hot wings"        =>3.55,
                                  "mozzarella sticks"=>4.2,
                                  "sampler plate"    =>5.8
                                 })
  end
end
