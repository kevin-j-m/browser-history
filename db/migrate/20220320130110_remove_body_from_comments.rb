class RemoveBodyFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :body, :string
  end
end
