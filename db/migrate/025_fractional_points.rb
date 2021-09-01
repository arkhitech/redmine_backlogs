class FractionalPoints < ActiveRecord::Migration[4.2]
  def self.up
    if column_exists? :issues, :story_points
      add_column :issues, :fractional_story_points, :float
      execute "update issues set fractional_story_points = story_points"
  
      change_column :issues, :story_points, :float
      execute "update issues set story_points = fractional_story_points"
      remove_column :issues, :fractional_story_points
    else
      add_column :issues, :story_points, :float
    end

  end

  def self.down
    puts "Reverting irreversible migration"
  end
end
