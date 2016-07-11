class Weapon
  attr_reader :name, :damage, :bot

  def initialize(name, damage=0)
    raise ArugmentError unless name.is_a? String
    @name=name
    raise ArguementError unless damage.is_a? Fixnum
    @damge=damage
    @bot=nil
  end

  def bot= (bot)
    raise ArugmentError unless bot.is_a? BattleBot || bot == nil
    @bot=bot
  end
  
  def picked_up?
    @bot
  end

end