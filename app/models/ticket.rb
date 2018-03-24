class Ticket < ApplicationRecord
  validates :number, presence: true

  belongs_to :train
  belongs_to :wagon
  belongs_to :user

  after_create  :send_notification
  after_destroy :send_delete

  def train_number
    "#{train.number}"
  end

  private

  def send_notification
    #TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_delete
    #TicketsMailer.delete_ticket(self.user, self).deliver_now
  end
end