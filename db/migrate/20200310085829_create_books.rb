# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :auther, null: false
      t.integer :isbn, limit: 5
      t.string :image_url
      t.string :publish_date
      t.string :publisher
      t.integer :page_count
      t.text :description
      t.text :textship
      t.text :last_rental
      t.references :place

      t.timestamps
    end
  end
end
