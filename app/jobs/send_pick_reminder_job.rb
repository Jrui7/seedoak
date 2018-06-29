class SendPickReminderJob < ApplicationJob
  queue_as :default

  def perform
    picks = Pick.where(reminder: false, state: "pending", created_at: (Time.now.midnight - 1.day)..Time.now.midnight)
    picks.each do |pick|
      PickreminderMailer.send_reminder_email(pick.id, pick.user_id)
      pick.reminder = true
      pick.save
      puts "email sent"
    end
  end
end
