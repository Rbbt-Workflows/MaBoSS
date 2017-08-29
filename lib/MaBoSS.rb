require 'rbbt-util'
require 'rbbt/resource'

module MaBoSS
  def self.organism(org="Hsa")
    Organism.default_code(org)
  end

  #self.search_paths = {}
  #self.search_paths[:default] = :lib


  Rbbt.claim Rbbt.software.opt.MaBoSS, :install, Rbbt.share.install.software.MaBoSS.find(:lib)
end
