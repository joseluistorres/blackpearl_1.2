class CreateMinutes < ActiveRecord::Migration
  def change
    create_table :minutes do |t|
      t.string :name
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
