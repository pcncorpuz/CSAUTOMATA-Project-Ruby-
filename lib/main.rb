require "./node.rb"

print "Enter number of symbols: "
symbol = gets.chomp.to_i
for l in 0..symbol-1
  puts l
end

print "Enter number of states: "
state = gets.chomp.to_i
a = []
for c in 0..state-1
  a[c] = Node.new
  a[c].setid(c)
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

begin
  print "Enter a string: "
  sstr = gets.chomp.split("")
  len = sstr.length
  for q in 0..len-1
    b = sstr[q].to_i
    puts "(q#{current.getid}, #{b}) = q#{current.getnext(b).getid}"
    current = current.getnext(b)
  end
  if(current.isfinal == true)
    puts "#{sstr.join} is accepted!"
  else
    puts "#{sstr.join} is rejected!"
  end
  print "Enter another string?[Y/N]: "
  again = gets.chomp
end while again == 'y' || again == 'Y'
