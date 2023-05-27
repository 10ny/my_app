class AddDetailToBeansposts < ActiveRecord::Migration[7.0]
  def change
    add_column :beansposts, :product_name, :string
    add_column :beansposts, :roast, :integer
    add_column :beansposts, :country, :string
    add_column :beansposts, :shop_name, :string
    add_column :beansposts, :grams, :integer
    add_column :beansposts, :price, :integer
    add_column :beansposts, :date, :date
    add_column :beansposts, :brew, :string
    add_column :beansposts, :roaster, :string

    add_index :beansposts, :product_name
    add_index :beansposts, :roast
  end
end
