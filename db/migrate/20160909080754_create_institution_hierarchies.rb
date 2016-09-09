class CreateInstitutionHierarchies < ActiveRecord::Migration
  def change
    create_table :institution_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :institution_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "institution_anc_desc_idx"

    add_index :institution_hierarchies, [:descendant_id],
      name: "institution_desc_idx"
  end
end
