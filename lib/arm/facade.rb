
require 'arm/skeleton_generator'

module ARM
  module Facade
    def generate!
      root = File.expand_path('.')
      skeleton = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'skeleton'))
      SkeletonGenerator.new(root, skeleton).generate!
    end
  end
end