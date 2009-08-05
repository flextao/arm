
namespace :arm do
  namespace :freeze do
    desc "Lock this application to the current gems (by unpacking them into vendor/gems)"
    task :gems do
      require 'rubygems'
      require 'rubygems/gem_runner'

      activerecord_gems = %w(activerecord rails activesupport)
      activerecord_gems_version = ENV['VERSION'] || '2.3.2'

      gems = activerecord_gems.collect { |g| find_gem(g, activerecord_gems_version) }
      gems << find_gem('activerecord-jdbc-adapter')

      rm_rf   GEMS_ROOT
      mkdir_p GEMS_ROOT

      begin
        chdir(GEMS_ROOT) do
          gems.each do |g|
            puts "Freezing gem #{g.name} to #{g.version}"
            Gem::GemRunner.new.run(["unpack", g.name, "--version", g.version.to_s])
            mv(Dir.glob("#{g.name}*").first, g.name)
          end
        end
      rescue Exception
        rm_rf GEMS_ROOT
        raise
      end
    end
  end
end

def find_gem(name, version=nil)
  g = version ? Gem.cache.find_name(name, "= #{version}").first : Gem.cache.find_name(name).sort_by { |g| g.version }.last
  unless g
    puts "No #{name} gem #{version} is installed.  Do 'gem list #{name}' to see what you have available."
    exit
  end
  g
end