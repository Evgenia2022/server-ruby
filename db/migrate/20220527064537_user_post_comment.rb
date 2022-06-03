class UserPostComment < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, uniqueness: true
      t.string :full_name, null: false

      t.timestamps
    end

    create_table :posts do |t|
      t.string :title, null: false
      t.string :content, null: false

      t.timestamps
    end

    create_table :comments do |t|
      t.string :content, null: false

      t.timestamps
    end

    add_reference :posts, :user, foreign_key: true, index: true
    add_reference :comments, :user, foreign_key: true, index: true
    add_reference :comments, :post, foreign_key: true, index: true
  end
end
