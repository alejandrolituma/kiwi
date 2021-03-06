class CreateEventAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :event_attendances do |t|
      t.references :event, foreign_key: true
      t.references :attendee, polymorphic: true

      t.timestamps
    end
  end
end
