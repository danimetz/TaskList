class AddColumnDueDate < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :due_date, :string
  end
end
