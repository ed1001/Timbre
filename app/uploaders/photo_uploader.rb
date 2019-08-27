class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  include CarrierWave::MiniMagick

  def extension_whitelist
    %w[jpg jpeg gif png]
  end

  # process :store_dimensions

  # private

  # def store_dimensions
  #   if file && model
  #     # model.width, model.height = ::MiniMagick::Image.open("http://res.cloudinary.com/dp2mdaolk/#{model[:photo]}")[:dimensions]
  #     model.width, model.height = ::MiniMagick::Image.open(file.file)[:dimensions]
  #   end
  # end
end
