module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    for element in self
      yield(element, index)
      index += 1
    end
  end


  def my_select
    selected = []
    for element in self
      if yield(element)
        selected << element
      end
    end
    return selected
  end


  def my_all?
    for element in self
      if !yield(element)
        return false
      end
    end
    return true
  end


  def my_any?
    for element in self
      if yield(element)
        return true
      end
    end
    return false
  end


  def my_none?
    for element in self
      if yield(element)
        return false
      end
    end
    return true
  end


  def my_count
    return self.size unless block_given?

    count = 0
    for element in self
      if yield(element)
        count += 1
      end
    end
    return count
  end


  def my_map
    array = []
    for element in self
      array << yield(element)
    end
    return array
  end


  def my_inject(initial = nil, &block)
    if initial.nil? # If no initial value is given...
      accumulator = self.first # Use first element as accumulator
      collection = self[1..] # Skip first element when looping
    else # If initial value is given...
      accumulator = initial # Use initial value as accumulator
      collection = self # Include all elements when looping
    end

    # Iterate through elements and update the accumulator
    for element in collection
      accumulator = block.call(accumulator, element)
    end

    return accumulator
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return enum_for(:my_each) unless block_given?

    for i in self # To iterate over each element
      yield(i)  # To pass each element to the block
    end
    self # Returns self, just like each
  end
end
