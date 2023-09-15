class ToyRobot
    def initialize
      @x = nil
      @y = nil
      @facing = nil
    end
  
    def place(x, y, facing)
      if valid_placement?(x, y, facing)
        @x = x
        @y = y
        @facing = facing
      end
    end
  
    def move
      return unless placed?
  
      case @facing
      when 'NORTH'
        @y += 1 if @y < 4
      when 'SOUTH'
        @y -= 1 if @y > 0
      when 'EAST'
        @x += 1 if @x < 4
      when 'WEST'
        @x -= 1 if @x > 0
      end
    end
  
    def left
      return unless placed?
  
      case @facing
      when 'NORTH'
        @facing = 'WEST'
      when 'SOUTH'
        @facing = 'EAST'
      when 'EAST'
        @facing = 'NORTH'
      when 'WEST'
        @facing = 'SOUTH'
      end
    end
  
    def right
      return unless placed?
  
      case @facing
      when 'NORTH'
        @facing = 'EAST'
      when 'SOUTH'
        @facing = 'WEST'
      when 'EAST'
        @facing = 'SOUTH'
      when 'WEST'
        @facing = 'NORTH'
      end
    end
  
    def report
      return unless placed?
  
      puts "Output: #{@x},#{@y},#{@facing}"
    end
  
    private
  
    def placed?
      !@x.nil? && !@y.nil? && !@facing.nil?
    end
  
    def valid_placement?(x, y, facing)
      x.between?(0, 4) && y.between?(0, 4) &&
        ['NORTH', 'SOUTH', 'EAST', 'WEST'].include?(facing)
    end
  end
  
  # Main program
  robot = ToyRobot.new
  
  loop do
    input = gets.chomp.upcase
    case input
    when /^PLACE (\d+),(\d+),(NORTH|SOUTH|EAST|WEST)$/
      robot.place($1.to_i, $2.to_i, $3)
    when 'MOVE'
      robot.move
    when 'LEFT'
      robot.left
    when 'RIGHT'
      robot.right
    when 'REPORT'
      robot.report
    when 'EXIT'
      break
    else
      puts 'Invalid command. Please enter a valid command (e.g., PLACE, MOVE, LEFT, RIGHT, REPORT, EXIT).'
    end
  end