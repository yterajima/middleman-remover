# middleman-remover

[![Gem Version](https://badge.fury.io/rb/middleman-remover.svg)](http://badge.fury.io/rb/middleman-remover)
[![Build Status](https://travis-ci.org/yterajima/middleman-remover.svg?branch=master)](https://travis-ci.org/yterajima/middleman-remover)

`middleman-remover` は [Middleman](http://middlemanapp.com/) の拡張機能です。  
この拡張は `$ middleman build` を実行した際に動作し, `build` ディレクトリの中の指定したファイルやディレクトリを削除する機能を提供します。

## Installation

Gemfile に次の行を追加してください:

```ruby
gem 'middleman-remover'
```

コマンドを実行します:

    $ bundle

Gemfile を使わずにインストールする場合は次のコマンドを実行してください:

    $ gem install middleman-remover

## Usage

基本的な使い方:

```ruby
configure :build do
  activate :remover, :paths => %w(empty)
end
```

この例の場合, `middleman-remover` は `build/empty` を削除します。  
`:paths` オプションを指定することで, `build` ディレクトリからファイルやディレクトリを削除することができます。

ワイルドカードを使ってパスを指定することもできます:

```ruby
configure :build do
  activate :remover, :paths => %w(dir/*.html .DS_Store)
end
```

この例の場合, `middleman-remover` は `build/dir/*.html` と `build/.DS_Store` を削除します。

ディレクトリを削除することもできます:

```ruby
configure :build do
  activate :remover, :paths => %w(/dir)
end
```

この例の場合, `middleman-remover` は `build/dir/` ディレクトリを削除します。

## Contributing

1. Fork it ( https://github.com/yterajima/middleman-remover/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

