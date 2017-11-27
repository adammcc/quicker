module Quicker
  @@start = Time.now

  def start
    @@start = Time.now
    marker
    puts "Started"
    puts "Elapsed time: 0ms"
    marker
  end

  def check(text = nil)
    marker
    puts text if text
    puts "Method: #{caller_locations(1,1)[0].label}"
    puts "Elapsed time: #{(Time.now - @@start) * 1000}ms"
    marker
  end

  def finish(benchmark = nil)
    marker
    total_time = Time.now - @@start
    puts "Finished!"
    puts "Total elapsed time: #{total_time * 1000}ms"

    if benchmark
      from_goal = benchmark - (total_time * 1000)
      if from_goal >= 0
        puts "Whoa, that's fast! You beat your goal by #{from_goal}ms"
      else
        puts "Darn! You missed your goal by #{from_goal.abs}ms"
      end
    end
    marker
  end

  private

  def marker
    puts '-' * 50
  end
end
