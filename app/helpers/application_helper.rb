module ApplicationHelper
    def time_based_greeting
    current_hour = Time.current.hour
    
    if current_hour.between?(5, 11)
      "Good morning!"
    elsif current_hour.between?(12, 16)
      "Good afternoon!"
    elsif current_hour.between?(17, 20)
      "Good evening!"
    else
      "Good night!"
    end
  end
  def precise_time_ago(last_visited)
    return "Never visited" unless last_visited
    
    seconds_ago = (Time.current.to_f - last_visited.to_f).round(1)
    
    if seconds_ago < 60
      "#{seconds_ago} seconds ago"
    else
      minutes = (seconds_ago / 60).floor
      seconds = (seconds_ago % 60).round
      "#{minutes} minute#{'s' unless minutes == 1} and #{seconds} second#{'s' unless seconds == 1} ago"
    end
  end

end
