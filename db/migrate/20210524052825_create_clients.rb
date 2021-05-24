class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      
      t.string :name
      t.string :name_kana
      t.string :postal_code
      t.string :address
      t.string :telephone_number
      t.string :email

      t.timestamps
    end
  end
end
