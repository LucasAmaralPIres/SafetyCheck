local fase1 = {}
local loca = {x = -11870,y = 0}
local correr = 1
local  destr = {}
local  spawn = 0
local  dific = 200

function fase1.setCor(ncorrer)
  correr = ncorrer
end

function fase1.keyreleased(key)
  if key == "lshift" then correr = 1
  end
end

function fase1.load()
  bac_fase1 = love.graphics.newImage("Imagens/Fases/Fase 1.png")
  img_destroco = love.graphics.newImage("Imagens/Sprites/Destrocos.png")
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
  love.graphics.draw(bac_fase1,loca.x,loca.y,0,love.graphics.getWidth()*1.5/1366,love.graphics.getHeight()*2/768,0,0)
  for index,v in ipairs(destr) do 
    love.graphics.draw(img_destroco, v.x, v.y,0,(0.5*love.graphics.getWidth())/1366,(0.5*love.graphics.getHeight())/768,0,0,0,0)
  end
end

function fase1.update()
  spawn = spawn + 1
  if (spawn == dific) then
    table.insert(destr,{x = love.math.random(0,1245*love.graphics.getWidth()/1366), y = 0})
    spawn = 0
    if (dific > 10) then
      dific = dific - 5
    end
  end
  for index,v in ipairs(destr) do 
	  v.y = v.y + 8
  end
end

return fase1
