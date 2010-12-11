# /**
#  * @file   MembershipFunctionTable.rb
#  * @author hiuchi <hiuchi@PeatHein>
#  * @date   Mon Dec  6 21:53:55 2010
#  * 
#  * @brief  
#  * 
#  * 
#  */

module Fuzzy
  class MembershipFunctionTable
    def initialize(table)
      @table = table
    end

    def MembershipFunctionTable.from_outtable( function_family, fuzzy_table)
      ret = Hash.new{ |hash,key| hash[key] = {}}
      fuzzy_table.each{ |key1,key2,val|
          ret[key1][key2] = function_family.get_function(val)
      }
      
       new( ret)
    end

    def to_small!( small_table)
      ret = Hash.new{ |hash,key| hash[key] = {}}
      @table.each{ |key1, hash|
        hash.each{ |key2, val|
          ret[key1][key2] = val.alpha_cut(small_table.get_value( key1, key2).to_f)
        }
      }
      @table = ret
    end

    def gravity
      ws = 0.0
      s = 0.0
      @table.each{ |key1,hash|
        hash.each{ |key2,val|
          s += val.area
          ws += val.weighted_area
        }
      }
      return 0.0 if ws == 0.0
      ws / s
    end
    
  end
end
