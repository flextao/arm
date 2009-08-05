# Rakefile for ARM        -*- ruby -*-

# Copyright 2009 by flextao.com (Li Xiao <xli@flextao.com>)
# All rights reserved.

require 'rake/rdoctask'

begin
  require 'rubygems'
  require 'rake/gempackagetask'
rescue Exception
  nil
end

# The default task is run if rake is given no explicit arguments.

desc "Default Task"
task :default => :gem

# CVS Tasks ----------------------------------------------------------

# Create a task to build the RDOC documentation tree.

rd = Rake::RDocTask.new("rdoc") { |rdoc|
  rdoc.rdoc_dir = 'html'
  rdoc.template = 'html'
  rdoc.title    = "ARM -- ActiveRecord Migration"
  rdoc.options << '--line-numbers' << '--inline-source' <<
    '--main' << 'README.rdoc' <<
    '--title' <<  '"ARM -- ActiveRecord Migration' 
  rdoc.rdoc_files.include('README.rdoc', 'MIT-LICENSE.txt', 'TODO', 'CHANGES')
  rdoc.rdoc_files.include('lib/**/*.rb')
}

# ====================================================================
# Create a task that will package the DTR software into distributable
# tar, zip and gem files.

if ! defined?(Gem)
  puts "Package Target requires RubyGEMs"
else

  gem_content = <<-GEM
Gem::Specification.new do |spec|
  spec.name = 'arm'
  spec.version = "0.0.1"
  spec.summary = "ARM is for Java project to embed ActiveRecord Migration."

  #### Dependencies and requirements.
  spec.files = #{(Dir.glob("lib/**/*") + Dir.glob("skeleton/**/*") + ["bin/arm", "CHANGES", "arm.gemspec", "lib", "MIT-LICENSE.TXT", "Rakefile", "README.rdoc", "TODO"]).inspect}

  #### Load-time details: library and application (you will need one or both).

  spec.require_path = 'lib'                         # Use these for libraries.

  spec.bindir = "bin"                               # Use these for applications.
  spec.executables = ["arm"]
  spec.default_executable = "arm"

  #### Documentation and testing.

  spec.has_rdoc = true
  spec.extra_rdoc_files = #{rd.rdoc_files.reject { |fn| fn =~ /\.rb$/ }.to_a.inspect}
  spec.rdoc_options = #{rd.options.inspect}

  #### Author and project details.

  spec.author = "Li Xiao"
  spec.email = "xli@flextao.com"
  spec.homepage = "http://github.com/flextao/arm/tree/master"
  spec.rubyforge_project = "arm"
end
GEM
  File.open(File.dirname(__FILE__) + '/arm.gemspec', 'w') do |f|
    f.write(gem_content)
  end

  #build gem package same steps with github
  File.open(File.dirname(__FILE__) + '/arm.gemspec') do |f|
    data = f.read
    spec = nil
    Thread.new { spec = eval("$SAFE = 3\n#{data}") }.join
    package_task = Rake::GemPackageTask.new(spec) do |pkg|
      #pkg.need_zip = true
      #pkg.need_tar = true
    end
  end
end
