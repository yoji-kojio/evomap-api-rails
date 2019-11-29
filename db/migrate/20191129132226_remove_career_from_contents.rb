class RemoveCareerFromContents < ActiveRecord::Migration[5.2]
  def change
    remove_reference :contents, :career, foreign_key: true
  end
end
