class RemoveProfessionFromPerson < ActiveRecord::Migration[5.0]
  def change
    remove_column :people, :profession
  end
end