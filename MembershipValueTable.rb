# /**
#  * @file   MembershipValueTable.rb
#  * @author hiuchi <hiuchi@PeatHein>
#  * @date   Mon Dec  6 14:25:14 2010
#  * 
#  * @brief  
#  * 
#  * 
#  */


module Fuzzy
  class MembershipValueTable
    def initialize(table)
      @table = table
    end

    # factory method
    def MembershipValueTable.from_product(vals1, vals2)
      ret = Hash.new{ |hash,key| hash[key] = {}}
      vals1.each{ |key1, v1|
        vals2.each{ |key2, v2|
          ret[key1][key2] = v1 * v2
        }
      }
      new(ret)
    end

    def get_value( key1, key2)
      @table[key1][key2]
    end
    
  end
end
