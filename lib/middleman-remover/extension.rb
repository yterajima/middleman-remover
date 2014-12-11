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
          target = File.join(dir, target)

          if File.file? target
            if File.exist?(target)
              File.unlink target
              puts "      middleman-remover: #{target} is removed"
            else
              puts "      middleman-remover: #{target} is not exist"
            end
          end
        end
      end
    end
  end
end
