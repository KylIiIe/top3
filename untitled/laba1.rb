s = "In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income."

word = [] # Слово
top = {} # Топ
length = s.length # Довжина нашого тексту

# Додавання слова в топ
def add_to_top(top, word)
  # Робимо із масиву рядок у нижньому регістрі
  key = word.join("").downcase
  # Якщо ключ виявився пустим рядком (Якщо слово пробіл [" "])
  if key.empty?
    # Виходимо із функції
    return
  end
  # Якщо ключ є в топі
  if top.key?(key)
    # Додаємо до його значення 1
    top[key] += 1
  else # Якщо ключа немає в топі
    # Додаємо нове слово в топ зі значенням 1
    top[key] = 1
  end
end

# Ітерація по тексту з індексами
s.each_char.with_index do |c, index|
  # Якщо символ дорівнює a-z або '
  if c.downcase =~ (/[a-z]/) || (c == "'")
    # Робимо із нього слово
    word.push(c)
    # Якщо це останній символ у тексті
    if index + 1 == length
      # Додаємо в топ
      add_to_top(top, word)
    end
  else # Якщо не дорівнює a-z або '
    # Додаємо в топ
    add_to_top(top, word)
    # Обнуляємо слово
    word = []
  end
end
# Сортування топу по значенням
top = top.sort {|a1,a2| a2[1].to_i <=> a1[1].to_i }
p s # Виводимо вихідний текст
p top.first(3).map(&:first) # first(3) бере перші 3 елементи (сбо менше якщо їх менше) map(&:first) повертає ключі топу тобто слова

