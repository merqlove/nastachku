class Slot < ActiveRecord::Base
  include SlotRepository

  class << self
    def available_events
      [ "Lecture", "Event" ]
    end
  end

  attr_accessible :event_id, :event_type, :finish_time, :hall_id, :start_time

  belongs_to :hall
  belongs_to :event, polymorphic: true

  validates :start_time, presence: true
  validates :finish_time, presence: true
  validates :event_id, presence: true
  validates :event, presence: true
  validates :event_type, presence: true, inclusion: { in: self.available_events }

  def start_hour
    start_time.hour
  end

  def start_offset
    start_time.min
  end

  def duration
    (finish_time - start_time).to_int / 60
  end
end