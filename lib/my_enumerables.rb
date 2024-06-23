module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0
    while i < self.length do
      yield self[i], i
      i += 1
    end
    return self
  end

  def my_select
    new_arr = []
    self.my_each do |elem|
      if yield(elem)
         new_arr << elem
      end
    end
    return new_arr
  end

  def my_all?
    new_arr = []
    self.my_each do |elem|
      if yield(elem)
         new_arr << elem
      end
    end
    case new_arr
    in self
      return true
    else return false
    end
  end

  def my_any?
    self.my_each do |elem|
      return true if yield(elem)
    end
    return false
  end

  def my_none?
    new_arr = []
    self.my_each do |elem|
      if yield(elem)
         new_arr << elem
      end
    end
    if new_arr.length == 0
      return true
    else return false
    end
  end

  def my_count
    count = 0
    
    if block_given?
      self.my_each do |elem|
        next unless yield(elem)  
        count += 1
      end
      return count
    else 
      return self.size
    end
  end

  def my_map
    new_arr = []
    self.my_each do |elem|
      elem = yield(elem)
      new_arr << elem
    end
    return new_arr
  end

  def my_inject(accum)
    self.my_each do |elem|
      accum = yield(accum, elem)
    end
    return accum
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    i = 0
    while i < self.length do
      yield (self[i])
      i += 1
    end
    return self
  end
end
