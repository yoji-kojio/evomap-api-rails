class RemoveUserFromCareers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :careers, :user, foreign_key: true
  end
end
