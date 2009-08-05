
require 'arm/skeleton_generator'

module ARM
  module Facade
    def generate!
      SkeletonGenerator.new(File.expand_path('.')).generate!
    end
  end
end