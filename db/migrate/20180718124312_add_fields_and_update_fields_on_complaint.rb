class AddFieldsAndUpdateFieldsOnComplaint < ActiveRecord::Migration[5.2]
  def change
    add_column :complaints, :name, :string
    rename_column :complaints, :image_url, :asset_url
  end
end
