Gem::Specification.new do |spec|
  spec.name = 'arm'
  spec.version = "0.0.1"
  spec.summary = "ARM is for Java project to embed ActiveRecord Migration."

  #### Dependencies and requirements.
  spec.files = ["lib/arm/commands.rb", "lib/arm/facade.rb", "lib/arm/skeleton_generator.rb", "lib/arm/tasks/arm.rb", "lib/arm/tasks/loader.rb", "lib/arm.rb", "skeleton/config/environment.rb", "skeleton/vendor/ext/activerecord-2.3.2/lib/active_record/schema_dumper.rb", "skeleton/vendor/ext/jdbc_tasks_postgre_fix.rb", "bin/arm", "CHANGES", "arm.gemspec", "lib", "MIT-LICENSE.TXT", "Rakefile", "README.rdoc", "TODO"]

  #### Load-time details: library and application (you will need one or both).

  spec.require_path = 'lib'                         # Use these for libraries.

  spec.bindir = "bin"                               # Use these for applications.
  spec.executables = ["arm"]
  spec.default_executable = "arm"

  #### Documentation and testing.

  spec.has_rdoc = true
  spec.extra_rdoc_files = ["README.rdoc", "MIT-LICENSE.txt", "TODO", "CHANGES"]
  spec.rdoc_options = ["--line-numbers", "--inline-source", "--main", "README.rdoc", "--title", "\"ARM -- ActiveRecord Migration"]

  #### Author and project details.

  spec.author = "Li Xiao"
  spec.email = "xli@flextao.com"
  spec.homepage = "http://github.com/flextao/arm/tree/master"
  spec.rubyforge_project = "arm"
end
