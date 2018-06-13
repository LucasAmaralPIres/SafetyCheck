local fase1 = {}
local loca = {x = -11870,y = 0}
local correr = 1

function fase1.setCor(a)
  correr = a
end

function fase1.keyreleased(key)
  if key == "lshift" then correr = 1
  end
end

function fase1.load()
  bac_fase1 = love.graphics.newImage("Imagens/Fases/Fase 1.png")
end

function fase1.andar(dt,dir)
  if dir == "right" then loca.x = loca.x - (700*dt*correr)
  else loca.x = loca.x + (700*dt*correr)
  end
end

function fase1.play_musica()
  love.audio.play(music_menu_inicial)
  music_menu_inicial:setLooping(true)
end

function fase1.stop_musica()
end

function fase1.draw()
end

return fase1
