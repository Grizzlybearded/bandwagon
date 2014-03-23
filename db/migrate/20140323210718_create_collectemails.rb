class CreateCollectemails < ActiveRecord::Migration
  def change
    create_table :collectemails do |t|
      t.string :email

      t.timestamps
    end
  end
end
