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

    # **you use like this:
    # fam1 = MembershipFunctionFamily.new(
    #  {  :low    => OnesideMembershipFunction.new( 40, 20),
    #     :normal => TriangleMembershipFunction.new( 40, 20),
    #     :high   => OnesideMembershipFunction.new( 40, 60)})

    def initialize( family)
      @family = family # Hash
    end

    def get_function( key)
      @family[key]
    end
  
    # x: input value for MembershipFunction
    # return: each MenbershipFunction(x)'s value formed hash
    def values( x)
      values = Hash.new
      @family.each{ |key,f|
        values[key] = f.value(x)
      }
      values
    end
  end  
end

