class Array
  def zip_sum(other_array)
    self.zip(other_array).map {|arr| arr.inject(:+)}
  end

  def zip_difference(other_array)
    self.zip(other_array).map {|arr| arr.inject(:-)}
  end

  def deep_dup
    self.map do |el|
      if el.nil?
        el
      elsif !el.is_a?(Array)
        el.dup
      else
        el.deep_dup
      end
    end
  end

end

class InvalidMoveError < StandardError
end
