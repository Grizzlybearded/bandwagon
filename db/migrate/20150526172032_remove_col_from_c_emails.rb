class RemoveColFromCEmails < ActiveRecord::Migration
  def change
  	remove_column :collectemails, :access_code
  end
end
