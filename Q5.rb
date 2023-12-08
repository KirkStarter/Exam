class String
  def self.bad_characters(substring)
    bad_chars = Hash.new(-1)

    substring.length.times do |i|
      bad_chars[substring[i]] = i
    end

    bad_chars
  end

  def self.good_suffix_shift(substring)
    length = substring.length
    table = Array.new(length, length)
    j = 0

    (length - 1).downto(0) do |i|
      while j < length - 1 && substring[j] != substring[i + 1 - j]
        table[length - 1 - j] = i
        j += 1
      end

      if substring[j] == substring[i + 1 - j]
        table[length - 1 - j] = i + 1 - j
      end
    end

    (0..(length - 2)).each do |i|
      k = i + table[length - 1 - i]
      if table[length - 1 - i] == length - 1 - i &&
        k < length && substring[k] == substring[length - 1]
        table[length - 1 - i] = table[length - 2 - i]
      end
    end

    table
  end

  def self.boy_moore(string, substring)
    string = string.downcase
    substring = substring.downcase

    bad_chars = bad_characters(substring)
    good_suffix_shift = good_suffix_shift(substring)

    i = 0
    while i < string.length
      j = substring.length - 1
      while j >= 0 && string[i + j] == substring[j]
        j -= 1
      end

      if j < 0
        puts "Підрядок знайдено в позиції: #{i}"
        return i
      else
        skip = [1, j - bad_chars[string[i + j]]].max
        i += skip < good_suffix_shift[j] ? skip : good_suffix_shift[j]
      end
    end

    puts 'Підрядок не знайдено в рядку'
    nil
  end
end

# Приклад використання
String.boy_moore('Hello, World!', 'World') # Очікуваний результат: Підрядок знайдено в позиції: 7
String.boy_moore('Ruby is awesome', 'Ruby') # Очікуваний результат: Підрядок знайдено в позиції: 0
String.boy_moore('Testing the algorithm', 'xyz') # Очікуваний результат: Підрядок не знайдено в рядку
