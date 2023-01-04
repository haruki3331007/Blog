##
##
## We need title, opinion, user_id.
## user_id connencts with ID of user model. => written in model
##
##

class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :opinion
      t.integer :user_id
      t.timestamps
    end
  end
end
