class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  include CarrierWave::MiniMagick

  def extension_whitelist
    %w[jpg jpeg gif png]
  end
end
