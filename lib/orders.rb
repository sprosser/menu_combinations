class Orders
  def initialize menu, prices
    @menu   = menu
    @prices = prices
  end

  def order
    self.match_menu_items << self.order_total
  end

  def match_menu_items
    @prices.inject([]) do |result, price|
      result << @menu.select { |k,v| v == price }
      result
    end
  end

  #I thought it would be nice to include the order total with each order
  def order_total
    Hash["TOTAL", @prices.reduce(:+)]
  end
end
