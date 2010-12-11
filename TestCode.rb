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


def testAllMembershipValueOperation
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
end


def testPSGMethod
  fam1 = MembershipFunctionFamily.new(
                                      {  :low    => OnesideMembershipFunction.new( 40, 20),
                                        :normal => TriangleMembershipFunction.new( 40, 20),
                                        :high   => OnesideMembershipFunction.new( 40, 60)})

  fam2 = MembershipFunctionFamily.new(
                                      {  :near   => OnesideMembershipFunction.new( 20, 10),
                                        :normal => TriangleMembershipFunction.new( 20, 10),
                                        :far    => OnesideMembershipFunction.new( 20, 30)})

  fout = MembershipFunctionFamily.new(
                                      {  :boost  => TriangleMembershipFunction.new( 10, 10),
                                        :neutral=> TriangleMembershipFunction.new( 0, 10),
                                        :break  => TriangleMembershipFunction.new( -10, 10)})

  tblh = Hash.new{ |hash,key| hash[key] = {}}
  tblh[:low][  :near] = :neutral; tblh[:normal][  :near] = :break;   tblh[:high][  :near] = :break;
  tblh[:low][:normal] = :boost;   tblh[:normal][:normal] = :neutral; tblh[:high][:normal] = :break;
  tblh[:low][   :far] = :boost;   tblh[:normal][   :far] = :boost;   tblh[:high][   :far] = :neutral;
  tbl = LabelList.new(tblh)

  File.open( "data/twod.dat", "w"){ |f|
    (0..80).each{ |x|
      (0..40).each{ |y|
        f.print x
        f.print "\t"
        f.print y
        f.print "\t"
        f.print Operation::min_max_method( fam1, x, fam2, y, fout, tblh)
        #f.print Operation::product_sum_gravity_method( fam1, x, fam2, y, fout, tblh)
        f.print "\n"
      }
      f.puts ""
    }
  }
end




#testAllMembershipValueOperation
testPSGMethod
