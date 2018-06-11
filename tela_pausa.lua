local tela_pausa = {}
local selecionado = 1

function tela_pausa.load()
  bac_tela_pausa = love.graphics.newImage("Imagens/Menu/tela_pausa.png")
end

function tela_pausa.draw()
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.draw(bac_tela_pausa,0,0,0,love.graphics.getWidth()/bac_tela_pausa:getWidth(),love.graphics.getHeight()/bac_tela_pausa:getHeight(),0,0)
    if selecionado == 1 then
      love.graphics.setColor(154, 205, 50, 255)
      love.graphics.rectangle("fill", (love.graphics.getWidth() * 508) / 1366,(love.graphics.getHeight() * 223) / 768, (love.graphics.getWidth() * 350) / 1366, (love.graphics.getHeight() * 68) / 768)
    elseif selecionado == 2 then
      love.graphics.setColor(154, 205, 50, 255)
      love.graphics.rectangle("fill", (love.graphics.getWidth() * 582) / 1366,(love.graphics.getHeight() * 323) / 768, (love.graphics.getWidth() * 203) / 1366, (love.graphics.getHeight() * 57) / 768)
    elseif selecionado == 3 then 
      love.graphics.setColor(154, 205, 50, 255)
      love.graphics.rectangle("fill", (love.graphics.getWidth() * 632) / 1366,(love.graphics.getHeight() * 411) / 768, (love.graphics.getWidth() * 103) / 1366, (love.graphics.getHeight() * 57) / 768)  
    end
 end
 
 function tela_pausa.play_musica()
end

function tela_pausa.stop_musica()
end

 return tela_pausa