class CreateInstitutions < ActiveRecord::Migration[5.0]
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :phone
      t.string :fax
      t.string :url
      t.string :street
      t.string :zip
      t.string :city
      t.string :country
      t.string :slug

      t.timestamps
    end
    add_index :institutions, :slug, unique: true
  end
end
