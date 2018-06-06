--[[
  Game: Safety Check
  Desenvolvedores: Arthur de Lima Ozorio, Douglas Pereira Pessoa, Jefferson Jose da Silva, Lucas d'Amaral Pires, Lucas Muller Baccar.
  Professor: Pedro Igor Porfirio Sampaio
  Monitor: Ana Clara Medeiros
  Técnicos: Pietro Pepe Ribeiro, Ana Carolina Junger
]]

local menus = {require "tela_inicial", require "tela_config", require "tela_pausa", {require "fase1"},st = 1}
local col = require "colision"
local player = require "player"

function getSt()
  return menus.st
end

function love.load()
  love.window.setTitle("Safety Check")
  love.window.setFullscreen(true,"desktop")
  for i = 1, 3, 1 do menus[i].load() end
  player.load()
  menus[menus.st].play_musica()
end

function love.keyreleased(key)
  player.keyreleased(key)
end

function love.update(dt)
  if love.keyboard.isDown("lshift") and player.getvelY() == 0 and menus.st == 1 then player.setCorrer(2) end
  if love.keyboard.isDown("up") or player.getvelY() ~= 0 then
    if menus.st == 1 then player.pular(dt)
    elseif menus.st == 2 then menus[menus.st].setSel(1)
	end
  elseif love.keyboard.isDown("down") then
    if menus.st == 2 then menus[menus.st].setSel(2) end
  end
  if player.getvelY() ~= 0 and menus.st == 1 then
    if player.ger_dir() == 1 then player.andar(dt,"right")
    else player.andar(dt,"left")
    end
  elseif love.keyboard.isDown("right") then
    if menus.st == 1 then player.andar(dt,"right")
    elseif menus.st == 2 then menus[menus.st].andar("right")
    end
  elseif love.keyboard.isDown("left") then
    if menus.st == 1 then player.andar(dt,"left")
    elseif menus.st == 2 then menus[menus.st].andar("left")
    end
  end
end

function love.keypressed(key)
  if menus.st == 1 then
	coli = menus[1].getObj()
	if key == "return" then
		for i = 1,coli.tm,1 do
			if col.retangulo_retangulo(coli[i],player.getRet()) then coli[i].acao() end
		end
	end
    if key == "up" and player.getvelY() == 0 then player.keypressed("up") end
  end
end

function switch_menu(novo_menu,velho_menu)
  menus[velho_menu].stop_musica()
  menus[novo_menu].play_musica()
  menus.st = novo_menu
end

function love.draw()
  menus[menus.st].draw()
  if menus.st == 1 then player.draw() end
end
--[[
valor original - 1366
x - love.graphics.getWidth()


1366*x = love.graphics.getWidth() * valor original

x = (love.graphics.getWidth() * valor original)/1366
--]]
