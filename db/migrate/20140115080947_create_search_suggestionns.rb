class CreateSearchSuggestionns < ActiveRecord::Migration
  def change
    create_table :search_suggestionns do |t|
      t.string :term
      t.integer :popularity

      t.timestamps
    end
  end
end
