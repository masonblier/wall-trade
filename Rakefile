require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

# hide command output for rspec
if defined? RSpec
  task(:spec).clear
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.verbose = false
  end
end
