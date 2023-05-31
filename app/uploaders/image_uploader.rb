class ImageUploader < CarrierWave::Uploader::Base
  # -------------------------------- 解説1 ----------------------------------
  include CarrierWave::MiniMagick
  process resize_to_fit: [200, 200]
  # ------------------------------------------------------------------------

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # -------------------------------- 解説2 ----------------------------------
  version :cropped do
    process :crop
  end

  private
    def crop
      manipulate! do |img|
        crop_x = model.image_x.to_i
        crop_y = model.image_y.to_i
        crop_w = model.image_w.to_i
        crop_h = model.image_h.to_i

        img.crop "#{crop_w}x#{crop_h}+#{crop_x}+#{crop_y}"
        img
      end
    end
  # ------------------------------------------------------------------------

end
