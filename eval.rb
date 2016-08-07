# require 'ostruct'
#
# class PointBuilder
#   attr_accessor :x_coord
#
#   def temps *temps
#     @temps = temps
#   end
#
#   def attributes
#     OpenStruct.new(x_coord: @x_coord)
#   end
# end
#
#
# class Point
#   def initialize &block
#     @builder = PointBuilder.new
#     @builder.instance_eval &block
#   end
#
#   def x_coord
#     @builder.x_coord
#   end
#
#   def attributes
#     @builder.attributes
#   end
# end
#
#
# point = Point.new do
#   x_coord 23.56
#   temps 23, 23, 34
# end
#
# puts point.attributes

class PointBuilder

  def title message
    @title = message
  end

  def show_title
    @title
  end

end


class Point
  def initialize &block
    @builder = PointBuilder.new
    @builder.instance_eval &block
  end

  def title
    @builder.show_title
  end
end

point = Point.new do
  title "hello"
end

p point.title

