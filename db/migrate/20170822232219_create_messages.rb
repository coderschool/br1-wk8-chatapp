class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.belongs_to :chatroom, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.string :body

      t.timestamps
    end
  end
end
