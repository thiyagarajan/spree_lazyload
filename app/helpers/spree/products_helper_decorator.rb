Spree::ProductsHelper.class_eval do

  if Spree::Config[:all_images_lazy] == true
    def image_tag(source, options = {})
      lazy_image_tag(source, options)
    end
  end

  def lazy_image_tag(source, options={})
    options = options.symbolize_keys

    src = path_to_image(source)
    options[:data] = { src: src}
    options[:class] ||= ""
    options[:class] = (options[:class].split(" ") + ["lazyload"]).join(" ")

    unless src =~ /^(?:cid|data):/ || src.blank?
      options[:alt] = options.fetch(:alt){ image_alt(src) }
    end

    options[:width], options[:height] = extract_dimensions(options.delete(:size)) if options[:size]
    tag("img", options)
  end

  def create_product_lazy_image_tag(image, product, options, style)
    options.reverse_merge! alt: image.alt.blank? ? product.name : image.alt
    lazy_image_tag image.attachment.url(style), options
  end

  Spree::Image.attachment_definitions[:attachment][:styles].keys.each do |style|
    define_method "lazy_#{style}_image" do |product, *options|
      options = options.first || {}
      options[:alt] ||= product.name
      if product.images.empty?
        if !product.is_a?(Spree::Variant) && !product.variant_images.empty?
          create_product_lazy_image_tag(product.variant_images.first, product, options, style)
        else
          if product.is_a?(Variant) && !product.product.variant_images.empty?
            create_product_lazy_image_tag(product.product.variant_images.first, product, options, style)
          else
            lazy_image_tag "noimage/#{style}.png", options
          end
        end
      else
        create_product_lazy_image_tag(product.images.first, product, options, style)
      end
    end
  end
end
