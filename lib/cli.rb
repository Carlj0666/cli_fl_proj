class CLI
  
  def start #start instance method
    puts "The David Bowie DB is happening now, not tomorrow...".black.on_light_blue.bold #prints welcome messsage
    puts "\n"
    sleep(3) #waits to run API for (seconds)
    API.get_albums #runs API.rb to grab info from API and makes DB_Record instances
    puts "Hello, I'm the machine spirit of David Bowie come to share my albums with you."
    puts "\n".black.on_green
    sleep(1)
    self.db_menu
  end
  
  def db_menu
    
    puts "Type 'records' for a list of my albums, or type 'exit' to quit.".black.on_light_blue.bold
    puts "\n".black.on_green
    
    user_entry = gets.strip.downcase #gets the user entry
    
    if user_entry == "exit" #option to exit in main menu
      puts "\n"
      puts '"If it works it\'s out of date"' "\n- David Bowie" 
      
    elsif user_entry != "records" #logic for user input choice, chose records or sorted
      
      puts "I ask for so little. Let's start from the beginning."
      puts "\n"
      sleep(2)
      db_menu
      
    else
      puts "\n"
      puts '"This chaos is killing me..."'
      sleep(3)
      puts "\n"
      puts "Select a number between 1 - 24 to access the corresponding album.".black.on_light_blue.bold
      sleep(5)
      puts "\n"
      show_list_of_albums
      
      user_record_selector
      
      db_menu
      
    end
  end
    
  def show_list_of_albums
    DB_Record.all.each.with_index(1) do |record, index| #iterate through indexes of the DB_Record array
    puts "#{index} - #{record.name}"#print each album out
    end
  end
      
      
  def user_record_selector
    
    puts "Select a number between 1 - 24 to access the corresponding album.".black.on_light_blue.bold
    puts "\n"
    
    user_index_selection = gets.strip.downcase.to_i - 1 

    puts '"I\'ve been waiting for you, for such a long time now."'
    puts "\n"
    
    if !user_index_selection.between?(0, DB_Record.all.length - 1)
      user_record_selector
    
    else
      current_record_instance = DB_Record.all[user_index_selection]
      puts "You've chosen: #{current_record_instance.name}"
      puts"\n"
      record_detail_viewer(current_record_instance)
    end
  end
      
      
  def record_detail_viewer(current_record)
    puts "Artist: db \n Record Name: #{current_record.name} \n Genre: #{current_record.genre} \n Release Year: #{current_record.release_year} \n Label: #{current_record.label} \n Description: #{current_record.description}\n"
    puts "\n"
  end
  
end

