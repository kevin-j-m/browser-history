class AddDefaultSearchedAtToQueries < ActiveRecord::Migration[7.0]
  def up
    change_column :queries, :searched_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end

  def down
    change_column_default(:queries, :searched_at, nil)
  end
end
