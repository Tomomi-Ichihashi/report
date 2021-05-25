class CreateInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :information do |t|
      
      t.integer :user_id
      t.integer :client_id
      t.text :body
      t.datetime :start_visit
      t.datetime :finish_visit

      t.timestamps
    end
  end
end
