class MenuCombinations
  def initialize file
    @text = file.split(/\n|\,/)
  end

  def target_price
    self.format_price_for @text[0] #instructions specifiy that the first line is target price
  end

  def format_price_for amount
    amount.gsub(/\$/, '').to_f
  end

  def menu
    menu = @text[1..-1].each_slice(2).to_a
    Hash[menu.map {|food, price| [food, self.format_price_for(price)] }]
  end
end
