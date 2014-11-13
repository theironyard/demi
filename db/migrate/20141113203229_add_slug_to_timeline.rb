class AddSlugToTimeline < ActiveRecord::Migration
  def change
    add_column :timelines, :slug, :string
  end
end
