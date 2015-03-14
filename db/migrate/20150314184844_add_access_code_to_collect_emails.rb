class AddAccessCodeToCollectEmails < ActiveRecord::Migration
  def change
    add_column :collectemails, :access_code, :string
  end
end
