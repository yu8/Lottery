# encoding: utf-8

class Lottery
  def initialize(size)
    @size = size
    @members = [] 
  end

  def add(name,weight)
    (1..weight).each do |num|
      @members.push(name)
    end
  end

  def winners
    @hits = []
    if @members.uniq.size < @size
      @hits = @members.uniq
    else
      (1..@size).each do |num|
        hitman = @members.sample
        @hits.push(hitman)
        @members.delete(hitman)
      end
    end
    @hits
  end
end

