class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.integer :hcneeded
      t.integer :deadline
      t.string :requestingorg
      t.integer :user_id

      t.timestamps
    end
  end
end
