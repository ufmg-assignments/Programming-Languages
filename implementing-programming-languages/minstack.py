class Node:
  def __init__(self):
    self.n = None
    self.e = ''

class MinStack:
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

  def getSmaller(self) -> str:
    menor_elemento = self.topo.e
    
    aux = self.topo.n
    while aux != self.fundo:
        if aux.e < menor_elemento:
            menor_elemento = aux.e
        aux = aux.n
            
    return menor_elemento