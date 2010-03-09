require 'Gene'

class GtfConverter
  attr_reader :genes
  
  InvalidGtfFormat = Class.new(StandardError)
  
  def initialize(gtf_line)
    check_format(gtf_line)
    @line = gtf_line
    @genes = Hash.new{|h,k|h[k] = []}
  end
  
  def check_format(line)
    splitline = line.split("\t")
    raise InvalidGtfFormat, "There are #{splitline.length} columns in your gtf file. There should be 9." unless splitline.length == 9
    attributes = splitline[8].split(";")
    raise InvalidGtfFormat, "gene_id not present (must be first)" unless attributes[0].match(/^ ?gene_id ".*"/)
    raise InvalidGtfFormat, "transcript_id not present (must be second)" unless attributes[1].match(/^ ?transcript_id ".*"/)
  end
end

