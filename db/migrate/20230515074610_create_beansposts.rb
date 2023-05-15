class CreateBeansposts < ActiveRecord::Migration[7.0]
  def change
    create_table :beansposts do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :beansposts, [:user_id, :created_at]
  end
end
