def mars_rovers(world, *args)
  rovers_instructions = args.map!{|x| x.split(") ") }

  rovers_instructions.each do |arr|
    arr[0] = arr[0].slice(1..-1).split(", ").map{|str| Integer(str) rescue str}
  end

  raise 'Rover instructions are missing!' if rovers_instructions.empty?

  rovers_instructions.each do |rover_instruction|
    raise 'Unexpected rover instruction length!' unless rover_instruction.length === 2
    x, y, o = rover_instruction[0]
    raise "Unexpected orientation: '#{o}'" unless %w[N E S W].include? o
    commands = rover_instruction[1]

    commands.each_char do |action|
      raise "Unexpected command: '#{action}'" unless %w[L R F].include? action
      if action == 'F'
        x, y = forward(x, y, o)
      else
        o = turn(o, action)
      end
    end

    x, y, lost = validate_map(x, y)

    puts "(#{x}, #{y}, #{o})#{lost}"
  end
end

def forward x, y, orientation
  case orientation
  when 'N'
    y += 1
  when 'E'
    x += 1
  when 'S'
    y -= 1
  when 'W'
    x -= 1
  end

  [x, y]
end

def turn orientation, action
  compass = ['N', 'E', 'S', 'W']
  direction = (action === 'L') ? -1 : 1

  return 'N' if [orientation, direction] == ['W', 1]
  compass[compass.index(orientation) + direction]
end

def validate_map x, y
  lost = (x.negative? || y.negative?) ? ' LOST' : ''
  x = 0 if x.negative?
  y = 0 if y.negative?

  [x, y, lost]
end

banner = <<-BANNER
Usage: ruby mars_rovers.rb "world" ["rover_data"]

     ARG      |       DESCRIPTION       |     EXAMPLE
   "world"    |   the size of the map   |      "4 8"
 "rover_data" | rover coords & commands |  "(2, 3, E) LFRFF"

-h, --help           Prints this message
BANNER

if ARGV[0] == "-h" || ARGV[0] == "--help"
  puts banner
  exit
end

mars_rovers(*ARGV)
