def find_big_fish(array)
    biggest = ""
    array.each_with_index do |fish1, index1|
        array.each_with_index do |fish2, index2|
            if fish2.length < fish1.length
                biggest = fish1
            else
                biggest = fish2
            end
        end
    end

    biggest
end


array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

p find_big_fish(array)


def clever_octopush(array)
    biggest = array[0]

    array.each do |ele|
        if ele.length > biggest.length
            biggest = ele
        end
    end
    biggest
end

p clever_octopush(array)


def slow_dance(direction, tiles_array)
    tiles_array.each_with_index do |move, index|
        if move == direction
            return index
        end
    end
    p "move not found"
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", 
    "left",  "left-up"]

p slow_dance("up", tiles_array)
p slow_dance("down", tiles_array)
p slow_dance("left", tiles_array)
p slow_dance("right-down", tiles_array)

