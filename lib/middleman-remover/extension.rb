require 'fileutils'

module Middleman
  module Remover
    # Middleman Remover Extension
    class Extension < ::Middleman::Extension
      option :paths, [], 'List of remove files/directories paths'

      def initialize(app, options_hash = {}, &block)
        super
        paths     = options.paths
        build_dir = app.build_dir
        extension = self

        app.after_build do
          extension.remove(paths, build_dir)
        end
      end

      def remove(paths, dir)
        paths.each do |path|
          full_path = File.join(dir, path)
          files     = Dir.glob(full_path)

          if files.length > 0
            FileUtils.rm_rf(files)
            app.logger.info "== middleman-remover: #{path} is removed =="
          else
            app.logger.info "== middleman-remover: #{path} is not exist =="
          end
        end
      end
    end
  end
end
