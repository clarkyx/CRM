class Contact

  attr_accessor :firstn, :lastn, :email, :note
  attr_reader :id
  @@contacts = {}
  @@gid = 1
  @@functions = ['add','modify','delete','display all','search by attribute(sba)','exit']
  #initialization
  def initialize(firstn,lastn,email,note)
    @firstn = firstn
    @lastn = lastn
    @email = email
    @note = note
    @id = @@gid
    @@gid += 1
    puts "*************************"
    puts "successful added contact"
    puts "*************************"
  end

  #return all the available funcationalities
  def self.allfuns
    puts "******Here are all the commands******"
    puts @@functions
    puts "*************************************"
  end

  #add new contact
  def self.add(firstn,lastn,email,note)
    @@contacts[@@gid] = Contact.new(firstn,lastn,email,note)
  end

  #delete contact based on id
  def self.delete(id)
    @@contacts.delete(id)
    puts "****contact successful deleted****"
  end

  #display all contact information
  def self.displayall
    @@contacts.each do |id,contact|
      puts "*******#{id}*******"
      puts "firstname : #{contact.firstn}"
      puts "lastname  : #{contact.lastn}"
      puts "email     : #{contact.email}"
      puts "note      : #{contact.note} \n"
      puts "***************\n"
    end
  end

  #display contact by using id form
  def self.display_by_id
    @@contacts.each do |id,contact|
      puts "***************"
      puts "id: #{contact.id}"
      puts "firstname: #{contact.firstn}    lastname: #{contact.lastn}"
      puts "***************\n"
    end
  end

  #modify current contact with the providing id name and value
  def self.modify(id,name,value)
    @@contacts.each do |i,v|
      if i == id
        @@contacts[i].send("#{name}=",value)
        puts "contact successful updated"
      end
    end
  end

  #find the contact based on search criteria
  def self.sba(name,value)
    @@contacts.each do |id,contact|
      if (@@contacts[id].instance_variable_get('@'+name) == value)
        Contact.display(@@contacts[id])
      else
        puts "cound't find match result"
      end
    end
  end

  #display contact based on particular id 
  def self.display(contact)
    puts "***************"
    puts "id: #{contact.id}"
    puts "firstname: #{contact.firstn}    lastname: #{contact.lastn}"
    puts "***************\n"
  end

end
