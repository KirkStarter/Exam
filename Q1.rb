# Компонент
class Mojito
  def cost
    35
  end

  def description
    "Мохіто"
  end
end

# Абстрактний декоратор
class MojitoDecorator
  def initialize(mojito)
    @mojito = mojito
  end

  def cost
    @mojito.cost
  end

  def description
    @mojito.description
  end
end

# Конкретний декоратор - Додаткова м'ята
class MintDecorator < MojitoDecorator
  def cost
    @mojito.cost + 10
  end

  def description
    @mojito.description + " з додатковою м'ятою"
  end
end

# Конкретний декоратор - Додатковий ром
class SugarDecorator < MojitoDecorator
  def cost
    @mojito.cost + 15
  end

  def description
    @mojito.description + " з ромом"
  end
end

# Використання
simple_mojito = Mojito.new
puts "Спрощене Мохіто: #{simple_mojito.description}, Ціна: #{simple_mojito.cost} грн"

mint_mojito = MintDecorator.new(simple_mojito)
puts "Мохіто Extra: #{mint_mojito.description}, Ціна: #{mint_mojito.cost} грн"

sugar_mint_mojito = SugarDecorator.new(mint_mojito)
puts "АлкоМохіто : #{sugar_mint_mojito.description}, Ціна: #{sugar_mint_mojito.cost} грн"
