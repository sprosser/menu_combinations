require_relative '../lib/orders'

describe "Orders" do
  let(:menu) { {
                "mixed fruit"      =>2.15,
                "french fries"     =>2.75,
                "side salad"       =>3.35,
                "hot wings"        =>3.55,
                "mozzarella sticks"=>4.2,
                "sampler plate"    =>5.8
               } }
  let(:prices) { [2.15, 3.55, 3.55, 5.8] }
  let(:new_order) { Orders.new menu, prices }
  let(:order) { [{"mixed fruit"=>2.15},
                 {"hot wings"=>3.55},
                 {"hot wings"=>3.55},
                 {"sampler plate"=>5.8}
                ] }
  let(:total) { {"TOTAL"=>15.05} }

  describe "Match menu items" do
    it "matches menu items to the prices for the order" do
      expect(new_order.match_menu_items).to eq(order)
    end
  end

  describe "order_total" do
    it "creates a hash for the order total" do
      expect(new_order.order_total).to eq(total)
    end
  end

  describe "order" do
    it "returns the order together with its total" do
      expect(new_order.order).to eq(order << total)
    end
  end
end
