class CreateJoinTableRequirementsContents < ActiveRecord::Migration[5.2]
  def change
    create_join_table :requirements, :contents do |t|
      t.index [:requirement_id, :content_id]
      t.index [:content_id, :requirement_id]
    end
  end
end
