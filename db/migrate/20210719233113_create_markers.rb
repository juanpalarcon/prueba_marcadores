class CreateMarkers < ActiveRecord::Migration[5.2]
  def change
    create_table :markers do |t|
      t.references :category, foreign_key: true
      t.references :type, foreign_key: true  
      t.string :url

      t.timestamps
    end
  end
end
