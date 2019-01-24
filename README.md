SpreeLazyload
=============

Add lazy_image_tag and lazy_#{style}_image for spree products with https://web.dev/fast/use-lazysizes-to-lazyload-images

## Installation

1. Add this extension to your Gemfile with this line:
  ```ruby
  gem 'spree_lazyload', github: '[your-github-handle]/spree_lazyload', branch: '3-0-stable'
  ```

  The `branch` option is important: it must match the version of Spree you're using.
  For example, use `3-1-stable` if you're using Spree `3-1-stable` or any `3.1.x` version.

2. Install the gem using Bundler:
  ```ruby
  bundle install
  ```

3. Copy & run migrations
  ```ruby
  bundle exec rails g spree_lazyload:install
  ```

4. Restart your server

  If your server was running, restart it so that it can find the assets properly.

## Contributing

If you'd like to contribute, please take a look at the
[instructions](CONTRIBUTING.md) for installing dependencies and crafting a good
pull request.

Copyright (c) 2019 [Acid Labs], released under the New BSD License
