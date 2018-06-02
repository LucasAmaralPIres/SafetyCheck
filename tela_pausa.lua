local tela_pausa = {}

function tela_pausa.load()
  bac_tela_pausa = love.graphics.newImage("Imagens/Menu/tela_pausa.png")
end

function tela_pausa.draw()
  	love.graphics.draw(bac_tela_pausa,0,0,0,love.graphics.getWidth()/bac_tela_pausa:getWidth(),love.graphics.getHeight()/bac_tela_pausa:getHeight(),0,0)
 end
 
 return tela_pausa