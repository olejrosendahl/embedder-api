class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :file_id

      t.timestamps null: false
    end
  end
end
