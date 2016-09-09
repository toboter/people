class CreateAffiliations < ActiveRecord::Migration[5.0]
  def change
    create_table :affiliations do |t|
      t.references :person, foreign_key: true
      t.references :institution, foreign_key: true
      t.date :from
      t.date :till

      t.timestamps
    end
  end
end
