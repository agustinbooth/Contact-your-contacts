class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :last_name
      t.string :phone_number
      t.string :communication_channel
      t.integer :user_id
      t.string :email
      t.string :organization
      t.string :facebook
      t.string :instagram
      t.string :twitter

      t.timestamps
    end
  end
end
