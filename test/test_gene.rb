require 'test/unit'
require 'lib/Gene'

class TestGene < Test::Unit::TestCase
  def test_gene_name
    gene = Gene.new("SNOG_00001")
    assert_equal(gene.name, "SNOG_00001")
  end
end

