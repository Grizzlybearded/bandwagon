class ColsToEmailCollection < ActiveRecord::Migration
  def change  
  	add_column :collectemails, :unsubscribe_token, :string
  	add_column :collectemails, :send_email, :boolean, default: true
  end
end
