local Triangulo = {
    x,
    y,
    base,
    altura,
    cor = {1, 0.84, 0, 1}
}

function Triangulo:new(x, y, base, altura, cor)
    self.x = x
    self.y = y
    self.base = base
    self.altura = altura
    self.cor = cor
    return self
end

function Triangulo:draw()
    love.graphics.setColor(self.cor)

    local vertices = {
        self.x, self.y - self.altura / 2, -- Vértice superior
        self.x - self.base / 2, self.y + self.altura / 2, -- Vértice Inferior esquerdo
        self.x + self.base / 2, self.y + self.altura / 2 -- Vértice Inferior direito
    }

    love.graphics.polygon("fill", vertices)
end

return Triangulo