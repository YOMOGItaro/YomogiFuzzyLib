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
    
    def algebraic_product(other)
      @value * other.value
    end
    
  end
end
