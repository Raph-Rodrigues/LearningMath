local NumeroPrimo = {
  numero = 0,
  resultado = false,
  mensagem = "Digite um número para sequencia de Fibonacci, Fatorial e verificar se é primo: "
}

function NumeroPrimo:verificar()
  if self.numero and self.numero > 0 then
    self.resultado = self:ehPrimo(self.numero)
  else
    self.resultado = false
  end
end

function NumeroPrimo:ehPrimo(n)
  if n <= 1 then
    return false
  end
  for i = 2, math.floor(math.sqrt(n)) do
    if n % i == 0 then
      return false
    end
  end
  return true
end

function NumeroPrimo:draw(x, y)
  x = x or 10
  y = y or 200  -- Adjust Y coordinate as needed
  local message = "Número digitado: " .. tostring(self.numero) .. "\n"
  if self.numero ~= 0 then
    if self.resultado then
      message = message .. "É um número primo!"
    else
      message = message .. "Não é um número primo!"
    end
  else
    message = self.mensagem
  end
  love.graphics.print(message, x, y)
end

return NumeroPrimo
