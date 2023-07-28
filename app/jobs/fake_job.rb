class FakeJob < ApplicationJob
  queue_as :default

  def perform
    puts "hi i'm a fake job"
    sleep(5)
    puts "finished"
  end
end
