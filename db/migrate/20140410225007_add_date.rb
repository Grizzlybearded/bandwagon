class AddDate < ActiveRecord::Migration
  def change
  	add_column :categories, :send_date, :date
  end
end
