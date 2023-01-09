class AddColumnBody < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :opinion, :string
    add_column :books, :body, :string
  end
end
