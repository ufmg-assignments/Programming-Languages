class Node:
  def __init__(self):
    self.n = None
    self.e = ''

class Stack:
  def __init__(self):
    self.fundo = Node()
    self.topo = self.fundo

  def add(self, val):
    novo_no = Node()
    novo_no.e = val
    novo_no.n = self.topo
    self.topo = novo_no
    
  def remove(self) -> Node:
    no_removido = self.topo
    self.topo = self.topo.n
    return no_removido
    
  def isNotEmpty(self) -> bool:
    return self.topo != self.fundo