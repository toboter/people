class CreateParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table :participations do |t|
      t.references :person, foreign_key: true
      t.date :from
      t.date :till
      t.string :competence
      t.text :comment

      t.timestamps
    end
  end
end
