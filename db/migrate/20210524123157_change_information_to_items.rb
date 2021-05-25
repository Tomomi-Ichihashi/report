class ChangeInformationToItems < ActiveRecord::Migration[5.2]
  def change
    rename_table :information, :items
  end
end
