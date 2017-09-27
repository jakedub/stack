class AddTotalCountToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :totalcount, :integer
  end
end
