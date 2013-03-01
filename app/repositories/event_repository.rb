module EventRepository
  extend ActiveSupport::Concern

  include UsefullScopes

  included do
    scope :new_and_in_voting, -> { where(state: [:new, :voted]) }
    scope :web, ->{by_created_at}
    scope :scheduled, -> { where(state: :in_schedule) }
    scope :voted, -> { where(state: :voted) }
    scope :by_votes, -> { by_votings_count }
    scope :with_active_speaker, -> { joins(:speaker).where("users.state = ?", :active) }
  end
end