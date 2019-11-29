class RemoveContentFromRequirements < ActiveRecord::Migration[5.2]
  def change
    remove_reference :requirements, :content, foreign_key: true
  end
end
