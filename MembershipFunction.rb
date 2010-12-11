# /**
#  * @file   MembershipFunction.rb
#  * @author hiuchi <hiuchi@PeatHein>
#  * @date   Sat Dec  4 13:40:12 2010
#  * 
#  * @brief  
#  * 
#  * 
#  */



module Fuzzy
  class MembershipFunction
    
    ########################################
    # must implement values
    ########################################
    
    # @center 
    # @alpha  

    # def min_point
    # end

    # def max_point
    # end

    # def area
    # end

    # def weight
    # end

    # def value
    # end


    ########################################
    # common methods
    ########################################

    def algebraic_product( operand, val)
      value(val).algebraic_product operand.value(val)
    end


    def alpha=(value)
      @alpha = MembershipValue.new( value)
    end
    
    def alpha_cut(alpha)
      ret = self.clone
      ret.alpha = alpha

      return ret
    end

    def weighted_area
      area * weight
    end
  end
    
  module MembershipFunctionOutput
    ## for print meathods
    def format_all( mf, show_method)
      (mf.min_point..mf.max_point).each{ |x|
        show_method.call x.to_s + "\t"
        show_method.call mf.value( x).to_s + "\t"
        show_method.call  "\n"
      }
    end
    
    def print_all( mf)
      format_all( mf, lambda { |msg| print msg})
    end

    def write_all( fname, mf)
      File.open( fname, "w"){ |f|
        format_all( mf, lambda { |msg| f.print msg})
      }
    end

    module_function :format_all
    module_function :print_all, :write_all
  end


end






require 'TriangleMembershipFunction'
require 'OnesideMembershipFunction'
require 'ComplexMembershipFunction'
