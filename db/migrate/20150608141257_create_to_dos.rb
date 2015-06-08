class CreateToDos < ActiveRecord::Migration
  def change
    create_table :to_dos do |t|
      t.string :desc
      t.boolean :completed
      t.date :due_on
      t.string :category

      t.timestamps null: false
    end
  end
end
