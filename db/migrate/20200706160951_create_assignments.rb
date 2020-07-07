class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.string :username
      t.string :message_id

      t.timestamps
    end
  end
end
