class CreateJoinTableCartsPosts < ActiveRecord::Migration[7.0]
  def change
    create_join_table :carts, :posts do |t|
      t.index [:cart_id, :post_id]
      t.index [:post_id, :cart_id]
    end
  end
end
