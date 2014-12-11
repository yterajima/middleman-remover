require "middleman-core"
require "middleman-remover/version"

::Middleman::Extensions.register(:remover) do
  require 'middleman-remover/extension'
  ::Middleman::Remover::Extension
end

