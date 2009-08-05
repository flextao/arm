
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
    end

    def copy_directory(path)
      FileUtils.cp_r(File.join(@root, path), @root)
    end
  end
end
