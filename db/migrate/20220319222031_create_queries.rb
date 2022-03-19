class CreateQueries < ActiveRecord::Migration[7.0]
  def change
    create_table :queries do |t|
      t.string :search_term
      t.datetime :searched_at
      t.timestamps
    end
  end
end
