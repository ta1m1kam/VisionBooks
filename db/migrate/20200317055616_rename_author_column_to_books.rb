# frozen_string_literal: true

class RenameAuthorColumnToBooks < ActiveRecord::Migration[6.0]
  def change
    rename_column :books, :auther, :author
  end
end