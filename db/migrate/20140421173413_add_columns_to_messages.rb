class AddColumnsToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :to, :string
    add_column :messages, :from, :string
    add_column :messages, :body, :string
    add_column :messages, :status, :string
  end
end
