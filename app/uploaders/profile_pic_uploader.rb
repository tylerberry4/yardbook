class ProfilePicUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  # storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  def extension_white_list
    %w(jpeg jpg png )
  end

  process :resize_to_fit => [400, 600]

 # version :web do
    version :thumb do
      process :resize_to_fit => [32, 32]
    end
    # version :preview  { process :resize_to_fit => [128, 128] }
    # version :full     { process :resize_to_fit => [1024, 768] }
 # end

end
