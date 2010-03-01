require 'Cds'

class Gene
  attr_reader :cdss, :name
  
  def initialize(gene_name)
    @name = gene_name
    @cdss = []
  end
  def add_cds(cds)
    @cdss << cds
  end
  def chromosome
    @cdss.first.chromosome
  end
  def strand
    @cdss.first.strand
  end
  def start
    @cdss.min{|cds_a,cds_b| cds_a.start <=> cds_b.start}
  end
  def stop
    @cdss.max{|cds_a,cds_b| cds_a.stop <=> cds_b.stop}
  end
end
