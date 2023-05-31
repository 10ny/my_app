class AddImageToBeanspost < ActiveRecord::Migration[7.0]
  def change
    add_column :beansposts, :image, :string
  end
end
