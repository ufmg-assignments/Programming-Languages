NULL = -1 # The null link

class HeapManager :
  """ Implements a very simple heap manager ."""

  def __init__(self,memorySize) :
    """ Constructor . Parameter initialMemory is the array of
        data that we will
        use to represent the memory ."""
    self.memory = [0] * memorySize
    self.memory[0] = self.memory.__len__()
    self.memory[1] = NULL
    self.freeStart = 0

  def allocate(self, requestSize) :
    """Allocates a block of data , and return its address . The parameter requestSize is the amount of space that must be allocaed."""
    size = requestSize + 1
        
    bloco_atual = self.freeStart
    lag = NULL
    lag_aux = NULL
    tamanho = self.memory[bloco_atual]
    posicao_menor = -1
    if tamanho >= size:
        posicao_menor = bloco_atual
    
    while self.memory[bloco_atual+1] != NULL: 
        
      if tamanho == size:
        break
      lag = bloco_atual
      bloco_atual = self.memory[bloco_atual+1]
      tamanho = self.memory[bloco_atual]
    
      if posicao_menor == NULL and tamanho >= size:
        lag_aux = lag
        posicao_menor = bloco_atual
      elif self.memory[posicao_menor] > tamanho and tamanho>=size and bloco_atual != NULL: 
        lag_aux = lag
        posicao_menor = bloco_atual
    
    if posicao_menor == NULL :
      raise MemoryError()
    nextFree = self.memory[posicao_menor + 1]
   

    unused = self.memory[posicao_menor] - size
    if unused > 1:
      nextFree = posicao_menor + size
      self.memory[nextFree]= unused
      self.memory[nextFree + 1] = self.memory[posicao_menor + 1]
      self.memory[posicao_menor]= size
    if lag_aux == NULL :
      self.freeStart = nextFree
    else :
      self.memory[lag_aux + 1] = nextFree

    return posicao_menor + 1
    
  def deallocate(self, address):
    
    if address < self.freeStart:
      self.memory[address] = self.freeStart
      self.freeStart = address-1
        
    elif address > self.freeStart:
      i = self.freeStart
      j = self.memory[i+1]
      
      while j < address:
        if j == -1:
          break
        i = j
        j = self.memory[i+1]
    
      self.memory[i+1] = address -1
      self.memory[address] = j