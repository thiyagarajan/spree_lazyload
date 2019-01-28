ActionView::Helpers::AssetTagHelper.module_eval do
  def image_tag(source, options = {})
    if Spree::Config[:all_images_lazy] == true && options[:nolazy] != true
      lazy_image_tag(source, options)
    else
      options.delete(:nolazy)
      base_image_tag(source, options)
    end
  end

  def lazy_image_tag(source, options={})
    options = options.symbolize_keys

    src = path_to_image(source)
    options[:data] = { src: src}
    options[:class] ||= ""
    options[:class] = (options[:class].split(" ") + ["lazyload"]).join(" ")
    options[:src] = path_to_image(options.delete(:placeholder)) if options[:placeholder]

    unless src =~ /^(?:cid|data):/ || src.blank?
      options[:alt] = options.fetch(:alt){ image_alt(src) }
    end

    options[:width], options[:height] = extract_dimensions(options.delete(:size)) if options[:size]
    tag("img", options)
  end

  # From .rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/actionview-4.2.7.1/lib/action_view/helpers/asset_tag_helper.rb:208
  def base_image_tag(source, options={})
    options = options.symbolize_keys

    src = options[:src] = path_to_image(source)

    unless src =~ /^(?:cid|data):/ || src.blank?
      options[:alt] = options.fetch(:alt){ image_alt(src) }
    end

    options[:width], options[:height] = extract_dimensions(options.delete(:size)) if options[:size]
    tag("img", options)
  end
end
