class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.text :description
      t.string :document_url
      t.references :tab, index: true

      t.timestamps
    end
  end
end
