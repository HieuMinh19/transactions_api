class AddAliasToBanks < ActiveRecord::Migration[6.1]
  def change
    add_column :banks, :alias, :string, :null => true
  end
end
