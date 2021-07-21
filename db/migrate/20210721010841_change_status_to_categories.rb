class ChangeStatusToCategories < ActiveRecord::Migration[5.2]
  def change
    change_column :categories, :status, :boolean
  end
end
