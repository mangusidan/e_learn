class CreateWords < ActiveRecord::Migration[7.0]
  def change
    create_table :words do |t|
      t.string :content
      t.integer :category_id

      t.timestamps
    end
  end
end
