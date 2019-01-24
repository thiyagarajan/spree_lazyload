ActionView::Helpers::AssetTagHelper.module_eval do
  if Spree::Config[:all_images_lazy] == true
    def image_tag(source, options = {})
      lazy_image_tag(source, options)
    end
  end
end