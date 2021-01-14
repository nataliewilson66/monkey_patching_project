# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    if self.empty?
        return nil
    end
    temp = self.sort
    temp[-1] - temp[0]
  end

  def average
    if self.empty?
        return nil
    end
    num = self.length + 0.0
    self.sum / num
  end

  def median
    if self.empty?
        return nil
    end
    if self.length % 2 == 1
        mid = self.length / 2
        return self.sort[mid]
    end
    mid_lo = self.length / 2 - 1
    mid_hi = self.length / 2
    self.sort[mid_lo..mid_hi].average
  end
  
  def counts
    count_hash = Hash.new(0)
    self.each { |elem| count_hash[elem] += 1 }
    count_hash 
  end

  def my_count(val)
    count = 0
    self.each { |elem| count += 1 if elem == val }
    count
  end

  def my_index(val)
    self.each_with_index { |elem, idx| return idx if elem == val }
    nil
  end

  def my_uniq
    uniq_arr  = []
    self.each { |elem| uniq_arr << elem if !uniq_arr.include?(elem) }
    uniq_arr
  end

  def my_transpose
    new_arr = []
    (0...self.length).each { |i| new_arr[i] =[] }
    self.each_with_index do |sub_arr, idx1|
        sub_arr.each_with_index do |elem, idx2|
            new_arr[idx2][idx1] = elem
        end
    end
    new_arr
  end

end
