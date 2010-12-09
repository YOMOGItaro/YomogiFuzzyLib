# /**
#  * @file   TestCode.rb
#  * @author hiuchi <hiuchi@PeatHein>
#  * @date   Sat Dec  4 13:39:30 2010
#  * 
#  * @brief  
#  *  Fuzzy class Testing code
#  * 
#  */




require 'Fuzzy'
include Fuzzy

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


tmf1 = TriangleMembershipFunction.new( 20,20)
tmf2 = TriangleMembershipFunction.new( 30,20)
sumf = ComplexMembershipFunction.new( tmf1, tmf2, :supremum)
inmf = ComplexMembershipFunction.new( tmf1, tmf2, :infimum)
apmf = ComplexMembershipFunction.new( tmf1, tmf2, :algebraic_product)
asmf = ComplexMembershipFunction.new( tmf1, tmf2, :algebraic_sum)
lpmf = ComplexMembershipFunction.new( tmf1, tmf2, :limit_product)
lmmf = ComplexMembershipFunction.new( tmf1, tmf2, :limit_sum)
lbmf = ComplexMembershipFunction.new( tmf1, tmf2, :limit_sub)

MembershipFunctionOutput::write_all( "data/input_a.dat", tmf1)
MembershipFunctionOutput::write_all( "data/input_b.dat", tmf2)
MembershipFunctionOutput::write_all( "data/supremum.dat", sumf)
MembershipFunctionOutput::write_all( "data/infimum.dat", inmf)
MembershipFunctionOutput::write_all( "data/algebraic_product.dat", apmf)
MembershipFunctionOutput::write_all( "data/algebraic_sum.dat", asmf)
MembershipFunctionOutput::write_all( "data/limit_product.dat", lpmf)
MembershipFunctionOutput::write_all( "data/limit_sum.dat", lmmf)
MembershipFunctionOutput::write_all( "data/limit_sub.dat", lbmf)


# fam1 = MembershipFunctionFamily.new(
# {  :low    => TriangleMembershipFunction.new( 20, 20),
#    :normal => TriangleMembershipFunction.new( 40, 20),
#    :high   => TriangleMembershipFunction.new( 60, 20)})

# fam2 = MembershipFunctionFamily.new(
# {  :near   => TriangleMembershipFunction.new( 10, 10),
#    :normal => TriangleMembershipFunction.new( 20, 10),
#    :far    => TriangleMembershipFunction.new( 30, 10)})

# fout = MembershipFunctionFamily.new(
# {  :boost  => TriangleMembershipFunction.new( 10, 10),
#    :neutral=> TriangleMembershipFunction.new( 0, 10),
#    :break  => TriangleMembershipFunction.new( -10, 10)})

# tblh = Hash.new{ |hash,key| hash[key] = {}}
# tblh[:low][  :near] = :neutral; tblh[:normal][  :near] = :break;   tblh[:high][  :near] = :break;
# tblh[:low][:normal] = :boost;   tblh[:normal][:normal] = :neutral; tblh[:high][:normal] = :break;
# tblh[:low][   :far] = :boost;   tblh[:normal][   :far] = :boost;   tblh[:high][   :far] = :neutral;
# tbl = LabelList.new(tblh)

# File.open( "data/twod.dat", "w"){ |f|
#   (0..80).each{ |x|
#     (0..40).each{ |y|
#       f.print x
#       f.print "\t"
#       f.print y
#       f.print "\t"
#       f.print Operation::min_max_method( fam1, x, fam2, y, fout, tblh)
# #      f.print Operation::product_sum_gravity_method( fam1, x, fam2, y, fout, tblh)
#       f.print "\n"
#     }
#     f.puts ""
#   }
# }

# tmf1 = TriangleMembershipFunction.new( 50, 10)
# tmf2 = TriangleMembershipFunction.new( 60, 10)

# tmf1.alpha = 0.5
# p Operation::area_method( tmf1, tmf2)

# tmf1.write_all("data/tmf1.dat")

# (1..100).each{ |x|
#   puts x.to_s+ "\t" + Operation::supremum( tmf1.value(x), tmf2.value(x)).to_s
# }

 
