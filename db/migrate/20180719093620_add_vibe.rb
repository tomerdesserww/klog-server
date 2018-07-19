class AddVibe < ActiveRecord::Migration[5.2]
  def change
    add_column :complaints, :vibe, :string
  end
end
