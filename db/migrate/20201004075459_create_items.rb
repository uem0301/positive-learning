class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title,          null:false
      t.text :explanation,      null:false
      t.string :image
      t.string :video
      t.references :collection, null:false, foreign_key:true
      t.references :user,       null:false, foregin_key:true
      t.timestamps
    end
  end
end
