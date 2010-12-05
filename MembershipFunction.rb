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

    # def alpha_cut
    # end

    ########################################
    # common methods
    ########################################

    def weighted_area
      area * weight
    end

    ## for print meathods
    def format_all( show_method)
      (min_point..max_point).each{ |x|
        show_method.call x.to_s + "\t"
        show_method.call value( x).to_s + "\t"
        show_method.call  "\n"
      }
    end
    
    def print_all
      format_all( lambda { |msg| print msg})
    end

    def write_all( fname)
      File.open( fname, "w"){ |f|
        format_all( lambda { |msg| f.print msg})
      }
    end
  end
end


require 'TriangleMembershipFunction'
