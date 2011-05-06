#encoding: utf-8
# == Schema Information
# Schema version: 20110505023421
#
# Table name: photos
#
#  id                 :integer(4)      not null, primary key
#  album_id           :integer(4)
#  description        :string(255)     default("")
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer(4)
#  image_updated_at   :datetime
#

class Photo < ActiveRecord::Base

  attr_accessible :image, :album_id, :description

  belongs_to :album


  #图片的保存路径形式/public/uploads/<用户ID>/:style/:after_file_name.:extension
  has_attached_file :image, :styles => { :thumb => '100x100'},
                            :path => ":rails_root/public/uploads/:albumid/:style/:after_file_name.:extension",
                            :url => "/uploads/:albumid/:style/:after_file_name.:extension"

  #对格式进行校验
 # validates_attachment_presence :image
  #validates_attachment_size :image, :less_than => 5.megabytes
 # validates_attachment_content_type :image, :content_type => ['image/jpeg','image/jpg', 'image/png', 'image/gif']

  #:after_file_name的自定义解析
  Paperclip.interpolates :after_file_name do |attachment,style|
      attachment.instance.after_file_name
  end

  Paperclip.interpolates :albumid do |attachment,style|
    attachment.instance.album_id
  end
  
  #此处的方法必须是公有的，否则会报错
   def after_file_name
     #包含UUID相关的库
     require 'uuidtools'
     UUIDTools::UUID.parse_raw("#{self.image_file_name}").to_s.gsub(/-/,'')
     #SecureRandom.uuid.gsub(/-/,'')
  end


end
