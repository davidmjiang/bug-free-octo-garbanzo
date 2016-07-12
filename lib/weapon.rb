class Weapon

  attr_reader :name, :damage, :bot

  def initialize(name, damage=0)
    raise ArgumentError unless name.is_a? String
    raise ArgumentError unless damage.is_a? Fixnum
    @name=name
    @damage=damage
    @bot=nil
  end

  def bot=(assignment)
    unless assignment == nil||assignment.is_a?(BattleBot)
      raise ArgumentError
    end
    @bot=assignment   
  end
  
  def picked_up?
    !!@bot
  end
end