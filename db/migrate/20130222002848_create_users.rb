class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :wwid
      t.string :name
      t.string :organization
      t.string :email

      t.timestamps
    end
  end
end
