local hud = {}
local sel_item = 1
local call_item = 1
local item01 = 0
local item02 = 0
local item03 = 0
local item04 = 0

function hud.load()
  bac_hud = love.graphics.newImage("Imagens/HUD/hud.png")
  extintor = love.graphics.newImage("Imagens/Itens/Extintor.png")
  radio = love.graphics.newImage("Imagens/Itens/Radio.png")
  lanterna = love.graphics.newImage("Imagens/Itens/Lanterna.png")
  isqueiro = love.graphics.newImage("Imagens/Itens/Isqueiro.png")
end

function hud.draw()
  love.graphics.setColor(255,255,255,255)
  love.graphics.draw(bac_hud,0,0,0,love.graphics.getWidth()/2350,love.graphics.getHeight()/1440,0,0)
  love.graphics.setColor(154, 205, 50, 255)
  love.graphics.rectangle("fill",(love.graphics.getWidth()*78)/2350,(love.graphics.getHeight()*60)/1440,(love.graphics.getWidth()*520)/2350,(love.graphics.getHeight()*69)/1440,love.graphics.setLineWidth(5))
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
  if item01 == 1 then
    love.graphics.draw(extintor,(love.graphics.getWidth() * 2172) / 2350,(love.graphics.getHeight() * 603) / 1440,0,0.07,0.07)
  end
  if item02 == 1 then
    love.graphics.draw(radio,(love.graphics.getWidth() * 2028) / 2350,(love.graphics.getHeight() * 920) / 1440,0,0.4,0.4)
  end
  if item03 == 1 then
    love.graphics.draw(lanterna,(love.graphics.getWidth() * 2037) / 2350,(love.graphics.getHeight() * 1214) / 1440,0,0.3,0.3)
  end
  if item04 == 1 then
    love.graphics.draw(isqueiro,(love.graphics.getWidth() * 2172) / 2350,(love.graphics.getHeight() * 945) / 1440,0,0.4,0.4)
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

function hud.addItem(key)
  if key == "5" then
    item01 = 1
  elseif key == "6" then
    item02 = 1
  elseif key == "7" then
    item03 = 1
  elseif key == "8" then
    item04 = 1
  end
 end
 
return hud