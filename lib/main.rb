# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require "./node.rb"

print "Enter number of symbols: "
symbol = gets.chomp.to_i
i = 0
while i < symbol
  puts i
  i = i + 1
end

print "Enter number of states: "
state = gets.chomp.to_i

a = []
i = 0
while i < state
  a[i] = Node.new
  a[i].setid(i)
  i = i + 1
end

puts "Start State is q0"
i = 0
j = 0
while i < state
  while j < symbol
   print "\t(q#{i}, #{j}) = "
    x = gets.chomp
    a[i].setnext(j,x[i])
    j = j +1
  end
  if i != 0
    print "is q#{c} a final state?[Y/N]: "
    choice = gets.chomp
    if choice == 'y' || choice == 'Y'
      a[i].setFinal
    end
  end
  i = i + 1
end

