class Stack
    
    attr_reader :stack

    def initialize(array)
        @stack = array
    end
  
    def push(el)
        if @stack.include
        @stack << el
        end
    end
  
    def pop
      @stack = @stack[0..-2]
      return @stack

    end
  
    def peek
      @stack[0]

    end
end


class Queue

    attr_reader :queue

    def initialize(array)
        @queue = array
    end

    def enqueue(ele)
        @queue.push(ele)

    end

    def dequeue
        @queue.shift
        @queue
    end

    def peek
        @queue[0]
    end

end


class Map


    def initialize(arrays)
        list = []
        (0...arrays.length).each do |i|
            if list.include?(arrays[i][0])
                raise "No duplicate Keys!"
            else
                list << arrays[i][0]
            end
        end

        @map = arrays
    end

    def set(key, value)
        has_key = false
        (0...@map.length).each do |i|
            if @map[i][0] == key
                @map[i][1] = value
                has_key = true
            end
        end
        
        if has_key == false
            @map << [key, value]
        end


        @map
    end

    def get(key)

        (0...@map.length).each do |i|
            if @map[i][0] == key
                return @map[i]
            else
                raise "key not found"
            end
        end
    end

    def delete(key)

        (0...@map.length).each do |i|
            if @map[i][0] == key
                @map = @map[0...i] + @map[i + 1..-1]
                return @map
            end
        end
        raise "Key not found"
    end

    def show
        @map
    end
    
end
