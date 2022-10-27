*** Settings ***
Library     SeleniumLibrary


*** Variables ***
#Dados de teste
${NomeDaMusica}     Bruno Mars monkey

#variaveis de coniguração
${url}        https://www.youtube.com/
${Browser}    Chrome
 

 #Elementos 
${input_Pesquisa}         //input[@id="search"]
${Button_Pesquisa}        //button[@id="search-icon-legacy"]    
${Primeiro}               (//yt-formatted-string[@class="style-scope ytd-video-renderer"])[1]
${Prova}                 (//yt-formatted-string[contains(text(),"Compartilhar")])[1]


*** Keywords ***
Dado que eu acesse o site do youtube
    Open Browser    ${url}         ${Browser}
Quando digito o nome da música 
    Input Text      ${input_Pesquisa}  ${NomeDaMusica}

 E clico no botão buscar
    Click Element     ${Button_Pesquisa}
 E clico na primeira opção da lista
    Wait Until Element Is Visible    ${Primeiro}        20
    Click Element     ${Primeiro} 
 então o video e executado
   Wait Until Element Is Visible   ${Prova}             20
    Element Should Be Visible   ${Prova}   
    Sleep  5s
    Close Browser


*** Test Cases ***
cenario 1: executar video no site do youtub 
    Dado que eu acesse o site do youtube
    Quando digito o nome da música 
    E clico no botão buscar 
    E clico na primeira opção da lista 
    então o video e executado


