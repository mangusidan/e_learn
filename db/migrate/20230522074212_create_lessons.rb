class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.integer :question_number
      t.integer :category_id
      t.integer :user_id
      t.boolean :is_completed

      t.timestamps
    end
  end
end
