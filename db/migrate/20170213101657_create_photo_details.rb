class CreatePhotoDetails < ActiveRecord::Migration
  def change
    create_table :photo_details do |t|
      t.string :title
      t.string :place_taken
      t.date :date_taken
      t.string :link
      t.text :story

      t.timestamps null: false
    end
  end
end
