class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :post_id
      t.string :link
      t.text :comment
      t.string :status, default: 'new'

      t.timestamps
    end
  end
end
