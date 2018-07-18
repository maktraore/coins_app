class CreateReceivers < ActiveRecord::Migration[5.1]
  def change
    create_table :receivers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :race
      t.string :department
      t.string :location
      t.string :coins
      t.string :giver_first_name
      t.string :giver_last_name
      t.timestamps
    end
  end
end
