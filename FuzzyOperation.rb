# /**
#  * @file   FuzzyOperation.rb
#  * @author hiuchi <hiuchi@PeatHein>
#  * @date   Sat Dec  4 14:23:00 2010
#  * 
#  * @brief  
#  * 
#  * 
#  */

require 'MembershipValueTable'

module Fuzzy
  module Operation
    
    ########################################
    ### fuzzy operation
    ########################################
    def infimum( src1, src2)
      [src1,src2].min
    end
        
    def supremum( src1, src2)
      [src1,src2].max
    end

    ########################################
    ### defuzzify methods
    ########################################
    def area_method( mf1, mf2)
      (mf1.area * mf1.weight + mf2.area * mf2.weight) / (mf1.area + mf2.area)
    end

    def centroid_method( mf1, mf2)
      puts "NOT_IMPLEMENTED centroid_method"
    end

   
    ###TODO
    def product_sum_gravity_method( fum1, arg1, fum2, arg2, outfam, outtable)
      vals1 = fum1.values( arg1)
      vals2 = fum2.values( arg2)
      xmap  = MembershipValueTable.from_product( vals1, vals2)
      outtable = MembershipFunctionTable.from_outtable( outfam, outtable) 
      outtable.to_small!( xmap)
      outtable.gravity
    end

    def min_max_method( fum1, arg1, fum2, arg2, outfam, outtable)
      vals1 = fum1.values( arg1)
      vals2 = fum2.values( arg2)
      xmap  = MembershipValueTable.from_min( vals1, vals2)
      outtable = MembershipFunctionTable.from_outtable( outfam, outtable) 
      outtable.to_small!( xmap)
      outtable.gravity
    end
    
    module_function :infimum, :supremum
    module_function :area_method, :centroid_method 
    module_function :product_sum_gravity_method
    module_function :min_max_method
  end
end
