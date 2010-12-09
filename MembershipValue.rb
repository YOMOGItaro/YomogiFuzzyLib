# /**
#  * @file   MembershipValue.rb
#  * @author hiuchi <hiuchi@PeatHein>
#  * @date   Sat Dec  4 14:22:27 2010
#  * 
#  * @brief  
#  * 
#  * 
#  */


module Fuzzy
  class MembershipValue
    def initialize( value)
      @value = value
    end

    attr_accessor :value

    def to_s
      "#@value"
    end

    def to_f
      @value
    end

    def *(other)
      self.algebraic_product(other)
    end
    
    def <(other)
      @value < other.value
    end

    def >(other)
      @value > other.value
    end

    def <=>(other)
      @value <=> other.value
    end

    def supremum(other)
      [@value,other.value].max
    end

    def infimum(other)
      [@value,other.value].min
    end
    
    def algebraic_product(other)
      @value * other.value
    end

    def algebraic_sum(other)
      @value + other.value - (@value * other.value)
    end

    def limit_product(other)
      [0.0,(@value + other.value - 1)].max
    end

    def limit_sum(other)
      [1.0,(@value + other.value)].min
    end

    def limit_sub(other)
      [0.0,(@value - other.value)].max
    end

    
    
  end

end

