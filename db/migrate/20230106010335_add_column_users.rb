class AddColumnUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :introduction, :string, default: '', null: true
  end
end
