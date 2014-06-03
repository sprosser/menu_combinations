RUNNING THE MENU COMBINATION TEST

This should be fairly straight-forward for running any menu file with the layout of the one provided.

To get all matching combinations for a given menu and target price:

1.) new_combo = MenuCombinations.new File.read("/your_filepath.txt")

2.) new_combo.find_order_combinations

3.) You're all done! I have each combination returned in a hash with items as keys, prices as values, and a total at the end of each order.

If you wish to run the test suite you can go ahead and do so using rspec!

Thanks!
