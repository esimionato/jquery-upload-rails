class ProductPicture < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  belongs_to :product

  image_accessor :picture

  attr_accessible :description, :picture_name, :picture_uid, :title, :picture

 #one convenient method to pass jq_upload the necessary information
  def to_jq_upload
    {
      "name" => read_attribute(:picture_name),
      "size" => picture.size,
      "url" => picture.url,
      "thumbnail_url" => picture.thumb('80x80#').url,
      "delete_url" => product_picture_path(:id => id),
      "delete_type" => "DELETE" 
    }
  end
end
