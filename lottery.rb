# encoding: utf-8

class Lottery
  def initialize(size)
    @size = size
    @members = [] 
  end

  def add(name,weight)
    @members.concat Array.new(weight,name)
  end

  def winners
    hits = []
    members = @members.dup
    @size.times do 
      hitman = members.sample
      hits.push(hitman)
      members.delete(hitman)
    end
    hits.compact
  end
end

lottery = Lottery.new(3)
lottery.add('John', 1) # 確率  1/20
lottery.add('Tom',  2) #       2/20
lottery.add('Bill', 5) #       5/20
lottery.add('Woz',  2) #       2/20
lottery.add('Ken', 10) #      10/20

result = Hash.new(0)
10000.times do
  lottery.winners.each do |member|
    result[member] += 1
  end
end

puts result
