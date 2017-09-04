class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.string :description
      t.datetime :due
      t.boolean :done

      t.timestamps
    end
  end
end
