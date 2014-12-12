require 'fileutils'

module Middleman
  module Remover
    class Extension < ::Middleman::Extension
      option :target, [], 'List of remove files/directories'

      def initialize(app, options_hash = {}, &block)
        super

        targets   = options.target
        build_dir = app.build_dir
        ext       = self

        app.after_build do
          ext.remove(targets, build_dir)
        end
      end

      def remove(targets, dir)
        targets.each do |target|
          path = File.join(dir, target)

          if File.exist?(path)
            FileUtils.rm_rf(path)
            puts "      middleman-remover: #{path} is removed"
          else
            puts "      middleman-remover: #{path} is not exist"
          end
        end
      end
    end
  end
end
