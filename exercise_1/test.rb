class Message
  attr_accessor :id, :subj, :cont

  def add_values(values)
    values.each_key do |k|
      self.send("#{k}=",values[k])
    end
  end
end

user_info = {
              :id => 3,
              :subj => "blabla_1",
              :cont => "blabla_2"
            }

test1 = Message.new

test1.add_values(user_info)
puts test1.inspect 
