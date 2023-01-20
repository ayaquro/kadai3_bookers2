class RemoveTitleFromBook < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :title, :string
  end
end
