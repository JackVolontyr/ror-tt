class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.string :file
      t.belongs_to :question, index: true, foreign_key: true
      t.belongs_to :answer, index: true, foreign_key: true

      t.timestamps
    end
  end
end
