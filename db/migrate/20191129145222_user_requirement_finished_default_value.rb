class UserRequirementFinishedDefaultValue < ActiveRecord::Migration[5.2]
  def change
    change_column :user_requirements, :finished, :boolean, :default => false
  end
end
