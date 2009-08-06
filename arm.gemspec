Gem::Specification.new do |spec|
  spec.name = 'arm'
  spec.version = "0.0.1"
  spec.summary = "ARM generates project skeleton for Java project to embed ActiveRecord Migration."

  #### Dependencies and requirements.
  spec.files = ["lib/arm", "lib/arm/facade.rb", "lib/arm/skeleton_generator.rb", "lib/arm/tasks", "lib/arm/tasks/arm.rake", "lib/arm/tasks/arm.rb", "lib/arm.rb", "skeleton/config", "skeleton/config/database.yml.example", "skeleton/config/environment.rb", "skeleton/Rakefile", "skeleton/script", "skeleton/script/_jrubycleanup.bat", "skeleton/script/_jrubysetcp.bat", "skeleton/script/_jrubyvars.bat", "skeleton/script/_jrubyvmopts.bat", "skeleton/script/jrake", "skeleton/script/jrake.bat", "skeleton/vendor", "skeleton/vendor/ext", "skeleton/vendor/ext/activerecord-2.3.2", "skeleton/vendor/ext/activerecord-2.3.2/lib", "skeleton/vendor/ext/activerecord-2.3.2/lib/active_record", "skeleton/vendor/ext/activerecord-2.3.2/lib/active_record/schema_dumper.rb", "skeleton/vendor/ext/jdbc_tasks_postgre_fix.rb", "bin/arm", "CHANGES", "arm.gemspec", "lib", "MIT-LICENSE.TXT", "Rakefile", "README.rdoc", "TODO"]

  #### Load-time details: library and application (you will need one or both).

  spec.require_path = 'lib'                         # Use these for libraries.

  spec.bindir = "bin"                               # Use these for applications.
  spec.executables = ["arm"]
  spec.default_executable = "arm"

  #### Documentation and testing.

  spec.has_rdoc = true
  spec.extra_rdoc_files = ["README.rdoc", "MIT-LICENSE.TXT", "TODO", "CHANGES"]
  spec.rdoc_options = ["--line-numbers", "--inline-source", "--main", "README.rdoc", "--title", "\"ARM -- ActiveRecord Migration"]

  #### Author and project details.

  spec.author = "Li Xiao"
  spec.email = "xli@flextao.com"
  spec.homepage = "http://github.com/flextao/arm/tree/master"
end
