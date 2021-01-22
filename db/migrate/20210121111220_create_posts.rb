class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :tittle,             null: false
      t.string :sentence,           null: false
      t.integer :genre,             null: false
      t.references :user,           foreign_key:true
      t.timestamps
    end
  end
end
