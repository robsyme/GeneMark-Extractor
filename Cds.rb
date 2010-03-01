class Cds
  attr_reader :chromosome, :start, :stop, :strand
  def initialize(chromosome, start, stop, strand)
    raise TypeError unless strand =~ /[+-]/
    @chromosome = chromosome.to_s
    @start = start.to_i
    @stop = stop.to_i
    @strand = strand
  end
end
