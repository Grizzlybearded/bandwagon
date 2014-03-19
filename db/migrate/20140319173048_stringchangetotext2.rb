class Stringchangetotext2 < ActiveRecord::Migration
  def change
  	change_column :blurbs, :content, :text, limit: nil
  end
end
