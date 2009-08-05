
require 'fileutils'

module ARM
  class SkeletonGenerator
    def initialize(root, skeleton)
      @root = root
      @skeleton = skeleton
    end

    def generate!
      %w(
        config
        db
        db/migrate
        lib
        script
        vendor
        vendor/gems
        vendor/ext
      ).each { |path| copy_directory path }
      copy_file('Rakefile')
    end

    def copy_file(path)
      FileUtils.cp(File.join(@skeleton, path), @root)
    end

    def copy_directory(path)
      skeleton_path = File.join(@skeleton, path)
      if File.exist?(skeleton_path)
        FileUtils.cp_r(skeleton_path, @root)
      else
        FileUtils.mkdir_p(File.join(@root, path))
      end
    end
  end
end
