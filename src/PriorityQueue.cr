require "./PriorityQueue/*"

class Priorityqueue(T)

  # the position of the last element
  @position :: Int32

  @capacity :: Int32

  def initialize (initial_capacity = 3 : Int32, &comperator : T, T -> Bool)
    @comperator = comperator

    if initial_capacity < 0
      raise ArgumentError.new("negative array size: #{initial_capacity}")
    end

    initial_capacity = Math.max(initial_capacity, 3)
    @position = 0
    @capacity = initial_capacity

    @buffer = Pointer(T).malloc(initial_capacity)
  end

  def initialize (initial_capacity = 3 : Int32)
    initialize  {|a, b| a > b}
  end

  def << (elem : T)
    check_needs_resize
    @position += 1
    @buffer[@position] = elem

    siftUp(@position)

    self
  end

  # Returns the highest element, or nil if empty 
  def pop?
    pop { nil }
  end

  # Returns the highest element, or raise if empty
  def pop
    pop { raise IndexError.new }
  end

  # Returns the highest element, or yields if empty
  def pop
    if empty?
      yield
    end

    r = @buffer[1]
    @buffer[1], @buffer[@position] = @buffer[@position], @buffer[1]
    @position -= 1
    siftDown(1)

    r
  end

  def peek
    if empty?
      raise IndexError.new
    end

    @buffer[1]
  end

  private def siftUp(i : Int32)
    parent = i / 2
    if (parent > 0 && @comperator.call(@buffer[i], @buffer[parent]))
      @buffer[parent], @buffer[i] = @buffer[i], @buffer[parent]

      siftUp(parent)
    end
  end

  private def siftDown(i : Int32)
    leftChild = i * 2
    rightChild = i * 2 + 1

    if leftChild <= @position
      if rightChild <= @position
        higher = @comperator.call(@buffer[leftChild], @buffer[rightChild]) ? leftChild : rightChild 
      else
        higher = leftChild
      end

      if @comperator.call(@buffer[higher], @buffer[i])
        @buffer[higher], @buffer[i] = @buffer[i], @buffer[higher]
        siftDown(higher)
      end
    end
  end

  private def check_needs_resize
    if @buffer == @capacity
      @capacity *= 2
      @buffer = @buffer.realloc(@capacity)
    end
  end

  def empty?
    @position == 0
  end

  def print
    i = 1
    while i <= @position
      pp @buffer[i]
      i += 1
    end
  end

end
