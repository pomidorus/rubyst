require 'ostruct'

class PointBuilder
  attr_reader :x_coord

  def x_coord= double
    @x_coord = double
  end

  def temps *temps
    @temps = temps
  end

  def attributes
    OpenStruct.new(x_coord: @x_coord)
  end
end


class Point
  def initialize
    @builder = PointBuilder.new
    yield @builder
  end

  def x_coord
    @builder.x_coord
  end

  def attributes
    @builder.attributes
  end
end


point = Point.new do |builder|
  builder.x_coord = 23.56
  builder.temps 23, 23, 34
end

puts point.attributes