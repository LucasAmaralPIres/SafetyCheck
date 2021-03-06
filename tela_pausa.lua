local tela_pausa = {}
local sel_pause = 1
local called = 3

function tela_pausa.load()
  bac_tela_pausa = love.graphics.newImage("Imagens/Menu/tela_pausa.png")
end

function tela_pausa.draw()
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.draw(bac_tela_pausa,0,0,0,love.graphics.getWidth()/bac_tela_pausa:getWidth(),love.graphics.getHeight()/bac_tela_pausa:getHeight(),0,0)
    if sel_pause == 1 then
      love.graphics.setColor(154, 205, 50, 255)
      love.graphics.rectangle("line", (love.graphics.getWidth() * 508) / 1366,(love.graphics.getHeight() * 223) / 768, (love.graphics.getWidth() * 350) / 1366, (love.graphics.getHeight() * 68) / 768, love.graphics.setLineWidth(15))
    elseif sel_pause == 2 then
      love.graphics.setColor(154, 205, 50, 255)
      love.graphics.rectangle("line", (love.graphics.getWidth() * 582) / 1366,(love.graphics.getHeight() * 323) / 768, (love.graphics.getWidth() * 203) / 1366, (love.graphics.getHeight() * 57) / 768, love.graphics.setLineWidth(15))
    elseif sel_pause == 3 then 
      love.graphics.setColor(154, 205, 50, 255)
      love.graphics.rectangle("line", (love.graphics.getWidth() * 632) / 1366,(love.graphics.getHeight() * 411) / 768, (love.graphics.getWidth() * 103) / 1366, (love.graphics.getHeight() * 57) / 768, love.graphics.setLineWidth(15))  
    end
 end 


function tela_pausa.keypressed(key)
  if key == 'escape' then
    switch_menu(4,getSt())
  end
end
 
 function tela_pausa.move(key)
  if key == "down" then
      sel_pause = sel_pause + 1
      if sel_pause > 3 then
        sel_pause = 1
      end
  elseif key == "up" then 
      sel_pause = sel_pause - 1
      if sel_pause < 1 then
        sel_pause = 3
      end
  end
  return sel_pause
end

function tela_pausa.interacao(key)
  if key == "return" then
    if sel_pause == 1 then
      called = 2
    elseif sel_pause == 2 then
      called = 4
    elseif sel_pause == 3 then
      called = 1
    end
  end
  return called
 end
 
 function tela_pausa.play_musica()
end

function tela_pausa.stop_musica()
end

 return tela_pausa