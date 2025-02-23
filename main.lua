_G.love = require("love")
local Circulo = require("areaCirculo")
local Fibonacci = require("fibonacci")
local Soma = require("precisaoSoma")
local Primo = require("numeroPrimo")
local Triangulo = require("triangulo")
local Fatorial = require("fatorial")

local userInput = ""
local resultado = ""
local inputActive = true

local defaultFibonacciCount = Fibonacci.numbersToGenerate
local defaultCirculoRaio = Circulo.raio
local defaultSomaNum1 = Soma.num1
local defaultSomaNum2 = Soma.num2
local defaultFatorial = Fatorial.num

function love.load()
    love.window.setTitle("Math App")
    love.window.setMode(800, 600, {resizable = true}, {vsync = true})
    
    love.graphics.setFont(love.graphics.newFont(16))
    love.keyboard.setKeyRepeat(true)

    Fibonacci:calcFibonacci(Fibonacci.numbersToGenerate)
    Fatorial:new()
    resetGame()

    triangulo = Triangulo:new(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 100, 100, {1, 0, 0, 1})
end

function resetGame()
    userInput = ""
    inputActive = true
    Fibonacci.numbersToGenerate = defaultFibonacciCount
    Fibonacci:calcFibonacci(Fibonacci.numbersToGenerate)
    
    Circulo.raio = defaultCirculoRaio
    Circulo:calcularArea(Circulo.raio)
    
    Soma.num1 = defaultSomaNum1
    Soma.num2 = defaultSomaNum2
    Soma:calcularPrecisao(Soma.num1, Soma.num2)
    
    Primo.numero = 0
    Primo:verificar()

    Fatorial.num = defaultFatorial
    Fatorial:calcularFatorial(Fatorial.num)
end

function love.update(dt)
    Circulo:calcularArea(Circulo.raio)
    Soma:calcularPrecisao(Soma.num1, Soma.num2)
end

function love.textinput(text)
    if inputActive then
        userInput = userInput .. text
    end
end

function love.keypressed(key)
    if key == "backspace" then
        userInput = userInput:sub(1, #userInput - 1)
    elseif key == "return" then
        local n = tonumber(userInput)
        if n and n > 0 then
            Fibonacci.numbersToGenerate = n
            Fibonacci:calcFibonacci(n)
            Fatorial.num = n
            Fatorial:calcularFatorial(n)
            Primo.numero = n
            Primo:verificar()
        end
        inputActive = false
        userInput = ""
    end
end

function love.mousepressed(x, y, button)
    if button == 1 then
        local btnWidth, btnHeight = 100, 30
        local btnX = (love.graphics.getWidth() - btnWidth) / 2
        local btnY = love.graphics.getHeight() - 60
        if x >= btnX and x <= btnX + btnWidth and y >= btnY and y <= btnY + btnHeight then
            resetGame()
        end
    end
end

function love.draw()
    love.graphics.setColor(1, 1, 1, 1)
    Soma:draw()
    triangulo:draw()
    love.graphics.print("Triangulo de ouro", love.graphics.getWidth() / 2 - 70, (love.graphics.getHeight() / 2) + 60, 0, 1, 1)
    
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print("Considerando o raio como " .. Circulo.raio, 10, 10, 0, 1, 1)
    Circulo:draw()

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print("Area do circulo: " .. Circulo.area, 10, 40, 0, 1, 1)
    Fibonacci:draw()

    Primo:draw(10, 90)
    love.graphics.print("O fatorial de " .. Fatorial.num .. " é ", 10, love.graphics.getHeight() / 2 - 120, 0, 1, 1)
    Fatorial:draw()

    local startY = 90
    
    local inputX, inputY = (love.graphics.getWidth() / 2) + 240, startY
    love.graphics.print(userInput, inputX, inputY, 0, 1, 1)

    -- Mostrar a barrar (caret) quando o input estiver ativo
    if inputActive then
        local currentTime = love.timer.getTime()
        local blink = math.floor(currentTime * 2) % 2 == 0 -- pisca de 0.5s a 0.5s
        if blink then
            local font = love.graphics.getFont()
            local textWidth = font:getWidth(userInput)
            love.graphics.print("|", inputX + textWidth, inputY, 0, 1, 1)
        end
    end

    local btnWidth, btnHeight = 100, 30
    local btnX = (love.graphics.getWidth() - btnWidth) / 2
    local btnY = love.graphics.getHeight() - 60
    love.graphics.rectangle("line", btnX, btnY, btnWidth, btnHeight)
    love.graphics.printf("Restart", btnX, btnY + 7, btnWidth, "center")
end