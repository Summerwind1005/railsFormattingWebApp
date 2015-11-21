class CreateFormattingFiles < ActiveRecord::Migration
  def change
    create_table :formatting_files do |t|
      t.string :name
      t.string :extention

      t.timestamps null: false
    end
  end
end
