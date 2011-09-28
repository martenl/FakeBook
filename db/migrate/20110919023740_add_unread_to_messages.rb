class AddUnreadToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :unread, :boolean, :default => 1
  end

  def self.down
    remove_column :messages, :unread
  end
end
