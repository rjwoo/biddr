class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.text :title
      t.text :details
      t.datetime :ends_on
      t.float :reserve_price

      t.timestamps null: false
    end
  end
end
