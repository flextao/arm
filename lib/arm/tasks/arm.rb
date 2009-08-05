
require 'arm/tasks/loader'
ARM.load_gems

# Load arm rakefile extensions
Dir["#{File.dirname(__FILE__)}/*.rake"].each { |ext| load ext }
