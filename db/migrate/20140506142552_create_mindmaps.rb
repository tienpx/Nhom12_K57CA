class CreateMindmaps < ActiveRecord::Migration
  def change
    create_table :mindmaps do |t|
      t.string :title
      t.references :user, index: true

      t.timestamps
    end
  end
end
