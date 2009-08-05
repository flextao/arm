require 'rubygems'
require 'rubygems/gem_runner'

module ARM
  module Loader
    def log_file
      if File.exists?('logs')
        File.join(ARM_ROOT, 'logs', 'arm.log')
      elsif File.exists?('logs')
        File.join(ARM_ROOT, 'log', 'arm.log')
      else
        File.join(ARM_ROOT, 'arm.log')
      end
    end

    def rails_gem_dir
      Dir.entries(gems_root).detect {|path| path =~ /rails/}
    end

    def gems_root
      File.join(ARM_ROOT, 'vendor', 'gems')
    end

    def load_gems
      load_gems_in(gems_root)
    end

    def load_gems_in(dir)
      Dir.entries(dir).select { |p|
        p.match(/^[^\.]/) and File.directory?(File.join(dir, path, "lib"))
      }.each { |p|
        $:.unshift(File.join(dir, path, "lib"))
      }
    end

    def find_gem(name, version=nil)
      g = version ? Gem.cache.find_name(name, "= #{version}").first : Gem.cache.find_name(name).sort_by { |g| g.version }.last
      unless g
        puts "No #{name} gem #{version} is installed.  Do 'gem list #{name}' to see what you have available."
        exit
      end
      g
    end
  end
  extend Loader
end