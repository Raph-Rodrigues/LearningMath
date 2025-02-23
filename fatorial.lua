Fatorial = {
    num = 0,
    x = 10,
    y = love.graphics.getHeight() / 2 - 100
}


function Fatorial:new()
    local fatorial = {self.num, self.x, self.y}
    setmetatable(fatorial, self)
    self.__index = self
    return fatorial
end

function Fatorial:calcularFatorial(n)
    if type(n) ~= "number" or n < 0 then
        return "Erro: Entrada invalida"
    end

    if n == 0 or n == 1 then
        return 1
    end
    local resultado = 1
    for i = 2, n do
        resultado = resultado * i
    end
    return resultado
end

function Fatorial:draw()
    local texto = "Fatorial: " .. self.num .. "! = " .. self:calcularFatorial(self.num)
    love.graphics.print(texto, self.x, self.y)
end

function Fatorial:setNum(num)
    self.num = num
end

return Fatorial