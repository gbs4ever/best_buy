class Controller
    def call

        puts "Welcome to Amazon's lightning deals."
        puts "To list today's deals enter 'current deals'."
        puts "what would you like to do"
        puts "To quit type exit. "

         #remove white space in menu
     #menu needs more flexobilty
     # needs more commands
     #bug 1 exit works but still puts out invaild command
        input = nil
        while input !=  "exit"
        input= gets.strip
            case input
            when "current deals"
            current_deals
            when "test"
            deals
            else
            puts "Invaild command please type a vaild command."
            puts "what would you like to do, press current deals or exit."
            end

        end
    end
        def  deals# list one
        Scrapper.new.url            #scrape_items
            Item.all.each.with_index  do |item,i|
            puts "#{i}. #{item.name} - #{item.price}."
            end
        end
            def current_deals
              puts <<-DOC
                1.deal 1
                2. deal2
                3. deal 3
                4.deal 4

                For more info please press type 1
                DOC
            end









end
