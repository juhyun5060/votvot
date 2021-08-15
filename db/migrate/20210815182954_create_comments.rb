class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.integer :user_id
      t.integer :comment_id
      t.text :content

      t.timestamps
    end
  end
end
