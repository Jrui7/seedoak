class AddPriceToSeeds < ActiveRecord::Migration[5.0]
  def change
    add_monetize :seeds, :price, currency: { present: false }
  end
end
