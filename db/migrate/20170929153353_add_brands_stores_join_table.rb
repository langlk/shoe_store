class AddBrandsStoresJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:brands_stores) do |t|
      t.belongs_to(:brand)
      t.belongs_to(:store)
    end
  end
end
