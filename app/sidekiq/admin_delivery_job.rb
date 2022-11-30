class AdminDeliveryJob
  include Sidekiq::Job

  def perform
    puts "admin delivery job message"
  end
end
