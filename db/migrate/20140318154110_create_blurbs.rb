class CreateBlurbs < ActiveRecord::Migration
  def change
    create_table :blurbs do |t|
      t.string :content
      t.integer :category_id

      t.timestamps
    end
  end
end
