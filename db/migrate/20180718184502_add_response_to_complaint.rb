class AddResponseToComplaint < ActiveRecord::Migration[5.2]
  def change
    add_column :complaints, :response, :string
  end
end
