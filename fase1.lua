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

function fase1.draw()
  love.graphics.draw(bac_fase1,loca.x,loca.y,0,love.graphics.getWidth()*1.5/1366,love.graphics.getHeight()*2/768,0,0)
end

return fase1
