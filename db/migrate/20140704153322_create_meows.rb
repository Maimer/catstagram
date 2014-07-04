class CreateMeows < ActiveRecord::Migration
  def change
    create_table :meows do |t|
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
