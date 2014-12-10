module Middleman
  module Remover
    class Extension < ::Middleman::Extension
      def initialize(app, options_hash = {}, &block)
        super

        build_dir = app.build_dir
        app.after_build do
          # code
        end
      end
    end
  end
end
