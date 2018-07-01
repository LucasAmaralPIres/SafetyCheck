local tela_morte = {}
local sel_morte = 1
local death = 0
local cont_mortes = 0
local how = ""
local co = true

function tela_morte.load()
  bac_tela_morte = love.graphics.newImage("Imagens/Menu/tela_morte.png")
end

function tela_morte.getDeath()
  return death
end

function tela_morte.draw()
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.draw(bac_tela_morte,0,0,0,love.graphics.getWidth()/bac_tela_morte:getWidth(),love.graphics.getHeight()/bac_tela_morte:getHeight(),0,0)
  love.graphics.setColor(255,0,0,255)
  love.graphics.print(how,cons_w*580,cons_h*400,0,5,5)
  love.graphics.setColor(154, 205, 50, 255)
  if sel_morte == 1 then
    love.graphics.rectangle("line", (love.graphics.getWidth() * 568) / 1366,(love.graphics.getHeight() * 510) / 768, (love.graphics.getWidth() * 225) / 1366, (love.graphics.getHeight() * 68) / 768, love.graphics.setLineWidth(15))
  elseif sel_morte == 2 then
    love.graphics.rectangle("line", (love.graphics.getWidth() * 625) / 1366,(love.graphics.getHeight() * 590) / 768, (love.graphics.getWidth() * 115) / 1366, (love.graphics.getHeight() * 52) / 768, love.graphics.setLineWidth(15))
  end
  love.graphics.print(cont_mortes, love.graphics.getWidth() * 780/1366, love.graphics.getHeight() * 50/768, 0, 20, 20)
end

function tela_morte.setCo(nco)
  co = nco
end

function tela_morte.getCo()
  return co
end

function tela_morte.getMorte()
  return cont_mortes
end

function tela_morte.move(key)
  if key == "down" then
    sel_morte = sel_morte + 1
    if sel_morte > 2 then
      sel_morte = 1
    end
  else
    sel_morte = sel_morte - 1
    if sel_morte < 1 then
      sel_morte = 2
    end
  end
end

function tela_morte.interacao()
  if death == 1 then
    if sel_morte == 1 then
      death = 0
      co = false
    elseif sel_morte == 2 then 
      love.event.quit()
    end
  end  
end

function tela_morte.death(queimado)
  if death == 1 then death = 0 else cont_mortes = cont_mortes + 1 death = 1 end
  how = queimado
end

return tela_morte
  