class Contact

  attr_accessor :firstn, :lastn, :email, :note
  attr_reader :id
  @@contacts = {}
  @@gid = 1

  @@functions = ['add','modify','delete','display all','search by attribute(sba)','exit']
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

  def self.allfuns
    puts "******Here are all the commands******"
    puts @@functions
    puts "*************************************"
  end

  def self.add(firstn,lastn,email,note)
    @@contacts[@@gid] = Contact.new(firstn,lastn,email,note)
  end

  def self.delete(id)
    @@contacts.delete(id)
    puts "****contact successful deleted****"
  end

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

  def self.display_by_id
    @@contacts.each do |id,contact|
      puts "***************"
      puts "id: #{contact.id}"
      puts "firstname: #{contact.firstn}    lastname: #{contact.lastn}"
      puts "***************\n"
    end
  end

  def self.modify(id,name,value)
    @@contacts.each do |i,v|
      if i == id
        @@contacts[i].send("#{name}=",value)
        puts "contact successful updated"
      end
    end
  end

  def self.sba(name,value)
    @@contacts.each do |id,contact|
      if (@@contacts[id].instance_variable_get('@'+name) == value)
        Contact.display(@@contacts[id])
      else
        puts "cound't find match result"
      end
    end
  end

  def self.display(contact)
    puts "***************"
    puts "id: #{contact.id}"
    puts "firstname: #{contact.firstn}    lastname: #{contact.lastn}"
    puts "***************\n"
  end

end
