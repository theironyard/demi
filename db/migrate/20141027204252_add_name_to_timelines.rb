class AddNameToTimelines < ActiveRecord::Migration
  def change
    add_column :timelines, :name, :string
  end
end
