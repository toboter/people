class CreateProficiencies < ActiveRecord::Migration[5.0]
  def change
    create_table :proficiencies do |t|
      t.references :person, foreign_key: true
      t.references :profession, foreign_key: true

      t.timestamps
    end
  end
end
