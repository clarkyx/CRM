class CRM
  def initialize
    main_meau
  end

  def main_meau
    while true
      puts "Greetings!"
      puts "please enter commands, enter li to list all available commands, enter exit to exit the program"
      cm = gets.chomp!
      break if cm.downcase == "exit"
      Contact.allfuns if cm.downcase == "li"
      if cm == "add"
        puts "please input user information follow the pattern: firstname,lastname,email,note"
        com = gets.chomp!.split(/,/)
        Contact.add(*com)
      elsif cm == "delete"
        Contact.display_by_id
        puts "please selet the id you want to delete, type quit to quit current process"
        com = gets.chomp!
        next if com == "quit"
        Contact.delete(com.to_i)
      elsif cm == "display all"
        Contact.displayall
      elsif cm == "modify"
        Contact.display_by_id
        puts "please select the id you want to modify,type quit to quit current process"
        com = gets.chomp!
        next if com == "quit"
        puts "please select the attribute you want to modify: firstn,lastn,email,note,type quit to quit current process"
        att = gets.chomp!
        next if att == "quit"
        puts "please input the new attribute value,type quit to quit current process"
        val = gets.chomp!
        next if val == "quit"
        Contact.modify(com.to_i,att,val)
      elsif cm == "search by attribute"
        puts "please enter search term category firstn, lastn,email,note"
        com = gets.chomp!
        puts "please enter search term value"
        att = gets.chomp!
        Contact.sba(com,att)
      end
    end
  end
end

newcrm = CRM.new
