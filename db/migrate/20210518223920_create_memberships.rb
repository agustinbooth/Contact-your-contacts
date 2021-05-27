class CreateMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :memberships do |t|
      t.integer :group_id
      t.integer :contact_id

      t.timestamps
    end
  end
end
