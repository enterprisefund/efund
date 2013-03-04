class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.integer :project_id
      t.integer :hccommitted
      t.string :fundingorg
      t.string :commitdate

      t.timestamps
    end
  end
end
