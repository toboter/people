class ChangeDatetimeToDatePerson < ActiveRecord::Migration[5.0]
  def change
    change_column :people, :birthday, :date
    change_column :people, :deathday, :date
  end
end
