class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  version :thumb100 do
    process resize_to_fit: [100, 100]
  end
  storage :file
  # S3を設定したら以下に変更
  # storage :fog

  # アップロードしたファイルの保存先を指定する。
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # 画像がアップロードされてない時に、'sample.jpg'を表示する。
  def default_url
    "sample.png"
  end

  # アップロードを許可するファイル種類を指定する。
  def extension_allowlist
    %w[jpg jpeg png gif]
  end
end
