class CreateJoinTableClientsFreelances < ActiveRecord::Migration[5.1]
  def change
    t.index [:restaurant_id, :user_id]
  end
end
