class CreateCommentaries < ActiveRecord::Migration[6.1]
  def change
    create_table :commentaries do |t|
      t.text :body
      t.string :author_name
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
