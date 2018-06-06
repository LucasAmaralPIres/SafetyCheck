--[[
  Game: Safety Check
  Desenvolvedores: Arthur de Lima Ozorio, Douglas Pereira Pessoa, Jefferson Jose da Silva, Lucas d'Amaral Pires, Lucas Muller Baccar.
  Professor: Pedro Igor Porfirio Sampaio
  Monitor: Ana Clara Medeiros
  Técnicos: Pietro Pepe Ribeiro, Ana Carolina Junger
]]

local menus = {require "tela_inicial", require "tela_config", require "tela_pausa", st = 1}
local col = require "colision"
local player = require "player"

function love.load()
  love.window.setTitle("Safety Check")
  love.window.setFullscreen(true,"desktop")
  for i = 1, 3, 1 do menus[i].load() end
  player.load()
  a = {x = (love.graphics.getWidth() * 143)/1366, y = (love.graphics.getHeight() * 345)/768, w = (love.graphics.getWidth() * 178)/1366, h = (love.graphics.getHeight() * 370)/768} -- Colocar no lugar certo
  b = {x = (love.graphics.getWidth() * 502)/1366, y = (love.graphics.getHeight() * 433)/768, w = (love.graphics.getWidth() * 250)/1366, h = (love.graphics.getHeight() * 282)/768} -- Colocar no lugar certo
end

function love.keyreleased(key)
  player.keyreleased(key)
end

function love.keypressed(key)
  if key == "up" and player.getvelY() == 0 then player.keypressed("up") end
end

function love.update(dt)
  if love.keyboard.isDown("lshift") and player.getvelY() == 0 then player.setCorrer(2) end
  if love.keyboard.isDown("up") or player.getvelY() ~= 0 then player.pular(dt) end
  if player.getvelY() ~= 0 then
    if player.ger_dir() == 1 then player.andar(dt,"right")
    else player.andar(dt,"left")
    end
  elseif love.keyboard.isDown("right") then player.andar(dt,"right")
  elseif love.keyboard.isDown("left") then player.andar(dt,"left")
  end
end

function love.mousepressed(x,y,button)
  if love.mouse.isDown('3') then 
    menus.st = 3
  end
  if col.mouse_retangulo(a,x,y) then
    love.event.quit()
  end
  if col.mouse_retangulo(b,x,y) then
    menus.st = 2
  end
end

function love.draw()
  menus[menus.st].draw()
  if menus.st == 1 then player.draw() end
  --love.graphics.rectangle("fill",b.x,b.y,b.w,b.h)
end
--[[
valor original - 1366
x - love.graphics.getWidth()


1366*x = love.graphics.getWidth() * valor original

x = (love.graphics.getWidth() * valor original)/1366
--]]
