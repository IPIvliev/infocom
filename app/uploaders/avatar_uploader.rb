# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  # Create different versions of your uploaded files:
  #version :thumb do
  #  process :scale => [50, 50]
  #end

end
