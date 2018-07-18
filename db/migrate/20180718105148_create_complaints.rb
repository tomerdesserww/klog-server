class CreateComplaints < ActiveRecord::Migration[5.2]
  def change
    create_table :complaints do |t|
      t.string :text
      t.string :image_url
      t.string :session_id

      t.timestamps
    end
  end
end
