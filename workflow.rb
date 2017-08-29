require 'rbbt-util'
require 'rbbt/workflow'

Misc.add_libdir if __FILE__ == $0

require 'MaBoSS'

module MaBoSS
  extend Workflow

  input :config, :text, "Configuration"
  input :model, :text, "BND file"
  task :run => :text do |config,model|
    output = file('output')
    FileUtils.mkdir_p output

    config_file = file('inputs/config')
    model_file = file('inputs/model')
    Open.write(config_file, config.to_s)
    Open.write(model_file, model.to_s)
    CMD.cmd("#{Rbbt.software.opt.MaBoSS.produce.find.engine.pub.MaBoSS} -c #{config_file } -o #{output} #{model_file}")
    "DONE"
  end
end

#require 'MaBoSS/tasks/basic.rb'

#require 'rbbt/knowledge_base/MaBoSS'
#require 'rbbt/entity/MaBoSS'

