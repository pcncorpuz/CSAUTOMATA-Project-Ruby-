# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Node
  
  def initialize
    @check = false
    @next = Array.new
    @ID
  end
  
  def isfinal
    @check
  end
  
  def setfinal()
    @check = true
  end
  
  def setnext(x, y)
    @next[x] = y
  end
  
  def setid(x)
    @ID = x
  end
  
  def getid
    @ID
  end
  
  def getnext(x)
    @next[x]
  end
end
