class AddStringLocationToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :location, :string
  end
end
