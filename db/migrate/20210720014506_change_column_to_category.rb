class ChangeColumnToCategory < ActiveRecord::Migration[5.2]
  def change
    change_column :categories, :status, :integer
  end
end
