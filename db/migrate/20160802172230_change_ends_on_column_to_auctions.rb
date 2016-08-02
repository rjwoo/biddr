class ChangeEndsOnColumnToAuctions < ActiveRecord::Migration
  def change
    remove_column :auctions, :ends_on
  end
end
