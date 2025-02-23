Soma = { 
    num1 = 0.1,
    num2 = 0.2,
    result,
    x = 10,
    y = 280
}

function Soma:new()
    local soma = {self.num1, self.num2, self.x, self.y}
    setmetatable(soma, self)
    self.__index = self
    return soma
end

function Soma:calcularPrecisao(num1, num2)
    self.result = num1 + num2
    return result
end

function Soma:draw()
    love.graphics.print("A soma entre 0.1 e 0.2: " .. self.result, self.x, self.y, 0, 1, 1)
end

return Soma