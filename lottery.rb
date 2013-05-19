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
    hits = hits.compact
    hits
  end
end
