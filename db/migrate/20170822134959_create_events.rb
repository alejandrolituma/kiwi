class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    drop_table :events

    create_table :events do |t|
      t.integer :creator_id
      t.string :title
      t.string :place
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
