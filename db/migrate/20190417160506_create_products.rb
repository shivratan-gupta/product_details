class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
    	t.string :product_type
      t.string :product_name
      t.string :model
      t.string :brand
      t.integer :year
      t.integer :ram
      t.integer :external_storage
      t.integer :internal_storage
      t.timestamps
    end
  end
end
