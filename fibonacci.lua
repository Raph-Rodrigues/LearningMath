local Fibonacci = {
    numbersToGenerate = 0,  -- change this value to generate more numbers
    sequence = {}, -- will hold the generated Fibonacci sequence
    posX = 10,
    posY = 140
  }
  
  -- Calculates the Fibonacci sequence up to count n
  function Fibonacci:calcFibonacci(n)
    local seq = {}
    if n >= 1 then seq[1] = 0 end
    if n >= 2 then seq[2] = 1 end
    for i = 3, n do
      seq[i] = seq[i-1] + seq[i-2]
    end
    self.sequence = seq
  end
  
  -- Draws the Fibonacci sequence on the screen using Love2D graphics
  function Fibonacci:draw()
    -- Ensure we have calculated the sequence at least once
    if #self.sequence == 0 then
      self:calcFibonacci(self.numbersToGenerate)
    end
    
    local s = "Fibonacci: "
    for i, v in ipairs(self.sequence) do
      s = s .. v
      if i < #self.sequence then
        s = s .. ", "
      end
    end
    
    love.graphics.print(s, self.posX, self.posY, 0, 1, 1)
  end
  
  return Fibonacci
  