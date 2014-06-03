require_relative '../lib/menu_combinations'
require_relative '../lib/permutations'

describe MenuCombinations do
  let(:file) { File.read("spec/files/menu.txt") }
  let(:new_menu) { MenuCombinations.new file}

  describe "target_price" do
    it "sets the target price" do
      expect(new_menu.target_price).to eq(15.05)
    end
  end

  describe "format_price_for" do
    it "formats prices from string to float" do
      string = "$15.05"
      expect(new_menu.format_price_for string).to eq(15.05)
    end
  end

  describe "menu" do
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

  describe "price_combinations" do
    it "finds the price combinations that meet the target price" do
      new_menu.price_combinations

      Permutations.should receive(:new).with(new_menu.target_price, new_menu.menu)
    end
  end
end
