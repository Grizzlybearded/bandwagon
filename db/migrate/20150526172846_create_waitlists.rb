class CreateWaitlists < ActiveRecord::Migration
  def change
    create_table :waitlists do |t|
      t.string :waitemail

      t.timestamps
    end
  end
end
