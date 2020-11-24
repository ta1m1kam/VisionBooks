# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :place
  mount_uploader :picture, PictureUploader
  validate :picture_size

  paginates_per 16

  private

  # アップロードされた画像のサイズをバリデーションする
  def picture_size
    errors.add(:picture, 'should be less than 5MB') if picture.size > 5.megabytes
  end
end
