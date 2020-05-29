class AssociateEventAndCreator < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :user, foreign_key: true, index: true
  end
end
