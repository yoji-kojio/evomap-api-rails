class CreateRequirements < ActiveRecord::Migration[5.2]
  def change
    create_table :requirements do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.references :career, foreign_key: true
      t.references :content, foreign_key: true

      t.timestamps
    end
  end
end
