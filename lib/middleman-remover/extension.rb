require 'fileutils'

module Middleman
  module Remover
    class Extension < ::Middleman::Extension
      option :paths, [], 'List of remove files/directories paths'

      def initialize(app, options_hash = {}, &block)
        super

        paths     = options.paths
        build_dir = app.build_dir
        ext       = self

        app.after_build do
          ext.remove(paths, build_dir)
        end
      end

      def remove(paths, dir)
        paths.each do |path|
          path = File.join(dir, path)
          list = Dir.glob(path)

          if list.length > 0
            FileUtils.rm_rf(list)
            puts "   middleman-remover: #{path} is removed"
          else
            puts "   middleman-remover: #{path} is not exist"
          end
        end
      end
    end
  end
end

