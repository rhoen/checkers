class Array
  def zip_sum(other_array)
    self.zip(other_array).map {|arr| arr.inject(:+)}
  end

  def zip_difference(other_array)
    self.zip(other_array).map {|arr| arr.inject(:-)}
  end
end
