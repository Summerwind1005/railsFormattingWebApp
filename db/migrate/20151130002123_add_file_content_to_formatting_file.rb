class AddFileContentToFormattingFile < ActiveRecord::Migration
  def change
    add_column :formatting_files, :file_content, :text
  end
end
