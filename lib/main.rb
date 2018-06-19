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
current = a[0]
for i in 0..state-1
  for j in 0..symbol-1
    print "\t(q#{i}, #{j}) = "
    x = gets.chomp
    a[i].setnext(j,a[x[1].to_i])
  end
  if i != 0
    print "is q#{i} a final state?[Y/N]: "
    choice = gets.chomp
    if choice == 'y' || choice == 'Y'
      a[i].setfinal
    end
  end
end

again = 'y'
begin
  print "Enter a string: "
  sstr = gets.chomp.split("")
  len = sstr.length
  for q in 0..len-1
    b = sstr[q].to_i
    print "(q#{current.getid}, #{b}) = q"
    current = current.getnext(b)
    puts "#{current.getid}"
  end
  if(current.isfinal == true)
    puts "#{sstr.join} is accepted!"
  else
    puts "#{sstr.join} is rejected!"
  end
  print "Enter another string?[Y/N]"
  again = gets.chomp
end while again == 'y' || again == 'Y'