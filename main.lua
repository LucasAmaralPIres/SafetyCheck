--[[
  Game: Safety Check
  Desenvolvedores: Arthur de Lima Ozorio, Douglas Pereira Pessoa, Jefferson Jose da Silva, Lucas d'Amaral Pires, Lucas Muller Baccar.
  Professor: Pedro Igor Porfirio Sampaio
  Monitor: Ana Clara Medeiros
  Técnicos: Pietro Pepe Ribeiro, Ana Carolina Junger
]]

local menus = {require "tela_inicial", require "tela_config", require "tela_pausa", {require "fase1"},st = 1}
col = require "colision"
local player = require "player"
local hud = require "hud"

function getSt()
  return menus.st
end

function love.load()
  love.window.setTitle("Safety Check")
  love.window.setFullscreen(true,"desktop")
  cons_w = love.graphics.getWidth()/1366
  cons_h = love.graphics.getHeight()/768
  for i = 1, 3, 1 do menus[i].load() end
  menus[4][1].load() -- SOMENTE PARA O TESTE DA FASE
  player.load()
  hud.load()
  menus[menus.st].play_musica()
end

function love.keyreleased(key)
  if menus.st == 4  then 
    player.keyreleased(key)
    menus[4][1].keyreleased(key) 
    hud.keyreleased(key)
  elseif menus.st == 1 then player.keyreleased(key) end
end

function love.update(dt)
  if menus.st == 1 or menus.st == 4 then 
    if player.getvelY() == 0 then
      if love.keyboard.isDown("lshift") then 
        player.setCorrer(2) 
        menus[4][1].setCor(2)
        hud.correr(2)
      end
      if love.keyboard.isDown("up") then player.pular(dt) end
      if love.keyboard.isDown("right") then player.andar(dt,"right") if menus.st == 4 then menus[4][1].andar(dt) end
      elseif love.keyboard.isDown("left") then player.andar(dt,"left") if menus.st == 4 then menus[4][1].andar(dt) end
      end
    else
      player.pular(dt)
      if player.ger_dir() == 1 then player.andar(dt,"right") if menus.st == 4 then menus[4][1].andar(dt) end
      else player.andar(dt,"left") if menus.st == 4 then menus[4][1].andar(dt) end
      end
    end
  end
  if menus.st == 2 then
    if love.keyboard.isDown("up") then menus[menus.st].setSel(1)
    elseif love.keyboard.isDown("down") then menus[menus.st].setSel(2)
    elseif love.keyboard.isDown("right") then menus[menus.st].andar("right")
    elseif love.keyboard.isDown("left") then menus[menus.st].andar("left") end
  end
  if menus.st == 4 then 
    menus[4][1].update() 
    if love.keyboard.isDown("right") then hud.stamina("right")
    elseif love.keyboard.isDown("left") then hud.stamina("left")
    else hud.stamina()
    end
  end
end


function love.keypressed(key)
  if menus.st == 4 then
    menus[4][1].coli(player.getRet(),key)
    hud.seleciona(key)
    hud.interacao(key)
  elseif menus.st == 3 then
    menus[3].move(key)
    switch_menu(menus[3].interacao(key),menus.st)
  elseif menus.st == 1 then
    menus[menus.st].coli(key,player.getRet())
  end
  if key == "up" and player.getvelY() == 0 and (menus.st == 1 or menus.st == 4) then player.keypressed("up") end
  if key == "p" then menus.st = 4 end -- SOMENTE PARA O TESTE DA FASE
end

function switch_menu(novo_menu,velho_menu)
  if menus[velho_menu].stop_musica then
    menus[velho_menu].stop_musica()
  end
  if menus[novo_menu].play_musica then
    menus[novo_menu].play_musica()
  end
  menus.st = novo_menu
end

function love.draw()
  if menus.st ~= 4 then menus[menus.st].draw()
  else menus[4][1].draw() -- SOMENTE PARA O TESTE DA FASE
  end
  if menus.st == 4 then player.draw() hud.draw()
  elseif menus.st == 1  then player.draw() 
  end
end

--[[
valor original - 1366
x - love.graphics.getWidth()


1366*x = love.graphics.getWidth() * valor original

x = (love.graphics.getWidth() * valor original)/1366
--]]
