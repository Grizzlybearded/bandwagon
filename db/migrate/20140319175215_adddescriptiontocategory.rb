class Adddescriptiontocategory < ActiveRecord::Migration
  def change
  	add_column :categories, :description, :text, :limit => nil
  end
end
