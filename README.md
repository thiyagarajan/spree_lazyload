SpreeLazyload
=============

Add lazy images from https://web.dev/fast/use-lazysizes-to-lazyload-images

## Installation

1. Add this extension to your Gemfile with this line:
  ```ruby
  gem 'spree_lazyload', git: 'https://gitlab.k8s.acidlabs.io/spree-extensions/spree_lazyload', branch: '3-0-stable'
  ```

2. Install the gem using Bundler:
  ```ruby
  bundle install
  ```

3. Install gem or edit js file

  Execute

  ```ruby
  bundle exec rails g spree_lazyload:install
  ```

  Or add to `vendor/assets/javascripts/spree/frontend/all.js`

  ```js
  ...
  //= require spree/frontend/spree_lazyload
  ...
  ```

4. Restart your server

  If your server was running, restart it so that it can find the assets properly.

## Usage

1. Use `lazy_image_tag` rails helper:

  ```ruby
  = lazy_image_tag "image.jpg", class: 'img-responsive', alt: "alt-title", placeholder: "placeholder.svg"
  ```

2. Use spree_product's styles helpers:

  ```ruby
  # depends of the styles defined in your app
  # defaults styles are:
  = lazy_mini_image @product
  = lazy_small_image @product
  = lazy_product_image @product
  = lazy_large_image @product
  ```

3. Use all image_tag's images as lazy

  ```ruby
  # add to your initializer
  Spree::Config[:all_images_lazy] = true

  = image_tag "image.jpg"
  ```

## New Options

- placeholder: default image while image is loading. It uses Rails assets path

Example:

  ```ruby
  = lazy_image_tag @product.image, placeholder: "loader.svg"
  ```

- nolazy: if using `Spree::Config[:all_images_lazy] = true` you could add `nolazy: true` to use Rails `image_tag`

Example:

  ```ruby
  # add to your initializer
  Spree::Config[:all_images_lazy] = true

  # Will use lazy image
  = image_tag @product.image
  # Will use Rails default image_tag
  = image_tag @product.image, nolazy: true
  ```

## Contributing

If you'd like to contribute, please take a look at the
[instructions](CONTRIBUTING.md) for installing dependencies and crafting a good
pull request.

Copyright (c) 2019 [Acid Labs], released under the New BSD License
