# /**
#  * @file   TriangleMembershipFunction.rb
#  * @author hiuchi <hiuchi@PeatHein>
#  * @date   Sat Dec  4 15:29:11 2010
#  * 
#  * @brief  
#  * 
#  * 
#  */
require 'MembershipFunction'

module Fuzzy
  class TriangleMembershipFunction < MembershipFunction
    def initialize( center, width)
      @center = center
      @width = width
      @top = 1.0
      @alpha = MembershipValue.new(1.0)
    end

    def alpha=(value)
      @alpha = MembershipValue.new( value)
    end

    def min_point
      @center - @width
    end
    
    def max_point
      @center + @width
    end
    
    def gradient
      @top / @width
    end


    # geometory area
    # Stotal = base    * height / 2
    #        = width*2 * top    / 2
    #        = width * top
    # Sabove = abbase            * abheight    / 2
    #        = width*(1-alpha)*2 * top*(1-alpha) / 2
    #        = width * top * (1-alpha)^2
    # S      = Stotal - Sabove
    #        = (width*top) * (1 - (1-alpha)^2)
    def area
      ( @width*@top) * ( 1.0 - ( ( 1.0 - @alpha.value) ** 2))
    end

    # weighted_center
    def weight
      @center
    end



    # function of diagonally right up
    def right_up( x)
      MembershipValue.new( ( x - min_point) * gradient)
    end

    # function of diagonally right down
    def right_down( x)
      MembershipValue.new( ( max_point - x) * gradient)
    end
    
    def value( x)
      return MembershipValue.new( 0.0) if x < min_point
      return [right_up( x), @alpha].min if x < @center
      return [right_down( x), @alpha].min if x < max_point
      return MembershipValue.new( 0.0)
    end
  end

end
