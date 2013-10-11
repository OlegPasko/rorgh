class AddCorrectionCommentsToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :correction_comment, :text
  end
end
