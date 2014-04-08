class CheckboxAddition < ActiveRecord::Migration
  def change
  	add_column :categories, :show_to_users, :boolean, default: false
  end
end
