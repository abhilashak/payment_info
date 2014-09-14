class CreateInitialData < ActiveRecord::Migration
  def up
    create_table :merchants do |t|
      t.string :name 
      t.integer :fixed_rate
      t.integer :min_rate_amt
      t.integer :max_rate_amt

      t.timestamps
    end 

    create_table :payment_methods do |t|
      t.string :name 
      t.string :type 
      t.integer :rate
      t.integer :merchant_id

      t.timestamps
    end 
  end

  def down
    drop_table :merchants
    drop_table :payment_methods	
  end
end
