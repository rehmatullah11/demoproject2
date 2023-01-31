class AddBugTypeToBug < ActiveRecord::Migration[7.0]
  def change
    add_column :bugs, :bug_type, :integer, default: 0
  end
end
