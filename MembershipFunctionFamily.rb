# /**
#  * @file   MembershipFunctionFamily.rb
#  * @author hiuchi <hiuchi@PeatHein>
#  * @date   Sat Dec  4 15:35:44 2010
#  * 
#  * @brief  
#  *   the set include menbership function
#  * 
#  */
require 'MembershipFunction'

module Fuzzy
  class MembershipFunctionFamily
    def initialize( family)
      @family = family # Hash
    end

    def get_function( key)
      @family[key]
    end
    
    def values( x)
      values = Hash.new
      @family.each{ |key,f|
        values[key] = f.value(x)
      }
      values
    end
  end  
end

