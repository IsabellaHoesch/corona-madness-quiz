# TO DO:
# This is the file that you will run in your terminal with: ruby quiz.rb

# Don't forget, if you are storing your questions in a json or csv file, you will need to
#                                                  parse that file first to get the data!
require "pry"
require 'json'
file = File.open "questions.json"
json = JSON.load file

points = 0
lives_count = 3

answers = ["C", "B", "B", "C", "D", "A", "C", "D", "A", "D", "B", "A"]



puts '-----------------------------------------------'
puts '---      !Welcome to the Wagon Pub-Quiz!    ---'
puts "-   This quiz's theme is: ~LoCkDoWn MaDnEsS~  -"
puts '-----------------------------------------------'

23.times do
  print '😷'
  sleep(0.1)
end
puts ''
puts "You have: #{lives_count} lives."
puts 'Every time you get a question wrong, you loose a life.'
sleep(2)



def ask(json, num, points, lives_count, answers )
  #ask question
  puts json[num-1]["question_#{num}"]
  input = gets.chomp.upcase
  #compare
  if input == answers[num-1]
    puts "Correct answer!"
    points += 10
    puts "Your point level: #{points}"
  else
    puts "Wrong!"
    lives_count -= 1
    puts "The right answer is: #{answers[num-1]}"
  end
  return points, lives_count
end

num = 1
points, lives_count = ask(json, num, points, lives_count, answers)

while lives_count > 0
  num += 1
  points, lives_count = ask(json, num, points, lives_count, answers)
  if num > 11
    puts "Survivor!"
    break
  end
end

puts "your lives_count is #{lives_count}. Corona got you!" if lives_count == 0
