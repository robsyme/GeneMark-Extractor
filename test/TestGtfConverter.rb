require 'GtfCoverter'
require 'test/unit'

class TestGtfConverter < Test::Unit::TestCase
  def test_good_format_check
    input = "17	GeneMark.hmm	CDS	15	100	.	-	0	gene_id \"1_g\"; transcript_id \"1_t\"; gene_name \"\"; transcript_name \"\";"
    assert_nothing_raised do 
      GtfConverter.new(input)
    end
  end
  
  def test_bad_format_check
    input = "17	CDS	15	100	.	-	0	gene_id \"1_g\"; transcript_id \"1_t\"; gene_name \"\"; transcript_name \"\";"
    assert_raises(GtfConverter::InvalidGtfFormat) do 
      GtfConverter.new(input)
    end
  end
  
  def test_cds_construction
    input = "17	GeneMark.hmm	CDS	15	100	.	-	0	gene_id \"1_g\"; transcript_id \"1_t\"; gene_name \"\"; transcript_name \"\";"
    gtf = GtfConverter.new(input)
    puts gtf.genes.class.length
    assert_respond_to cds, :chromosome
    assert_respond_to cds, :start
    assert_respond_to cds, :stop
    assert_respond_to cds, :strand
  end
end


