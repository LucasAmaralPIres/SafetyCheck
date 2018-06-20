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
  menus[4][1].load() -- SOMENTE PARA O TESTE DA FASE
  player.load()
  menus[menus.st].play_musica()
end

function love.keyreleased(key)
  player.keyreleased(key)
  if menus.st == 4 then menus[4][1].keyreleased(key) end
end

function love.update(dt)
  if love.keyboard.isDown("lshift") and player.getvelY() == 0 and (menus.st == 1  or menus.st == 4)then player.setCorrer(2) menus[4][1].setCor(2) end
  if love.keyboard.isDown("up") or player.getvelY() ~= 0 then
    if menus.st == 1 or menus.st == 4 then player.pular(dt)
    elseif menus.st == 2 then menus[menus.st].setSel(1)
	end
  elseif love.keyboard.isDown("down") then
    if menus.st == 2 then menus[menus.st].setSel(2) end
  end
  if player.getvelY() ~= 0 and (menus.st == 1 or menus.st == 4) then
    if player.ger_dir() == 1 then 
      player.andar(dt,"right")
      if menus.st == 4 then
        menus[4][1].andar(dt,"right")
      end
    else 
      player.andar(dt,"left")
      if menus.st == 4 then
        menus[4][1].andar(dt,"left")
      end
    end
  elseif love.keyboard.isDown("right") then
    if menus.st == 1 or menus.st == 4 then 
      player.andar(dt,"right")
      if menus.st == 4 then
        menus[4][1].andar(dt,"right")
      end
    elseif menus.st == 2 then menus[menus.st].andar("right")
    end
  elseif love.keyboard.isDown("left") then
    if menus.st == 1  or menus.st == 4 then 
      player.andar(dt,"left")
      if menus.st == 4 then
        menus[4][1].andar(dt,"left")
      end
    elseif menus.st == 2 then menus[menus.st].andar("left")
    end
  elseif love.keyboard.isDown("right") then player.andar(dt,"right")
  elseif love.keyboard.isDown("left") then player.andar(dt,"left")
  end
  if menus.st == 4 then menus[4][1].update() end
end


function love.keypressed(key)
  if menus.st == 3 then
    menus[3].move(key)
    switch_menu(menus[3].interacao(key),menus.st)
  elseif menus.st == 1 then
	coli = menus[1].getObj()
	  if key == "return" then
		  for i = 1,coli.tm,1 do
			  if col.retangulo_retangulo(coli[i],player.getRet()) then coli[i].acao() end
		  end
	  end
  end
  if key == "up" and player.getvelY() == 0 and (menus.st == 1 or menus.st == 4) then player.keypressed("up") end
  if key == "p" then menus.st = 4 end -- SOMENTE PARA O TESTE DA FASE
end

function switch_menu(novo_menu,velho_menu)
  menus[velho_menu].stop_musica()
  menus[novo_menu].play_musica()
  menus.st = novo_menu
end

function love.draw()
  if menus.st ~= 4 then menus[menus.st].draw()
  else menus[4][1].draw() -- SOMENTE PARA O TESTE DA FASE
  end
  if menus.st == 1 or menus.st == 4 then player.draw() end
end
--[[
valor original - 1366
x - love.graphics.getWidth()


1366*x = love.graphics.getWidth() * valor original

x = (love.graphics.getWidth() * valor original)/1366
--]]
