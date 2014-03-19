class AddNameToBlurbs < ActiveRecord::Migration
  def change
  	add_column :blurbs, :name, :string
  end
end
