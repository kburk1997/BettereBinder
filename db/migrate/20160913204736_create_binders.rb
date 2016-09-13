class CreateBinders < ActiveRecord::Migration
  def change
    create_table :binders do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
