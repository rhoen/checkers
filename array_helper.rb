class Array
  def zip_sum(other_array)
    self.zip(other_array).map {|arr| arr.inject(:+)}
  end

  def zip_difference(other_array)
    self.zip(other_array).map {|arr| arr.inject(:-)}
  end

  def deep_dup
    self.map do |el|
      return el.dup unless el.is_a?(Array)
      el.deep_dup
    end
  end
end
