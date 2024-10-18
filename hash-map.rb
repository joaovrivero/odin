class HashMap
  attr_reader :buckets, :size, :load_factor

  def initialize(initial_capacity = 16, load_factor = 0.75)
    @buckets = Array.new(initial_capacity, [])
    @size = 0
    @load_factor = load_factor
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
    
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
    
    hash_code % buckets.length
  end

  def set(key, value)
    index = hash(key)
    check_index(index)
    bucket = buckets[index]
    
    # Check for existing key
    bucket.each_with_index do |(existing_key, _), i|
      if existing_key == key
        bucket[i] = [key, value]
        return
      end
    end
    
    # If key is not found, add new key-value pair
    bucket << [key, value]
    @size += 1

    # Check if resizing is needed
    resize if size > load_factor * buckets.length
  end

  def get(key)
    index = hash(key)
    check_index(index)
    bucket = buckets[index]
    
    bucket.each do |existing_key, value|
      return value if existing_key == key
    end
    
    nil  # Key not found
  end

  def has?(key)
    index = hash(key)
    check_index(index)
    bucket = buckets[index]
    
    bucket.each do |existing_key, _|
      return true if existing_key == key
    end
    
    false  # Key not found
  end

  def remove(key)
    index = hash(key)
    check_index(index)
    bucket = buckets[index]
    
    bucket.each_with_index do |(existing_key, value), i|
      if existing_key == key
        bucket.delete_at(i)
        @size -= 1
        return value
      end
    end
    
    nil  # Key not found
  end

  def length
    size
  end

  def clear
    @buckets = Array.new(buckets.length, [])
    @size = 0
  end

  def keys
    result = []
    buckets.each do |bucket|
      bucket.each { |key, _| result << key }
    end
    result
  end

  def values
    result = []
    buckets.each do |bucket|
      bucket.each { |_, value| result << value }
    end
    result
  end

  def entries
    result = []
    buckets.each do |bucket|
      bucket.each { |entry| result << entry }
    end
    result
  end

  private

  def resize
    new_capacity = buckets.length * 2
    new_buckets = Array.new(new_capacity, [])

    buckets.each do |bucket|
      bucket.each do |key, value|
        new_index = hash(key) % new_capacity
        new_buckets[new_index] << [key, value]
      end
    end

    @buckets = new_buckets
  end

  def check_index(index)
    raise IndexError if index.negative? || index >= @buckets.length
  end
end

# Create a new HashMap instance
hash_map = HashMap.new

# Set some key-value pairs
hash_map.set("apple", 10)
hash_map.set("banana", 20)
hash_map.set("orange", 30)

# Get the value for a key
puts hash_map.get("apple")  # Output: 10

# Check if a key exists
puts hash_map.has?("banana")  # Output: true

# Remove a key-value pair
puts hash_map.remove("orange")  # Output: 30

# Get the number of stored keys
puts hash_map.length  # Output: 2

# Get all keys
puts hash_map.keys.inspect  # Output: ["apple", "banana"]

# Get all values
puts hash_map.values.inspect  # Output: [10, 20]

# Get all key-value pairs
puts hash_map.entries.inspect  # Output: [["apple", 10], ["banana", 20]]
