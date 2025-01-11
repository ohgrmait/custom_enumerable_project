module Enumerable
  # Your code goes here
  def my_each_with_index
    self.length.times do |n|
      yield self[n], n
    end
    
    self
  end

  def my_select
    arr = []
    self.my_each do |elem|
      arr << elem if yield(elem)
    end

    arr
  end

  def my_all?
    self.my_each do |elem|
      return false unless yield(elem)
    end

    true
  end

  def my_any?
    self.my_each do |elem|
      return true if yield(elem)
    end

    false
  end

  def my_none?
    self.my_each do |elem|
      return false if yield(elem)
    end

    true
  end

  def my_count
    return self.size unless block_given?

    counter = 0
    self.my_each do |elem|
      counter += 1 if yield(elem)
    end

    counter
  end

  def my_map
    my_self = []
    self.my_each do |elem|
      my_self << yield(elem)
    end

    my_self
  end

  def my_inject(acc = nil, &my_block)
    self.my_each do |elem|
      acc = my_block.call(acc, elem)
    end

    acc
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    self.length.times do |n|
      yield(self[n])
    end

    self
  end
end
