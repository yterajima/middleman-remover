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
          if File.exist?(File.join(dir, target))
            File.unlink File.join(dir, target)
          end
        end
      end
    end
  end
end
