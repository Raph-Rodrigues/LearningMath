Circulo = { 
    raio = 46,
    radius = 30,
    area,
    x = (love.graphics.getWidth() / 2) - (love.graphics.getWidth() / 2) + 320,
    y = (love.graphics.getHeight() / 2) - 260
}

function Circulo:new()
    local circulo = {self.raio, self.radius, self.x, self.y}
    setmetatable(circulo, self)
    self.__index = self
    return circulo
end

function Circulo:calcularArea(raio)
    self.area = math.pi * (raio^2)
    return area
end

function Circulo:draw()
    love.graphics.circle("fill", self.x, self.y, self.radius)
end

return Circulo