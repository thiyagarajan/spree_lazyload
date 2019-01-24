SpreeLazyload
=============

Add lazy_image_tag and lazy_#{style}_image for spree_product's styles with https://web.dev/fast/use-lazysizes-to-lazyload-images

## Installation

1. Add this extension to your Gemfile with this line:
  ```ruby
  gem 'spree_lazyload', git: 'https://gitlab.k8s.acidlabs.io/spree-extensions/spree_lazyload', branch: '3-0-stable'
  ```

2. Install the gem using Bundler:
  ```ruby
  bundle install
  ```

3. Copy
  ```ruby
  bundle exec rails g spree_lazyload:install
  ```

  or add to `vendor/assets/javascripts/spree/frontend/all.js`

  ```js
  ...
  //= require spree/frontend/spree_lazyload
  ...
  ```

4. Restart your server

  If your server was running, restart it so that it can find the assets properly.

## Contributing

If you'd like to contribute, please take a look at the
[instructions](CONTRIBUTING.md) for installing dependencies and crafting a good
pull request.

Copyright (c) 2019 [Acid Labs], released under the New BSD License
