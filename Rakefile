require "bundler/gem_tasks"
require "middleman-core/version"

task default: :test

desc "test command"
task :test do
  version = ::Middleman::VERSION

  if /^4\./ =~ ::Middleman::VERSION
    sh 'cucumber --tags ~@v3 features/'
  else
    sh 'cucumber --tags ~@v4 features/'
  end
end
