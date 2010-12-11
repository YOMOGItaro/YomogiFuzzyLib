# /**
#  * @file   Table.rb
#  * @author hiuchi <hiuchi@PeatHein>
#  * @date   Sat Dec  4 18:59:19 2010
#  * 
#  * @brief  
#  * 
#  * 
#  */


module Fuzzy
  class LabelList
    def initialize( list)
      @list = list
    end
    
    def each
      @list.each{ |key1, hash|
        hash.each{ |key2, val|
          yield key1, key2, val
        }
      }
    end
  end
end
