class Permutations
  def initialize target_price, menu
    @target_price = target_price
    @menu         = menu
  end

  #Once the cheapest item repeated exceeds the target price, we can stop permutations
  def maximum_permutations
    cheapest_item = @menu.values.min
    (@target_price/cheapest_item).floor
  end

  def permutations length
    @menu.values.repeated_permutation(length).to_a
  end

  #Finds all permutations where its sum totals the target price
  def price_matches_for permutation
    permutation.inject([]) do |result, p|
      result << p if p.reduce(:+) == @target_price
      result
    end
  end

  #Since permutations can have the exact same items but in different order,
  #we want to sort and ensure each order is unique
  def remove_duplicates_from matches
    matches.each { |ary| ary.sort! { |a, b| a <=> b } }.uniq
  end

  #Here is the engine that will run all permutations
  def find_matching_combinations
    length = 1 #inital permutation length
    result = []
    self.maximum_permutations.times do
      permutation       = self.permutations length
      unsorted_matches  = self.price_matches_for permutation
      matches           = self.remove_duplicates_from unsorted_matches

      result << matches unless matches.empty?
      length += 1 #Increment the length for the next permutation
    end

    result = result.flatten(1)
    raise "There is no combination of dishes that will equal $#{@target_price}" if result.empty?
    result
  end
end
