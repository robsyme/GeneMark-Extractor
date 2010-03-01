require 'test/unit'
require 'lib/Cds'

class TestCds < Test::Unit::TestCase
  def test_chromosome
    cds = Cds.new("chromosome_1", 120, 150, "+")
    assert_equal(cds.chromosome, "chromosome_1")
    cds = Cds.new(:chromosome_1, 120, 140, "+")
    assert_equal(cds.chromosome, "chromosome_1")
    cds = Cds.new('chromosome_1', 120, 140, "+")
    assert_equal(cds.chromosome, "chromosome_1")
  end
  
  def test_start_stop
    cds = Cds.new("chromosome_1", 120, 150, "+")
    assert_equal(cds.start, 120)
    cds = Cds.new("chromosome_1", "120", 150, "+")
    assert_equal(cds.start, 120)
    cds = Cds.new("chromosome_1", 120, 150, "+")
    assert_equal(cds.stop, 150)
    cds = Cds.new("chromosome_1", "120", "150", "+")
    assert_equal(cds.stop, 150)
  end
  
  def test_strand
    cds = Cds.new("chromosome_1", 120, 150, "+")
    assert_equal(cds.strand, "+")
    cds = Cds.new("chromosome_1", 120, 150, "-")
    assert_equal(cds.strand, "-")
    assert_raises(TypeError) do
      cds = Cds.new("chromosome_1", 120, 150, "plus")
      cds = Cds.new("chromosome_1", 120, 150, :minus)
    end
  end
end


