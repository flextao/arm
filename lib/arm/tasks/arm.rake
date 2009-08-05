
namespace :arm do
  namespace :freeze do
    desc "Lock this application to the current gems (by unpacking them into vendor/gems)"
    task :gems do
      activerecord_gems = %w(activerecord rails activesupport)
      activerecord_gems_version = ENV['VERSION'] || '2.3.2'

      gems = activerecord_gems.collect { |g| ARM.find_gem(g, activerecord_gems_version) }
      gems << ARM.find_gem('activerecord-jdbc-adapter')

      puts "Freezing to the gems to ActiveRecord #{activerecord_gems_version} and activerecord-jdbc-adapter #{gems.last.version}"
      rm_rf   ARM.gems_root
      mkdir_p ARM.gems_root

      begin
        chdir(ARM.gems_root) do
          gems.each do |g|
            Gem::GemRunner.new.run(["unpack", g.name, "--version", g.version_requirements.to_s])
            mv(Dir.glob("#{g.name}*").first, g.name)
          end
        end
      rescue Exception
        rm_rf ARM.gems_root
        raise
      end
    end
  end
end