local raio = 5
local area = math.pi * (raio^2)
print("Area do circulo: " .. area)

print("------------------------")

local x = 0.1
local y = 0.2
local sum = x + y
    
print("Soma de 0.1 + 0.2:", sum) -- Pode não ser exatamente 0.3
print("Comparacao direta (sum == 0.3):", sum == 0.3)

print("-------------------------")
    
local function ehPrimo(n)
    if n <= 1 then
        return false
    end

    for i = 2, math.sqrt(n) do
        if n % i == 0 then
            return false
        end
    end

    return true
end

local numero = io.read("n")
print(numero .. " eh primo? " .. tostring(ehPrimo(numero)))

print("----------------------------")

print("Fatorial")

local function fatorial(n)
    if n == 0 or n == 1 then
        return 1
    end

    local resultado = 1
    for i = 2, n do
        resultado = resultado * i
    end
    return resultado
end

local numero = io.read("n")
print("Fatorial de " .. numero .. ": " .. fatorial(numero))

print("----------------------------")

print("Sequencia de Fibonacci:")
print("----------------------------")

local function sequenciaFibonacci(n)
    if n <= 0 then
        return {}
    elseif n == 1 then
        return {0}
    elseif n == 2 then
        return {0, 1}
    end

    local sequencia = {0, 1}
    for i = 3, n do
        sequencia[i] = sequencia[i - 1] + sequencia[i - 2]
    end

    return sequencia
end

local n = io.read("n")
local resultado = sequenciaFibonacci(n)
print("Quantidade de elementos: ")
print(table.concat(resultado, ", "))

print("Fim")
print("----------------------------")

print("Triangulo de ouro: ")

local function calcularTrianguloOuro(base, altura)
    local area = (base * altura) / 2
    return area
end

local base = 100
local altura = 100
local area = calcularTrianguloOuro(base, altura)

print("Area do triangulo de ouro: " .. area)