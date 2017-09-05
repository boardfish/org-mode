class RemoveDone < ActiveRecord::Migration[5.1]
  def change
    remove_column :todos, :done
  end
end
