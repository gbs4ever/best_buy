class Controller
    def call

        puts "Welcome to Best buy deal of the day."
        puts "To list today's deals enter 'deal'."
        puts "what would you like to do"
        puts "To quit type exit. "
       
 #remove white space in menu
 #bug 1 exit works but still puts out invaild command
        input = nil
        while input !=  "exit"
        input= gets.strip.downcase
            case input
           when "deal"
               deal
              sleep 0.6
              puts "For more information please type yes"
            when "yes"
             info(file.url)
            else
            puts "Invaild command please type a vaild command."
            #puts "what would you like to do, press current deals or exit."
            end

        end
    end
        def  deal
            puts "Hold on one second we are searching the web ..........................."
            puts "Sorry for the wait , your patience is duly noted !" 
            file=Scraper.url
            #  Item.all.each.with_index  do |item,i| when i swirch do many deals
         price=file.price.split(" ").map {|x| x[/\d+/]}.compact.join("").to_i
        puts "Today's deals #{file.name} $#{price}"
        end
        
        
        #still broken
        def info(item)

            Scraper.more_info(item)
            binding.pry
            puts  <<-DOC
            1.deal 1
            2. deal2
            3. deal 3
            4.deal 
            DOC
        end









end
