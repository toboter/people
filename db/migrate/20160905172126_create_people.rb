class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :given_name
      t.string :first_names
      t.string :family_name
      t.string :honorific_prefix
      t.string :honorific_suffix
      t.string :gender
      t.datetime :birthday
      t.datetime :deathday
      t.text :about
      t.string :place_of_birth
      t.string :place_of_death
      t.string :profession

      t.timestamps
    end
  end
end
