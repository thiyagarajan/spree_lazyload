Spree::BaseHelper.module_eval do

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
