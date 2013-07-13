class Player
  def initialize(window)
    @image = Gosu::Image.new(window, "jet.gif", false)
    @bullet = Gosu::Image.new(window, "bullet.png", false)
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
  end

  def warp(x, y)
    @x, @y = x, y
  end
  
  def turn_left
    @angle -= 4.5
  end
  
  def turn_right
    @angle += 4.5
  end

  def shift_right
  	if @x >= 625
  		#do not move to the far right!
  	else
  	  @x += 4.5
  	end
  end

  def shift_left
  	if @x <= 15
  		#do not move to the far left!
  	else
  	  @x -= 4.5
  	end
  end
  
  def accelerate
    @vel_x += Gosu::offset_x(@angle, 0.5)
    @vel_y += Gosu::offset_y(@angle, 0.5)
  end
  
  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 640
    @y %= 480
    
    @vel_x *= 0.95
    @vel_y *= 0.95
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
    @bullet.draw_rot(@x, @y-40, 1, @angle)
  end

  def fire
    
  end
end