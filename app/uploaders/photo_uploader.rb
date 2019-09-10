class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  include CarrierWave::MiniMagick

  cloudinary_transformation image_metadata: true

  def extension_whitelist
    %w[jpg jpeg gif png]
  end
end
