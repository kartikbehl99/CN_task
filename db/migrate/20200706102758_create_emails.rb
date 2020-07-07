class CreateEmails < ActiveRecord::Migration[6.0]
  def change
    create_table :emails do |t|
      t.string :from
      t.string :subject
      t.string :message_id
      t.text :body
      t.string :status
      t.timestamps
    end
  end
end
