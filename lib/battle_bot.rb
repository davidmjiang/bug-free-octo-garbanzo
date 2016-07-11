class BattleBot
  @@count=0
  attr_reader :name, :health, :enemies, :weapon

  def initialize(name)
    @name=name
    @health=100
    @enemies=[]
    @weapon=nil
    @@count +=1
  end

def dead?
 @@count -=1 if @health==0
 @health==0
end

def has_weapon?
  !!@weapon
end

def pick_up(weapon)
  raise ArgumentError unless weapon.is_a? Weapon
  raise ArgumentError if weapon.picked_up?
  if has_weapon?
    return nil
  else
    @weapon=weapon
    weapon.bot=(self)
    weapon
  end
end

def drop_weapon
  @weapon.bot=nil
  @weapon=nil
end

def take_damage(damage)
  raise ArgumentError unless damage.is_a? Fixnum
  @health-=damage
  @health=0 if @health<0
  @health
end

def heal
  unless dead?
    @health +=10
    @health=100 if @health>100
    @health
  end
end

def attack(bot)
  raise ArgumentError unless bot.is_a?BattleBot
  raise ArgumentError if bot==self
  raise ArgumentError unless has_weapon?
  bot.receive_attack_from(self)
end

def receive_attack_from(bot)
  raise ArgumentError unless bot.is_a?BattleBot
  raise ArgumentError if bot==self
  raise ArgumentError unless bot.has_weapon?
  take_damage(bot.weapon.damage)
  @enemies << bot unless @enemies.include?bot
  defend_against(bot)
end

def defend_against(bot)
  if !dead? && has_weapon?
    attack(bot)
 end
end



end