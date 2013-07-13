require 'gosu'
require './player.rb'

class SkysOfGlory < Gosu::Window

	def initialize
		super(640, 480, false)
		self.caption = "Skys of Glory"
		@jet = Gosu::Image.new(self, "jet.gif", false)
		
		@background_image = Gosu::Image.new(self, "space.png", true)
		@x = @y = @vel_x = @vel_y = @angle = 0.0
		@score = 0
		@player = Player.new(self)
		#@player.warp(320, 240)

		# place the player at bottom middle of window
		@player.warp(640/2,460)
	end
 	

 	def update
    if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft then
      #@player.turn_left
      @player.shift_left
    end
    if button_down? Gosu::KbRight or button_down? Gosu::GpRight then
      #@player.turn_right
      @player.shift_right
    end
    if button_down? Gosu::KbUp or button_down? Gosu::GpButton0 then
      #@player.accelerate
      @player.fire
    end
    @player.move
  end

  def draw
    @player.draw
    @background_image.draw(0, 0, 0);
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end

end

game = SkysOfGlory.new
game.show
