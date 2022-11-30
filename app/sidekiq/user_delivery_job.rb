class UserDeliveryJob
  include Sidekiq::Job

  def perform
    puts "user delivery job message"
  end
end
