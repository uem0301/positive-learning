class CreateCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :collections do |t|
      t.string :name,      null: false
      t.text :explanation, null: false
      t.references :user,  null:false, foregin_key: true
      t.string :image
      t.timestamps
    end
  end
end
