def bubble_sort(array)
  n = array.length
  (0...n).each do |i|
    (0...n-i-1).each do |j|
      if array[j] > array[j+1]
        array[j], array[j+1] = array[j+1], array[j]
      end
    end
  end
  return array
end

arr = [64, 34, 25, 12, 22, 11, 90]
sorted_arr = bubble_sort(arr)
puts "Sorted array: #{sorted_arr}"
