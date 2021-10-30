class ChangeTypeExpirationDate < ActiveRecord::Migration[6.1]
  def up
    change_table :posts do |t|
      t.change :expirationDate, :datetime
    end
  end

  def down
    change_table :posts do |t|
      t.change :expirationDate, :date
    end
  end
end
