class AddMediasToUsers < ActiveRecord::Migration
  def change
    add_column :users, :media, :string
  end
end
