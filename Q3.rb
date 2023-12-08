def print_hello
  puts "Hello, before yield"
  yield if block_given?
  puts "Hello, after yield"
end

print_hello do
  3.times do
    puts "Hello, inside the block!"
  end
end
