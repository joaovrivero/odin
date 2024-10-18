# Fibonacci sequence using iteration
def fibs(n)
  sequence = [0, 1]
  (n - 2).times do
    sequence << sequence[-1] + sequence[-2]
  end
  sequence.take(n)
end

# Fibonacci sequence using recursion
def fibs_rec(n, sequence = [0, 1])
  return sequence if n <= 2

  fibs_rec(n - 1, sequence << sequence[-1] + sequence[-2])
end


# Test the methods
puts "Fibonacci sequence using iteration:"
puts fibs(8).inspect
puts "\nFibonacci sequence using recursion:"
puts fibs_rec(8).inspect

# Merge Sort
def merge_sort(array)
  return array if array.length <= 1

  mid = array.length / 2
  left_half = merge_sort(array[0...mid])
  right_half = merge_sort(array[mid..])

  merge(left_half, right_half)
end

def merge(left, right)
  result = []
  until left.empty? || right.empty?
    if left.first <= right.first
      result << left.shift
    else
      result << right.shift
    end
  end
  result + left + right
end

# Test the method
puts "\nMerge Sort:"
puts merge_sort([3, 2, 1, 13, 8, 5, 0, 1]).inspect
puts merge_sort([105, 79, 100, 110]).inspect
