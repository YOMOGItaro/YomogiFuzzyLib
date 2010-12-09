# /**
#  * @file   ComplexMembershipFunction.rb
#  * @author hiuchi <hiuchi@PeatHein>
#  * @date   Thu Dec  9 20:31:07 2010
#  * 
#  * @brief  
#  * 
#  * 
#  */

require 'MembershipFunction'

module Fuzzy
  class ComplexMembershipFunction < MembershipFunction
    
    def initialize( mf1, mf2, operate)
      @mf1 = mf1
      @mf2 = mf2
      @operate = operate
    end

    # @center 
    # @alpha  

    def min_point
      [@mf1.min_point,@mf2.min_point].min
    end

    def max_point
      [@mf1.max_point,@mf2.max_point].max
    end

    # def area
    # end

    # def weight
    # end

    def value(x)
      @mf1.value(x).send( @operate, @mf2.value(x))
    end

  end
end
