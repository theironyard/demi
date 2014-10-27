class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.references :course, index: true

      t.timestamps
    end
  end
end
