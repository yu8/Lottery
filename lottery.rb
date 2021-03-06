# encoding: utf-8

class Lottery
  def initialize(max_winners)
    @max_winners = max_winners
    @members = [] 
  end

  def add(name, weight)
    @members.concat(Array.new(weight, name))
  end

  def winners
    hits = []
    members = @members.dup
    @max_winners.times do 
      winner = members.sample
      hits.push(winner)
      members.delete(winner)
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
