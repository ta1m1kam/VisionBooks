# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :place

  paginates_per 16
end
