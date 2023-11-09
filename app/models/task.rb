class Task < ApplicationRecord
  after_create :set_hashed_id

  validates :title, presence: true

  private
  def set_hashed_id
    hashed_id = self.id.hash.to_s(36)
    self.update_column(:hashed_id, hashed_id)
  end
end
