class CreateTabs < ActiveRecord::Migration
  def change
    create_table :tabs do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
