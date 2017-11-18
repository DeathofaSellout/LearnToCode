class CreatePostComments < ActiveRecord::Migration[5.1]
  def change
    create_table :post_comments do |t|
      t.string :comment
      t.integer :post_id

      t.timestamps
    end
  end
end
