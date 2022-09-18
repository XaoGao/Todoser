class SomeJob
  include Sidekiq::Job

  def perform(*args)
    puts "-" * 25
    puts "some message"
    puts "-" * 25
    1
  end
end
