# frozen_string_literal: true

class AddIndexToUsersEmail < ActiveRecord::Migration[6.0]
  def change
    # メールアドレスの一意性を強制するためのマイグレーション
    add_index :users, :email, unique: true
  end
end