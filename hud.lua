local hud = {}
local sel_item = 1
local call_item = 0
local stamina = 520
local correr = 1

function hud.load()
  bac_hud = love.graphics.newImage("Imagens/HUD/hud.png")
end

function hud.draw()
  love.graphics.setColor(255,255,255,255)
  love.graphics.draw(bac_hud,0,0,0,love.graphics.getWidth()/2350,love.graphics.getHeight()/1440,0,0)
  love.graphics.setColor(154, 205, 50, 255)
  love.graphics.rectangle("fill",(love.graphics.getWidth()*78)/2350,(love.graphics.getHeight()*60)/1440,(love.graphics.getWidth()*stamina)/2350,(love.graphics.getHeight()*69)/1440,love.graphics.setLineWidth(5))
  if sel_item == 1 then
      love.graphics.setColor(154, 205, 50, 255)
      love.graphics.rectangle("line", (love.graphics.getWidth() * 2161) / 2350,(love.graphics.getHeight() * 590) / 1440, (love.graphics.getWidth() * 142) / 2350, (love.graphics.getHeight() *294) / 1440, love.graphics.setLineWidth(5))
      love.graphics.setColor(255,255,255,255)
  elseif sel_item == 2 then
      love.graphics.setColor(154, 205, 50, 255)
      love.graphics.rectangle("line", (love.graphics.getWidth() * 2008) / 2350,(love.graphics.getHeight() * 896) / 1440, (love.graphics.getWidth() * 142) / 2350, (love.graphics.getHeight() *294) / 1440, love.graphics.setLineWidth(5))
      love.graphics.setColor(255,255,255,255)
  elseif sel_item == 3 then
      love.graphics.setColor(154, 205, 50, 255)
      love.graphics.rectangle("line", (love.graphics.getWidth() * 2161) / 2350,(love.graphics.getHeight() * 896) / 1440, (love.graphics.getWidth() * 142) / 2350, (love.graphics.getHeight() *294) / 1440, love.graphics.setLineWidth(5))
      love.graphics.setColor(255,255,255,255)
  elseif sel_item == 4 then
      love.graphics.setColor(154, 205, 50, 255)
      love.graphics.rectangle("line", (love.graphics.getWidth() * 2008) / 2350,(love.graphics.getHeight() * 1202) / 1440, (love.graphics.getWidth() * 294) / 2350, (love.graphics.getHeight() *142) / 1440, love.graphics.setLineWidth(5))
      love.graphics.setColor(255,255,255,255)
  end
end

function hud.seleciona(key)
  if key == "1" then
      sel_item = 1
  elseif key == "2" then 
      sel_item = 2
  elseif key == "3" then 
      sel_item = 3
  elseif key == "4" then 
      sel_item = 4
  end
  return sel_item
end

 function hud.interacao(key)
  if key == "return" then
    if sel_item == 1 then
      call_item = 1
    elseif sel_item == 2 then
      call_item = 2
    elseif sel_item == 3 then
      call_item = 3
    elseif sel_item == 4 then
      call_item = 4
    end
  end
  return call_item
 end
 
function hud.correr(ncorrer)
  correr = ncorrer
end

 function hud.keyreleased(key)
   if key == "lshift" then
     correr = 1
   end
end

function hud.stamina(key)
  if correr ~= 1 and stamina > 0 then
    if key == "left" or key == "right" then
      stamina = stamina - 2
    end
  elseif stamina < 520 and correr == 1 then 
    stamina = stamina + 0.5
  end 
end
return hud