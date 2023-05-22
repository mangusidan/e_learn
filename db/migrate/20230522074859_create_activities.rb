class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.integer :target_id
      t.integer :activity_type

      t.timestamps
    end
  end
end
