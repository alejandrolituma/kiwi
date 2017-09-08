class AddCategoryToEvents < ActiveRecord::Migration
  def change
    add_column :events, :category, :string
    add_column :event_attendances, :feedback , :integer 
  end
end
