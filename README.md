# Middleman::Remover

[![Gem Version](https://badge.fury.io/rb/middleman-remover.svg)](http://badge.fury.io/rb/middleman-remover)
[![Build Status](https://travis-ci.org/yterajima/middleman-remover.svg?branch=master)](https://travis-ci.org/yterajima/middleman-remover)

`middleman-remover` is an extension of [Middleman](http://middlemanapp.com/).  
This extension works when `$ middleman build` and provides Delete function of files or Directories in `build` directory.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'middleman-remover'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install middleman-remover

## Usage

Basic usage:

```ruby
configure :build do
  activate :remover, :paths => %w(empty)
end
```

You can use by specifying the file path/direcotry path you want to delete the `:paths` option. `middleman-remover` will remove `build/empty`.

You can also specify the path using the wild card:

```ruby
configure :build do
  activate :remover, :paths => %w(dir/*.html .DS_Store)
end
```

`middleman-remover` will remove `build/dir/*.html` and `build/.DS_Store`.

Also you can remove directory:

```ruby
configure :build do
  activate :remover, :paths => %w(/dir)
end
```

## Contributing

1. Fork it ( https://github.com/yterajima/middleman-remover/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

