# /**
#  * @file   Operation.rb
#  * @author hiuchi <hiuchi@PeatHein>
#  * @date   Sat Dec  4 14:23:00 2010
#  * 
#  * @brief  
#  * 
#  * 
#  */


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

    def product_all(vals1, vals2)
      ret = Hash.new{ |hash,key| hash[key] = {}}
      vals1.each{ |key1, v1|
        vals2.each{ |key2, v2|
          ret[key1][key2] = v1 * v2
        }
      }
      return ret
    end

    def create_outfun_table( out_family, outtable)
      ret = Hash.new{ |hash,key| hash[key] = {}}
      outtable.each{|key1, hash|
        hash.each{ |key2, val|
          ret[key1][key2] = out_family.get_function(val)
        }
      }
      return ret
    end

    def to_small( small_table, output_membership_table)
      ret = Hash.new{ |hash,key| hash[key] = {}}
      output_membership_table.each{ |key1, hash|
        hash.each{ |key2, val|
          ret[key1][key2] = val.alpha_cut(small_table[key1][key2])
        }
      }
      return ret
    end

    def calc_gravity(area_table)
      ws = 0.0
      s = 0.0
      area_table.each{ |key1,hash|
        hash.each{ |key2,val|
          s += val.area
          ws += val.weighted_area
        }
      }
      
      return 0.0 if ws == 0.0
      ws / s
    end
    
    def product_sum_gravity_method( fum1, arg1, fum2, arg2, outfam, outtable)
      vals1 = fum1.values( arg1)
      vals2 = fum2.values( arg2)
      xmap  = product_all( vals1, vals2)
      outtable = create_outfun_table( outfam, outtable) 
      areatable = to_small( xmap, outtable)
      calc_gravity( areatable)
    end

    module_function :infimum, :supremum, :area_method, :centroid_method, :product_sum_gravity_method
    module_function :product_all, :create_outfun_table, :to_small, :calc_gravity
  end
end
