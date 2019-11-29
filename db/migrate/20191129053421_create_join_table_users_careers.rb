class CreateJoinTableUsersCareers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :careers do |t|
      t.index [:user_id, :career_id]
      t.index [:career_id, :user_id]
    end
  end
end
