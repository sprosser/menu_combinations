require_relative '../lib/permutations'

describe Permutations do
  let(:menu) { {
                "mixed fruit"      =>2.15,
                "french fries"     =>2.75,
                "side salad"       =>3.35,
                "hot wings"        =>3.55,
                "mozzarella sticks"=>4.2,
                "sampler plate"    =>5.8
               } }
  let(:target_price) { 15.05 }
  let(:new_permutation) { Permutations.new(target_price, menu) }

  describe "maximum_permutations" do
    it "finds the maximum number of permutations needed to run" do
      expect(new_permutation.maximum_permutations).to eq(7)
    end
  end

  describe "permutations" do
    it "runs the permutations for a given length" do
      expect(new_permutation.permutations(4).size).to eq(1296)
    end
  end

  describe "return_price_matches" do
    it "returns permutations that match with target price" do
      permutation = new_permutation.permutations(7)
      expect(new_permutation.price_matches_for(permutation).size).to eq(1)
    end
  end

  describe "remove_duplicates_from" do
    let(:matches) { [[1,2,3,4,5], [2,3,4,5,1], [3,4,5,2,1]] }

    it "removes any duplicates from the matching permutations" do
      expect(new_permutation.remove_duplicates_from(matches).size).to eq(1)
    end

    it "returns the matching array of prices" do
      expect(new_permutation.remove_duplicates_from(matches)).to eq([[1,2,3,4,5]])
    end
  end

  describe "find_matching_combinations" do
    it "returns the matching combinations for all permutations" do
      expect(new_permutation.find_matching_combinations.size).to eq(2)
    end

    it "returns each matching set in its own array" do
      result = [[2.15, 3.55, 3.55, 5.8], [2.15, 2.15, 2.15, 2.15, 2.15, 2.15, 2.15]]
      expect(new_permutation.find_matching_combinations).to eq(result)
    end

    it "raises an error if there are no matching combinations" do
      bad_permutation = Permutations.new(15.06, menu)

      expect { bad_permutation.find_matching_combinations }.to raise_error(RuntimeError)
    end
  end
end
