class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :Title
      t.date :Released
      t.string :Director
      t.text :Plot
      t.string :Poster

      t.timestamps null: false
    end
  end
end