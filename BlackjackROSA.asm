;	Este e um jogo que simula uma partida de blackjack(ou 21) feito em assembly entre o jogador e a casa(ou maquina/cassino), para
;joga-lo basta seguir alguns comandos simples, para comprar cartas, aumentar sua aposta ou prosseguir no jogo.
;	O jogo funciona da seguinte maneira, o primeiro a jogar e o usuario, que pode comprar até 5 cartas no intuito de somar 21, feito
;isso e a vez da casa que segue o algoritmo de comprar cartas até somar no mínimo 17 pontos, quando ela tiver em mãos esse tanto de cartas
;ela para de comprar cartas(sempre obedecendo o limite de 5 cartas). As cartas da casa entram todas, com excessão da primeira, viradas
;assim possibilitando ao jogador antes da mesma revelar suas cartas compradas dobrar a aposta atual do jogo.
;	Por fim a casa revela suas cartas e são comparados os valores somados pelos dois participantes, caso nenhum dos dois passe de 21
;ganha aquele que chegar mais proximo de 21, com o empate SEMPRE SENDO DA CASA, caso contrario, ganha quem passou menos de 21, por exemplo
;se o usuário somar 22 e a casa 23 quem ganha é o usuário.
;	O código segue a seguinte estrutura, primeiro temos as declarações das strings e "telas" que serão usadas no jogo, das variaveis e
;tambem de um vetor de 1040 números aleatórios que simboliza as cartas indo de 1 a 10 sendo 10 representado pela figura K. Depois disso
;temos a função main, onde as variaveis sao inciadas e o loop do jogo acontece. Importante ressaltar que o acesso ao vetor de numeros
;aleatórios acontece atravez da tecla digitada no começo do jogo, que serve de semente para o acesso.
;	Depois da função main seguem todas as outras funções utilizadas, sendo as primeiras de realização da lógica do jogo e as ultimas
;relacionadas á impressão das cartas.
; 	Para a implementação desse jogo o mapa de caracteres foi alterado.
; ------- TABELA DE CORES -------
; adicione ao caracter para Selecionar a cor correspondente

; 0 branco							0000 0000
; 256 marrom						0001 0000
; 512 verde							0010 0000
; 768 oliva							0011 0000
; 1024 azul marinho					0100 0000
; 1280 roxo							0101 0000
; 1536 teal							0110 0000
; 1792 prata						0111 0000
; 2048 cinza						1000 0000
; 2304 vermelho						1001 0000
; 2560 lima							1010 0000
; 2816 amarelo						1011 0000
; 3072 azul							1100 0000
; 3328 rosa							1101 0000
; 3584 aqua							1110 0000
; 3840 branco						1111 0000

;primeira cartas
carta0 : string "              ****** ******             "
carta1 : string "              *&**** *%****             "
carta2 : string "              ****** ******             "
carta3 : string "              ****** ******             "
carta4 : string "              ****** ******             "
carta5 : string "              ****&* ****%*             "
carta6 : string "              ****** ******             "

;3 cartas
c3arta0 : string "          ****** ****** ******          "
c3arta1 : string "          *&**** *%**** *#****          "
c3arta2 : string "          ****** ****** ******          "
c3arta3 : string "          ****** ****** ******          "
c3arta4 : string "          ****** ****** ******          "
c3arta5 : string "          ****&* ****%* ****#*          "
c3arta6 : string "          ****** ****** ******          "

;4 cartas

c4arta0 : string "      ****** ****** ****** ******       "
c4arta1 : string "      *&**** *%**** *#**** *@****       "
c4arta2 : string "      ****** ****** ****** ******       "
c4arta3 : string "      ****** ****** ****** ******       "
c4arta4 : string "      ****** ****** ****** ******       "
c4arta5 : string "      ****&* ****%* ****#* ****@*       "
c4arta6 : string "      ****** ****** ****** ******       "

;5 cartas

c5arta0 : string "   ****** ****** ****** ****** ******   "
c5arta1 : string "   *&**** *%**** *#**** *@**** *#****   "
c5arta2 : string "   ****** ****** ****** ****** ******   "
c5arta3 : string "   ****** ****** ****** ****** ******   "
c5arta4 : string "   ****** ****** ****** ****** ******   "
c5arta5 : string "   ****&* ****%* ****#* ****@* ****#*   "
c5arta6 : string "   ****** ****** ****** ****** ******   "


RAND : var #1040
static RAND + #0, #7
static RAND + #1, #7
static RAND + #2, #9
static RAND + #3, #8
static RAND + #4, #3
static RAND + #5, #2
static RAND + #6, #6
static RAND + #7, #2
static RAND + #8, #2
static RAND + #9, #2
static RAND + #10, #8
static RAND + #11, #1
static RAND + #12, #9
static RAND + #13, #4
static RAND + #14, #5
static RAND + #15, #5
static RAND + #16, #6
static RAND + #17, #6
static RAND + #18, #10
static RAND + #19, #7
static RAND + #20, #6
static RAND + #21, #1
static RAND + #22, #10
static RAND + #23, #1
static RAND + #24, #10
static RAND + #25, #1
static RAND + #26, #10
static RAND + #27, #1
static RAND + #28, #7
static RAND + #29, #9
static RAND + #30, #8
static RAND + #31, #5
static RAND + #32, #8
static RAND + #33, #9
static RAND + #34, #9
static RAND + #35, #10
static RAND + #36, #2
static RAND + #37, #6
static RAND + #38, #1
static RAND + #39, #8
static RAND + #40, #10
static RAND + #41, #8
static RAND + #42, #5
static RAND + #43, #2
static RAND + #44, #6
static RAND + #45, #8
static RAND + #46, #4
static RAND + #47, #3
static RAND + #48, #6
static RAND + #49, #4
static RAND + #50, #9
static RAND + #51, #4
static RAND + #52, #8
static RAND + #53, #2
static RAND + #54, #4
static RAND + #55, #1
static RAND + #56, #8
static RAND + #57, #9
static RAND + #58, #5
static RAND + #59, #6
static RAND + #60, #6
static RAND + #61, #9
static RAND + #62, #2
static RAND + #63, #2
static RAND + #64, #6
static RAND + #65, #9
static RAND + #66, #2
static RAND + #67, #1
static RAND + #68, #10
static RAND + #69, #4
static RAND + #70, #2
static RAND + #71, #5
static RAND + #72, #3
static RAND + #73, #1
static RAND + #74, #7
static RAND + #75, #6
static RAND + #76, #5
static RAND + #77, #6
static RAND + #78, #2
static RAND + #79, #8
static RAND + #80, #1
static RAND + #81, #8
static RAND + #82, #1
static RAND + #83, #5
static RAND + #84, #3
static RAND + #85, #4
static RAND + #86, #4
static RAND + #87, #9
static RAND + #88, #7
static RAND + #89, #6
static RAND + #90, #2
static RAND + #91, #5
static RAND + #92, #3
static RAND + #93, #8
static RAND + #94, #5
static RAND + #95, #3
static RAND + #96, #2
static RAND + #97, #5
static RAND + #98, #4
static RAND + #99, #1
static RAND + #100, #8
static RAND + #101, #3
static RAND + #102, #1
static RAND + #103, #4
static RAND + #104, #6
static RAND + #105, #10
static RAND + #106, #3
static RAND + #107, #4
static RAND + #108, #10
static RAND + #109, #8
static RAND + #110, #9
static RAND + #111, #7
static RAND + #112, #7
static RAND + #113, #4
static RAND + #114, #6
static RAND + #115, #5
static RAND + #116, #8
static RAND + #117, #3
static RAND + #118, #1
static RAND + #119, #2
static RAND + #120, #9
static RAND + #121, #4
static RAND + #122, #9
static RAND + #123, #3
static RAND + #124, #6
static RAND + #125, #8
static RAND + #126, #7
static RAND + #127, #2
static RAND + #128, #7
static RAND + #129, #7
static RAND + #130, #10
static RAND + #131, #3
static RAND + #132, #4
static RAND + #133, #6
static RAND + #134, #9
static RAND + #135, #2
static RAND + #136, #8
static RAND + #137, #9
static RAND + #138, #9
static RAND + #139, #9
static RAND + #140, #8
static RAND + #141, #8
static RAND + #142, #10
static RAND + #143, #5			;1292
static RAND + #144, #4			
static RAND + #145, #8			
static RAND + #146, #6	
static RAND + #147, #3
static RAND + #148, #6
static RAND + #149, #9
static RAND + #150, #9			;1299
static RAND + #151, #5			
static RAND + #152, #3
static RAND + #153, #10
static RAND + #154, #8
static RAND + #155, #9
static RAND + #156, #10
static RAND + #157, #4
static RAND + #158, #6
static RAND + #159, #6
static RAND + #160, #3
static RAND + #161, #7
static RAND + #162, #6
static RAND + #163, #1
static RAND + #164, #2
static RAND + #165, #1
static RAND + #166, #3
static RAND + #167, #10
static RAND + #168, #1
static RAND + #169, #10
static RAND + #170, #1
static RAND + #171, #5
static RAND + #172, #6
static RAND + #173, #9
static RAND + #174, #4
static RAND + #175, #7
static RAND + #176, #7
static RAND + #177, #10
static RAND + #178, #2
static RAND + #179, #6
static RAND + #180, #7
static RAND + #181, #3
static RAND + #182, #9
static RAND + #183, #10
static RAND + #184, #10
static RAND + #185, #10
static RAND + #186, #10
static RAND + #187, #6
static RAND + #188, #2
static RAND + #189, #6
static RAND + #190, #4
static RAND + #191, #3
static RAND + #192, #8
static RAND + #193, #5
static RAND + #194, #10
static RAND + #195, #2
static RAND + #196, #7
static RAND + #197, #3
static RAND + #198, #4
static RAND + #199, #1
static RAND + #200, #5
static RAND + #201, #9
static RAND + #202, #10
static RAND + #203, #9
static RAND + #204, #10
static RAND + #205, #7
static RAND + #206, #7
static RAND + #207, #1
static RAND + #208, #9
static RAND + #209, #5
static RAND + #210, #5
static RAND + #211, #8
static RAND + #212, #3
static RAND + #213, #5
static RAND + #214, #5
static RAND + #215, #6
static RAND + #216, #8
static RAND + #217, #6
static RAND + #218, #3
static RAND + #219, #3
static RAND + #220, #8
static RAND + #221, #5
static RAND + #222, #10
static RAND + #223, #3
static RAND + #224, #9
static RAND + #225, #9
static RAND + #226, #4
static RAND + #227, #10
static RAND + #228, #7
static RAND + #229, #10
static RAND + #230, #4
static RAND + #231, #2
static RAND + #232, #3
static RAND + #233, #6
static RAND + #234, #9
static RAND + #235, #9
static RAND + #236, #2
static RAND + #237, #9
static RAND + #238, #1
static RAND + #239, #4
static RAND + #240, #9
static RAND + #241, #1
static RAND + #242, #5
static RAND + #243, #2
static RAND + #244, #2
static RAND + #245, #2
static RAND + #246, #9
static RAND + #247, #2
static RAND + #248, #7
static RAND + #249, #6
static RAND + #250, #5
static RAND + #251, #7
static RAND + #252, #1
static RAND + #253, #8
static RAND + #254, #7
static RAND + #255, #5
static RAND + #256, #1
static RAND + #257, #4
static RAND + #258, #9
static RAND + #259, #3
static RAND + #260, #10
static RAND + #261, #4
static RAND + #262, #10
static RAND + #263, #10
static RAND + #264, #10
static RAND + #265, #7
static RAND + #266, #2
static RAND + #267, #7
static RAND + #268, #1
static RAND + #269, #5
static RAND + #270, #10
static RAND + #271, #10
static RAND + #272, #5
static RAND + #273, #5
static RAND + #274, #6
static RAND + #275, #6
static RAND + #276, #4
static RAND + #277, #9
static RAND + #278, #8
static RAND + #279, #3
static RAND + #280, #6
static RAND + #281, #6
static RAND + #282, #1
static RAND + #283, #8
static RAND + #284, #4
static RAND + #285, #5
static RAND + #286, #3
static RAND + #287, #8
static RAND + #288, #8
static RAND + #289, #6
static RAND + #290, #10
static RAND + #291, #5
static RAND + #292, #6
static RAND + #293, #1
static RAND + #294, #10
static RAND + #295, #6
static RAND + #296, #9
static RAND + #297, #4
static RAND + #298, #3
static RAND + #299, #6
static RAND + #300, #8
static RAND + #301, #6
static RAND + #302, #7
static RAND + #303, #3
static RAND + #304, #7
static RAND + #305, #2
static RAND + #306, #1
static RAND + #307, #7
static RAND + #308, #7
static RAND + #309, #10
static RAND + #310, #2
static RAND + #311, #6
static RAND + #312, #4
static RAND + #313, #5
static RAND + #314, #3
static RAND + #315, #3
static RAND + #316, #7
static RAND + #317, #6
static RAND + #318, #4
static RAND + #319, #2
static RAND + #320, #7
static RAND + #321, #7
static RAND + #322, #3
static RAND + #323, #5
static RAND + #324, #4
static RAND + #325, #1
static RAND + #326, #8
static RAND + #327, #8
static RAND + #328, #5
static RAND + #329, #1
static RAND + #330, #2
static RAND + #331, #7
static RAND + #332, #8
static RAND + #333, #3
static RAND + #334, #7
static RAND + #335, #2
static RAND + #336, #7
static RAND + #337, #10
static RAND + #338, #10
static RAND + #339, #9
static RAND + #340, #7
static RAND + #341, #9
static RAND + #342, #7
static RAND + #343, #4
static RAND + #344, #1
static RAND + #345, #1
static RAND + #346, #6
static RAND + #347, #4
static RAND + #348, #5
static RAND + #349, #5
static RAND + #350, #6
static RAND + #351, #1
static RAND + #352, #9
static RAND + #353, #3
static RAND + #354, #10
static RAND + #355, #3
static RAND + #356, #9
static RAND + #357, #10
static RAND + #358, #1
static RAND + #359, #1
static RAND + #360, #10
static RAND + #361, #7
static RAND + #362, #7
static RAND + #363, #2
static RAND + #364, #4
static RAND + #365, #8
static RAND + #366, #2
static RAND + #367, #4
static RAND + #368, #7
static RAND + #369, #7
static RAND + #370, #7
static RAND + #371, #5
static RAND + #372, #4
static RAND + #373, #1
static RAND + #374, #4
static RAND + #375, #6
static RAND + #376, #6
static RAND + #377, #9
static RAND + #378, #6
static RAND + #379, #10
static RAND + #380, #7
static RAND + #381, #4
static RAND + #382, #6
static RAND + #383, #4
static RAND + #384, #8
static RAND + #385, #4
static RAND + #386, #5
static RAND + #387, #9
static RAND + #388, #9
static RAND + #389, #2
static RAND + #390, #9
static RAND + #391, #10
static RAND + #392, #6
static RAND + #393, #2
static RAND + #394, #9
static RAND + #395, #7
static RAND + #396, #8
static RAND + #397, #6
static RAND + #398, #10
static RAND + #399, #10
static RAND + #400, #5
static RAND + #401, #5
static RAND + #402, #5
static RAND + #403, #10
static RAND + #404, #4
static RAND + #405, #1
static RAND + #406, #5
static RAND + #407, #9
static RAND + #408, #4
static RAND + #409, #10
static RAND + #410, #5
static RAND + #411, #3
static RAND + #412, #1
static RAND + #413, #2
static RAND + #414, #2
static RAND + #415, #7
static RAND + #416, #9
static RAND + #417, #5
static RAND + #418, #9
static RAND + #419, #9
static RAND + #420, #6
static RAND + #421, #9
static RAND + #422, #6
static RAND + #423, #4
static RAND + #424, #4
static RAND + #425, #10
static RAND + #426, #7
static RAND + #427, #5
static RAND + #428, #10
static RAND + #429, #7
static RAND + #430, #3
static RAND + #431, #5
static RAND + #432, #2
static RAND + #433, #6
static RAND + #434, #8
static RAND + #435, #6
static RAND + #436, #3
static RAND + #437, #1
static RAND + #438, #8
static RAND + #439, #8
static RAND + #440, #8
static RAND + #441, #2
static RAND + #442, #8
static RAND + #443, #8
static RAND + #444, #4
static RAND + #445, #5
static RAND + #446, #2
static RAND + #447, #3
static RAND + #448, #3
static RAND + #449, #9
static RAND + #450, #10
static RAND + #451, #8
static RAND + #452, #10
static RAND + #453, #6
static RAND + #454, #2
static RAND + #455, #6
static RAND + #456, #1
static RAND + #457, #9
static RAND + #458, #1
static RAND + #459, #8
static RAND + #460, #5
static RAND + #461, #7
static RAND + #462, #1
static RAND + #463, #9
static RAND + #464, #3
static RAND + #465, #3
static RAND + #466, #8
static RAND + #467, #2
static RAND + #468, #9
static RAND + #469, #4
static RAND + #470, #2
static RAND + #471, #7
static RAND + #472, #10
static RAND + #473, #9
static RAND + #474, #1
static RAND + #475, #4
static RAND + #476, #9
static RAND + #477, #3
static RAND + #478, #3
static RAND + #479, #5
static RAND + #480, #10
static RAND + #481, #8
static RAND + #482, #4
static RAND + #483, #5
static RAND + #484, #6
static RAND + #485, #5
static RAND + #486, #2
static RAND + #487, #9
static RAND + #488, #9
static RAND + #489, #1
static RAND + #490, #1
static RAND + #491, #7
static RAND + #492, #2
static RAND + #493, #5
static RAND + #494, #3
static RAND + #495, #4
static RAND + #496, #9
static RAND + #497, #2
static RAND + #498, #2
static RAND + #499, #8
static RAND + #500, #6
static RAND + #501, #2
static RAND + #502, #1
static RAND + #503, #3
static RAND + #504, #6
static RAND + #505, #1
static RAND + #506, #10
static RAND + #507, #5
static RAND + #508, #6
static RAND + #509, #1
static RAND + #510, #2
static RAND + #511, #6
static RAND + #512, #5
static RAND + #513, #5
static RAND + #514, #3
static RAND + #515, #1
static RAND + #516, #4
static RAND + #517, #5
static RAND + #518, #9
static RAND + #519, #4
static RAND + #520, #7
static RAND + #521, #6
static RAND + #522, #6
static RAND + #523, #5
static RAND + #524, #9
static RAND + #525, #5
static RAND + #526, #10
static RAND + #527, #8
static RAND + #528, #2
static RAND + #529, #1
static RAND + #530, #4
static RAND + #531, #5
static RAND + #532, #5
static RAND + #533, #7
static RAND + #534, #2
static RAND + #535, #5
static RAND + #536, #9
static RAND + #537, #8
static RAND + #538, #10
static RAND + #539, #10
static RAND + #540, #5
static RAND + #541, #9
static RAND + #542, #1
static RAND + #543, #9
static RAND + #544, #4
static RAND + #545, #6
static RAND + #546, #9
static RAND + #547, #3
static RAND + #548, #6
static RAND + #549, #7
static RAND + #550, #7
static RAND + #551, #5
static RAND + #552, #8
static RAND + #553, #6
static RAND + #554, #2
static RAND + #555, #1
static RAND + #556, #1
static RAND + #557, #7
static RAND + #558, #4
static RAND + #559, #2
static RAND + #560, #1
static RAND + #561, #4
static RAND + #562, #5
static RAND + #563, #1
static RAND + #564, #9
static RAND + #565, #1
static RAND + #566, #3
static RAND + #567, #4
static RAND + #568, #6
static RAND + #569, #9
static RAND + #570, #4
static RAND + #571, #7
static RAND + #572, #5
static RAND + #573, #6
static RAND + #574, #6
static RAND + #575, #6
static RAND + #576, #2
static RAND + #577, #5
static RAND + #578, #7
static RAND + #579, #3
static RAND + #580, #3
static RAND + #581, #9
static RAND + #582, #10
static RAND + #583, #1
static RAND + #584, #6
static RAND + #585, #10
static RAND + #586, #5
static RAND + #587, #4
static RAND + #588, #5
static RAND + #589, #7
static RAND + #590, #7
static RAND + #591, #10
static RAND + #592, #2
static RAND + #593, #5
static RAND + #594, #5
static RAND + #595, #3
static RAND + #596, #2
static RAND + #597, #6
static RAND + #598, #8
static RAND + #599, #5
static RAND + #600, #6
static RAND + #601, #8
static RAND + #602, #7
static RAND + #603, #7
static RAND + #604, #1
static RAND + #605, #3
static RAND + #606, #10
static RAND + #607, #2
static RAND + #608, #6
static RAND + #609, #2
static RAND + #610, #10
static RAND + #611, #1
static RAND + #612, #5
static RAND + #613, #3
static RAND + #614, #1
static RAND + #615, #2
static RAND + #616, #5
static RAND + #617, #8
static RAND + #618, #8
static RAND + #619, #9
static RAND + #620, #7
static RAND + #621, #3
static RAND + #622, #2
static RAND + #623, #4
static RAND + #624, #2
static RAND + #625, #4
static RAND + #626, #6
static RAND + #627, #8
static RAND + #628, #5
static RAND + #629, #2
static RAND + #630, #4
static RAND + #631, #8
static RAND + #632, #3
static RAND + #633, #10
static RAND + #634, #5
static RAND + #635, #8
static RAND + #636, #4
static RAND + #637, #8
static RAND + #638, #7
static RAND + #639, #9
static RAND + #640, #8
static RAND + #641, #7
static RAND + #642, #9
static RAND + #643, #10
static RAND + #644, #1
static RAND + #645, #4
static RAND + #646, #6
static RAND + #647, #6
static RAND + #648, #10
static RAND + #649, #1
static RAND + #650, #5
static RAND + #651, #7
static RAND + #652, #10
static RAND + #653, #8
static RAND + #654, #9
static RAND + #655, #6
static RAND + #656, #10
static RAND + #657, #5
static RAND + #658, #7
static RAND + #659, #1
static RAND + #660, #7
static RAND + #661, #7
static RAND + #662, #9
static RAND + #663, #4
static RAND + #664, #10
static RAND + #665, #1
static RAND + #666, #4
static RAND + #667, #1
static RAND + #668, #4
static RAND + #669, #6
static RAND + #670, #3
static RAND + #671, #4
static RAND + #672, #1
static RAND + #673, #2
static RAND + #674, #2
static RAND + #675, #8
static RAND + #676, #2
static RAND + #677, #6
static RAND + #678, #9
static RAND + #679, #10
static RAND + #680, #2
static RAND + #681, #9
static RAND + #682, #6
static RAND + #683, #4
static RAND + #684, #9
static RAND + #685, #6
static RAND + #686, #2
static RAND + #687, #10
static RAND + #688, #8
static RAND + #689, #2
static RAND + #690, #10
static RAND + #691, #5
static RAND + #692, #10
static RAND + #693, #6
static RAND + #694, #2
static RAND + #695, #1
static RAND + #696, #9
static RAND + #697, #8
static RAND + #698, #4
static RAND + #699, #9
static RAND + #700, #10
static RAND + #701, #1
static RAND + #702, #4
static RAND + #703, #7
static RAND + #704, #9
static RAND + #705, #10
static RAND + #706, #3
static RAND + #707, #8
static RAND + #708, #6
static RAND + #709, #6
static RAND + #710, #5
static RAND + #711, #3
static RAND + #712, #4
static RAND + #713, #3
static RAND + #714, #4
static RAND + #715, #1
static RAND + #716, #2
static RAND + #717, #2
static RAND + #718, #10
static RAND + #719, #3
static RAND + #720, #5
static RAND + #721, #1
static RAND + #722, #2
static RAND + #723, #8
static RAND + #724, #7
static RAND + #725, #3
static RAND + #726, #9
static RAND + #727, #2
static RAND + #728, #9
static RAND + #729, #1
static RAND + #730, #9
static RAND + #731, #2
static RAND + #732, #9
static RAND + #733, #4
static RAND + #734, #1
static RAND + #735, #9
static RAND + #736, #7
static RAND + #737, #5
static RAND + #738, #3
static RAND + #739, #3
static RAND + #740, #8
static RAND + #741, #10
static RAND + #742, #2
static RAND + #743, #1
static RAND + #744, #9
static RAND + #745, #3
static RAND + #746, #10
static RAND + #747, #6
static RAND + #748, #5
static RAND + #749, #4
static RAND + #750, #3
static RAND + #751, #9
static RAND + #752, #3
static RAND + #753, #1
static RAND + #754, #3
static RAND + #755, #7
static RAND + #756, #10
static RAND + #757, #9
static RAND + #758, #8
static RAND + #759, #1
static RAND + #760, #5
static RAND + #761, #8
static RAND + #762, #2
static RAND + #763, #3
static RAND + #764, #5
static RAND + #765, #7
static RAND + #766, #3
static RAND + #767, #9
static RAND + #768, #2
static RAND + #769, #10
static RAND + #770, #2
static RAND + #771, #4
static RAND + #772, #1
static RAND + #773, #1
static RAND + #774, #4
static RAND + #775, #6
static RAND + #776, #3
static RAND + #777, #6
static RAND + #778, #10
static RAND + #779, #9
static RAND + #780, #7
static RAND + #781, #3
static RAND + #782, #8
static RAND + #783, #7
static RAND + #784, #9
static RAND + #785, #10
static RAND + #786, #5
static RAND + #787, #6
static RAND + #788, #8
static RAND + #789, #5
static RAND + #790, #10
static RAND + #791, #7
static RAND + #792, #3
static RAND + #793, #6
static RAND + #794, #5
static RAND + #795, #6
static RAND + #796, #9
static RAND + #797, #4
static RAND + #798, #8
static RAND + #799, #8
static RAND + #800, #5
static RAND + #801, #8
static RAND + #802, #4
static RAND + #803, #6
static RAND + #804, #8
static RAND + #805, #7
static RAND + #806, #8
static RAND + #807, #5
static RAND + #808, #2
static RAND + #809, #4
static RAND + #810, #6
static RAND + #811, #5
static RAND + #812, #9
static RAND + #813, #5
static RAND + #814, #3
static RAND + #815, #10
static RAND + #816, #4
static RAND + #817, #10
static RAND + #818, #1
static RAND + #819, #9
static RAND + #820, #10
static RAND + #821, #3
static RAND + #822, #1
static RAND + #823, #5
static RAND + #824, #2
static RAND + #825, #5
static RAND + #826, #2
static RAND + #827, #4
static RAND + #828, #1
static RAND + #829, #5
static RAND + #830, #10
static RAND + #831, #3
static RAND + #832, #4
static RAND + #833, #5
static RAND + #834, #10
static RAND + #835, #5
static RAND + #836, #5
static RAND + #837, #4
static RAND + #838, #8
static RAND + #839, #8
static RAND + #840, #5
static RAND + #841, #8
static RAND + #842, #4
static RAND + #843, #5
static RAND + #844, #10
static RAND + #845, #6
static RAND + #846, #10
static RAND + #847, #6
static RAND + #848, #4
static RAND + #849, #3
static RAND + #850, #3
static RAND + #851, #1
static RAND + #852, #10
static RAND + #853, #7
static RAND + #854, #3
static RAND + #855, #2
static RAND + #856, #4
static RAND + #857, #10
static RAND + #858, #9
static RAND + #859, #7
static RAND + #860, #8
static RAND + #861, #2
static RAND + #862, #3
static RAND + #863, #4
static RAND + #864, #9
static RAND + #865, #3
static RAND + #866, #4
static RAND + #867, #2
static RAND + #868, #2
static RAND + #869, #4
static RAND + #870, #6
static RAND + #871, #10
static RAND + #872, #1
static RAND + #873, #2
static RAND + #874, #4
static RAND + #875, #9
static RAND + #876, #3
static RAND + #877, #6
static RAND + #878, #4
static RAND + #879, #9
static RAND + #880, #10
static RAND + #881, #3
static RAND + #882, #3
static RAND + #883, #3
static RAND + #884, #3
static RAND + #885, #10
static RAND + #886, #3
static RAND + #887, #9
static RAND + #888, #6
static RAND + #889, #2
static RAND + #890, #5
static RAND + #891, #6
static RAND + #892, #4
static RAND + #893, #9
static RAND + #894, #10
static RAND + #895, #4
static RAND + #896, #10
static RAND + #897, #2
static RAND + #898, #8
static RAND + #899, #5
static RAND + #900, #2
static RAND + #901, #6
static RAND + #902, #3
static RAND + #903, #10
static RAND + #904, #6
static RAND + #905, #1
static RAND + #906, #3
static RAND + #907, #5
static RAND + #908, #2
static RAND + #909, #6
static RAND + #910, #9
static RAND + #911, #3
static RAND + #912, #5
static RAND + #913, #6
static RAND + #914, #7
static RAND + #915, #4
static RAND + #916, #8
static RAND + #917, #1
static RAND + #918, #1
static RAND + #919, #2
static RAND + #920, #5
static RAND + #921, #5
static RAND + #922, #2
static RAND + #923, #8
static RAND + #924, #6
static RAND + #925, #4
static RAND + #926, #5
static RAND + #927, #10
static RAND + #928, #1
static RAND + #929, #10
static RAND + #930, #5
static RAND + #931, #5
static RAND + #932, #10
static RAND + #933, #4
static RAND + #934, #8
static RAND + #935, #9
static RAND + #936, #5
static RAND + #937, #3
static RAND + #938, #4
static RAND + #939, #4
static RAND + #940, #3
static RAND + #941, #4
static RAND + #942, #3
static RAND + #943, #6
static RAND + #944, #1
static RAND + #945, #8
static RAND + #946, #4
static RAND + #947, #9
static RAND + #948, #5
static RAND + #949, #8
static RAND + #950, #9
static RAND + #951, #10
static RAND + #952, #3
static RAND + #953, #2
static RAND + #954, #8
static RAND + #955, #10
static RAND + #956, #1
static RAND + #957, #2
static RAND + #958, #6
static RAND + #959, #7
static RAND + #960, #4
static RAND + #961, #8
static RAND + #962, #10
static RAND + #963, #2
static RAND + #964, #1
static RAND + #965, #7
static RAND + #966, #3
static RAND + #967, #6
static RAND + #968, #1
static RAND + #969, #4
static RAND + #970, #5
static RAND + #971, #2
static RAND + #972, #7
static RAND + #973, #5
static RAND + #974, #5
static RAND + #975, #7
static RAND + #976, #1
static RAND + #977, #10
static RAND + #978, #3
static RAND + #979, #6
static RAND + #980, #10
static RAND + #981, #10
static RAND + #982, #6
static RAND + #983, #5
static RAND + #984, #1
static RAND + #985, #2
static RAND + #986, #1
static RAND + #987, #3
static RAND + #988, #9
static RAND + #989, #3
static RAND + #990, #2
static RAND + #991, #6
static RAND + #992, #10
static RAND + #993, #6
static RAND + #994, #7
static RAND + #995, #7
static RAND + #996, #9
static RAND + #997, #10
static RAND + #998, #2
static RAND + #999, #10
static RAND + #1000, #4
static RAND + #1001, #6
static RAND + #1002, #8
static RAND + #1003, #4
static RAND + #1004, #3
static RAND + #1005, #6
static RAND + #1006, #9
static RAND + #1007, #10
static RAND + #1008, #10
static RAND + #1009, #10
static RAND + #1010, #2
static RAND + #1011, #9
static RAND + #1012, #10
static RAND + #1013, #9
static RAND + #1014, #10
static RAND + #1015, #1
static RAND + #1016, #10
static RAND + #1017, #2
static RAND + #1018, #7
static RAND + #1019, #2
static RAND + #1020, #7
static RAND + #1021, #9
static RAND + #1022, #8
static RAND + #1023, #2
static RAND + #1024, #4
static RAND + #1025, #1
static RAND + #1026, #8
static RAND + #1027, #3
static RAND + #1028, #6
static RAND + #1029, #1
static RAND + #1030, #4
static RAND + #1031, #6
static RAND + #1032, #1
static RAND + #1033, #1
static RAND + #1034, #8
static RAND + #1035, #1
static RAND + #1036, #1
static RAND + #1037, #1
static RAND + #1038, #3
static RAND + #1039, #8


carta1maq : var #1
carta2maq : var #1
carta3maq : var #1
carta4maq : var #1
carta5maq : var #1
numcartasmaq : var #1
somamaq : var #1


carta1user : var #1
carta2user : var #1
carta3user : var #1
carta4user : var #1
carta5user : var #1
somauser : var #1
numcartasuser : var#1

Letra : var #1

money : var #1			;	voce começa com 10 dinheiros
aposta : var #1			;	a primeira aposta e de 2 dinheiros, se vc tiver 100 dinheiros vc faliu a casa
numero_da_rodada : var #1
userwinflag : var #1
rodadaflag : var #1
chegou_final : var #1


Msg0: string "&*%*#*@*&*%*#*@*&*%*#*@*&*%*#*@*&*%*#*@*"
Msg1: string "                                        "
Msg2: string "       _               __               "
Msg3: string "      |_) |  _   _ |/   |  _   _ |/     "
Msg4: string "      |_) | (_| (_ |\\  _| (_| (_ |\\   "
Msg5: string "                                        "
Msg6: string "          Press any key to start        "
Msg7: string "                                        "
Msg8: string "                                        "
Msg9: string "&*%*#*@*&*%*#*@*&*%*#*@*&*%*#*@*&*%*#*@*"

diginome : string "  Digite uma letra para seguir : "
comprarmais : string "    Quer comprar mais uma carta(s/n) ?"
suasoma : string " Sua soma foi : "
somacasa : string " A soma da casa foi : "
proxstep : string " Pressione enter para prosseguir : "
comproupt1 : string " A casa comprou   cartas,"
comproupt2 : string " deseja dobrar sua aposta(s/n) ?"
sua_aposta: string " Aposta atual $ "
seu_dinheiro : string " Seu dinheiro $"
vc_ganhou : string "         VOCE GANHOU A RODADA !!!"
vc_perdeu : string "         A CASA GANHOU A RODADA..."
GAME_OVER : string "               GAME OVER"
GAME_OVER_2 :string "     VOCE PERDEU TODO SEU DINHEIRO"
GAME_WIN : string "               VOCE GANHOU"
GAME_WIN_2 :string "     A CASA PERDEU TODO SEU DINHEIRO"


jmp main



;---- Inicio do Programa Principal -----

main:
	;aqui serao inciados os parametros das variaveis globais
	loadn r0, #10
	store money, r0
	;antes de tudo os registradores e variaveis serao inciados com 0;
	;na main os registradores r6,r7 e r3 nao devem ser modificados fora de sua função original;
	loadn r0, #0
	loadn r1, #0
	loadn r2, #0
	loadn r3, #0
	loadn r4, #0
	loadn r5, #0
	loadn r6, #0
	loadn r7, #0
	store numero_da_rodada, r0					;começa sendo a rodada 0
	store chegou_final, r0
	call INTRODUCAO
COMECO_JOGO_LOOP:
	call ApagaTela
	
	
	loadn r0, #0
	store carta1user, r0
	store carta2user, r0
	store carta3user, r0
	store carta4user, r0
	store carta5user, r0
	store carta1maq, r0
	store carta2maq, r0
	store carta3maq, r0
	store carta4maq, r0
	store carta5maq, r0
	store numcartasuser, r0
	store numcartasmaq, r0
	store somamaq, r0
	store somauser, r0
	
	load r1, numero_da_rodada	
	inc r1
	store numero_da_rodada, r1		
	loadn r0, #2
	add r0, r1, r0
	store aposta, r0

	;--------------------------------------- começo da rodada do usuario --------------------------------------;
	
	call IMPRIME_SEU_DINHEIRO_E_APOSTA_DA_RODADA			;desenhar na tela
	load r0, rodadaflag							
	loadn r1, #1
	cmp r1, r0												;se estiver na segunda ou mais rodadas nao starto o rand de novo
	jeq rodadanaoentra
	call STARTRAND 											;o registrador r7 guarda o numero aleatorio da carta r6 e o ponteiro
	jmp primeira_rodada
rodadanaoentra:
	call ATUALIZARAND
primeira_rodada:
	store carta1user, r7
	call ATUALIZARAND
	store carta2user, r7
	call VCIMPRIMIR2CARTAS									;mostras suas duas primeiras cartas
	loadn r3, #2											;r3 guarda o numero de cartas
	call JOGODOUSUARIO
	
	;----------------------------------------- começo da rodada da casa ----------------------------------------;
	
	call APAGALINHAMEIO
	call PROSSEGUIR_COM_ENTER
	call APAGALINHAMEIO
	call APAGALINHA_MEIO_ACIMA
	call SETRANDMAQUINA										;arrumar o rand
	call ATUALIZARAND
	store carta1maq, r7
	call ATUALIZARAND
	store carta2maq, r7
	call Delay
	call IMPRIMIR2CARTAS									;mostras as duas cartas da maquina/casa
	call Delay
	loadn r3, #2											;r3 guarda o numero de cartas, agora da maquina/casa
	call JOGODAMAQUINA
	
	;------------------------------------- final da rodada ------------------------------------------------------;
	
	call CHECKAPOSTA										;pergunto pro usuario se ele quer dobrar a aposta
	call APAGALINHA_MEIO_ACIMA
	call APAGALINHA_MEIO_ACIMA2	
	call CHAMAIMPRESSAOMAQ_final
	call ENDROUND
	call Delay
	call Delay
	call Delay
	call SETRANDUSER
	loadn r0, #1
	store rodadaflag, r0
	;----- condições para o jogo acabar :	1 - acabar seus dinheiros, 2 - a casa falir, vc chegar a 100 dinheiros -----;
	loadn r1, #0
	load r2, money
	cmp r2, r1
	jel ZERO_MONEY
	loadn r1, #100
	cmp r2,r1
	jeg CEM_DINHEIROS
	jmp FIM_JOGO_OUT
CEM_DINHEIROS:
	store chegou_final, r1
	jmp FORCE_END	
ZERO_MONEY:
	jmp FORCE_END
FIM_JOGO_OUT:
	jmp COMECO_JOGO_LOOP												
FORCE_END:
	call End_game_animation
	halt
	
;---- Fim do Programa Principal -----
	
;---- Inicio das Subrotinas -----
End_game_animation:
	push r0	
	push r1	
	push r2	
	push r3	
	push r4	
	push r5
	push r6
	push r7
	load r5, chegou_final
	loadn r4, #100
	cmp r5,r4
	jeg IMPRIMIR_VITORIA
	
	call Delay
	call ApagaTela
	
	loadn r0, #600		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #GAME_OVER	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #3328		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #640		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #GAME_OVER	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #1280		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #720		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #GAME_OVER_2	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	jmp End_game_animation_fim
IMPRIMIR_VITORIA:
	call Delay
	call ApagaTela
	
	loadn r0, #600		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #GAME_WIN	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #3328		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #640		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #GAME_WIN	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #1280		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #720		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #GAME_WIN_2	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #1280		; Seleciona a COR da Mensagem
	
	call Imprimestr
End_game_animation_fim:
	pop r7
	pop r6
	pop r5
	pop r4	
	pop r3
	pop r2	
	pop r1
	pop r0
rts

IMPRIME_SEU_DINHEIRO_E_APOSTA_DA_RODADA:
	push r0	
	push r1	
	push r2	
	push r3	
	push r4	
	push r5
	push r6
	push r7
	
	loadn r7, #48		; 0 em ascii
	loadn r0, #1120		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #seu_dinheiro	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #3328		; Seleciona a COR da Mensagem
	call Imprimestr
	load r0, money
	loadn r1, #10		;comparar r0 com dez pra ver se sera printado com qual função
	cmp r0, r1
	jeg IRA_IMPRIMIRmaiorigual10
	jmp IRA_IMPRIMIRmenor10
IRA_IMPRIMIRmenor10:
	loadn r1, #1134		;posicao que ira ficar os dinheiros
	add r0, r0, r7
	outchar r0, r1
	jmp segue_adiante
IRA_IMPRIMIRmaiorigual10:
	loadn r6, #1134
	load r5, money
	call PrintR5R6
	jmp segue_adiante
segue_adiante: 			;---- aqui sera tratada a aposta atual
	loadn r7, #48		; 0 em ascii
	loadn r0, #1143		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #sua_aposta	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #3328		; Seleciona a COR da Mensagem
	call Imprimestr
	
	load r0, aposta
	loadn r1, #10		;comparar r0 com dez pra ver se sera printado com qual função
	cmp r0, r1
	jeg IRA_IMPRIMIRmaiorigual10aposta
	jmp IRA_IMPRIMIRmenor10aposta
IRA_IMPRIMIRmenor10aposta:
	loadn r1, #1157		;posicao que ira ficar os dinheiros
	add r0, r0, r7
	outchar r0, r1
	jmp segue_adianteaposta
IRA_IMPRIMIRmaiorigual10aposta:
	loadn r6, #1157
	load r5, aposta
	call PrintR5R6
	jmp segue_adianteaposta
segue_adianteaposta:	

	pop r7
	pop r6
	pop r5
	pop r4	
	pop r3
	pop r2	
	pop r1
	pop r0
	rts
	
MANIPULA_APOSTA:
	push r0	
	push r1	
	push r2	
	push r3	
	push r4	
	push r5
	push r6
	push r7
	
	load r0, money
	load r1, aposta
	load r2, userwinflag
	loadn r3, #0
	cmp r2, r3			;compara a flag com zero
	jeq DIMINUIDINHEIRO
	jgr AUEMNTADINHEIRO
DIMINUIDINHEIRO:
	sub r0, r0, r1
	store money, r0	
	jmp MANIPULA_APOSTA_OUT
AUEMNTADINHEIRO:
	add r0, r0, r1
	store money, r0
	jmp MANIPULA_APOSTA_OUT
MANIPULA_APOSTA_OUT:
	pop r7
	pop r6
	pop r5
	pop r4	
	pop r3
	pop r2	
	pop r1
	pop r0
	rts
	
ENDROUND:
	push r0	
	push r1	
	push r2	
	push r3	
	push r4	
	push r5
	push r6
	push r7
	
	loadn r0, #480		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #somacasa	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	call Imprimestr
	call SOMADASCARTASMAQUINA
	load r5, somamaq
	loadn r6, #500
	call PrintR5R6
	;----------- aqui serao comparados os dois valores de mãos de usuario e casa --------------;
	call Delay
	load r0, somauser
	load r1, somamaq
	loadn r2, #21	;numero maximo
	loadn r3, #0	;flag estourar user
	loadn r4, #0	;flag estourar maq
	cmp r0, r2		;comparar usuario com o 21
	jgr ESTOUROUUSER
	jmp NAO_ESTOUROU_USER
ESTOUROUUSER:
	inc r3
NAO_ESTOUROU_USER:	
	cmp r1, r2		;comparar maq com 21
	jgr ESTOUROUMAQ
	jmp NAO_ESTOUROU_MAQ
ESTOUROUMAQ:
	inc r4
NAO_ESTOUROU_MAQ:
	cmp r3, r4
	jgr USERLOSS ; se r3>r4 ou seja usuario estourou e maquina nao
	jle USERWIN  ; se r3<r4 ou seja a maquina estourou e o user nao
	jmp COMPARACAO_FINAL ; se eles forem iguais ele compara quem e mais proximo de 21
COMPARACAO_FINAL:
	loadn r7, #1		;flag de comparação, ver se os dois estouraram ou nao
	cmp r3, r7
	jeq BOTH_ESTOURARAM
	jmp NAO_ESTOURARAM
BOTH_ESTOURARAM:
	cmp r0, r1			;comparo as duas somas
	jle USERWIN			; se estourou menos ele ganha
	jgr USERLOSS		; se estourou mais ele perde
	jeq USERLOSS		; EMPATE E DA CASA
NAO_ESTOURARAM:	
	cmp r0, r1			;comparo as duas somas
	jgr USERWIN			; se mais ele ganha
	jle USERLOSS		; se menos ele perde
	jeq USERLOSS		; EMPATE E DA CASA
USERWIN:
	loadn r0, #560		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #vc_ganhou	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	call Imprimestr
	loadn r2, #1
	store userwinflag, r2	;coloca 1 na flag que ganhou
	jmp ENDROUND_OUT
USERLOSS:
	loadn r0, #560		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #vc_perdeu	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	call Imprimestr
	loadn r2, #0
	store userwinflag, r2	;coloca 0 na flag que ganhou, perdeu ou seja
	jmp ENDROUND_OUT
ENDROUND_OUT:
	call MANIPULA_APOSTA
	pop r7
	pop r6
	pop r5
	pop r4	
	pop r3
	pop r2	
	pop r1
	pop r0
	rts

CHECKAPOSTA:
	push r0	
	push r1	
	push r2	
	push r3	
	push r4	
	push r5
	push r6
	push r7
	
	load r0, money ;	guarda seu dinheiro no r0
	load r1, aposta; 	guarda a aposta atual no r1
	call digLetra
	loadn r2, #110      ; carater N em ascii, MAIUSCULO
	load r3, Letra		; coloco a letra digitada dentro do r3
	cmp r3, r2			;comparo eles
	jeq CHECKAPOSTAOUT	; se o usuario digitou n saio da funçao
	loadn r4, #2		; senao jogo 2 no r4
	mul r1, r1, r4		; multiplico a aposta por 2
	store aposta, r1	; guardo a nova aposta
	call IMPRIME_SEU_DINHEIRO_E_APOSTA_DA_RODADA
	
CHECKAPOSTAOUT:	
	pop r7
	pop r6
	pop r5
	pop r4	
	pop r3
	pop r2	
	pop r1
	pop r0
	rts

APAGALINHA_MEIO_ACIMA:
	push r0
	push r1
	push r2
	
	loadn r0, #560		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #Msg8	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	call Imprimestr
	
	pop r2
	pop r1
	pop r0
	rts

APAGALINHA_MEIO_ACIMA2:
	push r0
	push r1
	push r2
	
	loadn r0, #520		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #Msg8	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	call Imprimestr
	
	pop r2
	pop r1
	pop r0
	rts


PROSSEGUIR_COM_ENTER:
	push r0
	push r1
	push r2
	
	loadn r0, #560		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #proxstep	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	call Imprimestr
	call digLetra
	pop r2
	pop r1
	pop r0
	rts

SETRANDUSER:
	;compensa os rands rodados dentro das funções nao computados no r6
	push r0
	push r1
	
	load r0, numcartasmaq
	loadn r1, #2			;tiro 2
	sub r0, r0, r1
	add r6, r6, r0
	
	pop r1
	pop r0
	rts


SETRANDMAQUINA:
	;compensa os rands rodados dentro das funções nao computados no r6
	push r0
	push r1
	
	load r0, numcartasuser
	loadn r1, #2
	sub r0, r0, r1
	add r6, r6, r0
	
	pop r1
	pop r0
	rts
APAGALINHAMEIO:
	push r0
	push r1
	push r2
	
	loadn r0, #600		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #Msg8	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	call Imprimestr
	
	pop r2
	pop r1
	pop r0
	rts
CHAMAIMPRESSAOMAQ: ;switch case
	push r0	
	push r1	
	push r2	
	push r3	
	push r4	
	push r5
	push r6
	push r7
		
	loadn r0, #3
	loadn r1, #4
	loadn r2, #5
	cmp r3, r0	;r3 na main guarda a referncia para numero de cartas
	jeq labelpra3maq
	cmp r3, r1	;r3 na main guarda a referncia para numero de cartas
	jeq labelpra4maq
	cmp r3, r2	;r3 na main guarda a referncia para numero de cartas
	jeq labelpra5maq
labelpra3maq: 
	store carta3maq, r7
	call IMPRIMIR3CARTAS
	jmp CHAMAIMPRESSAOOUTMAQ
labelpra4maq:
	store carta4maq, r7
	call IMPRIMIR4CARTAS
	jmp CHAMAIMPRESSAOOUTMAQ
labelpra5maq:
	store carta5maq, r7
	call IMPRIMIR5CARTAS
	jmp CHAMAIMPRESSAOOUTMAQ
	
CHAMAIMPRESSAOOUTMAQ:
	pop r7
	pop r6
	pop r5
	pop r4	
	pop r3
	pop r2	
	pop r1
	pop r0
	rts

;quase uma copia da funcao anterior porem usada no final do codigo
CHAMAIMPRESSAOMAQ_final: ;switch case
	push r0	
	push r1	
	push r2	
	push r3	
	push r4	
	push r5
	push r6
	push r7
	load r3, numcartasmaq
	loadn r0, #3
	loadn r1, #4
	loadn r2, #5
	cmp r3, r0	;r3 na main guarda a referncia para numero de cartas
	jeq labelpra3maq_final
	cmp r3, r1	;r3 na main guarda a referncia para numero de cartas
	jeq labelpra4maq_final
	cmp r3, r2	;r3 na main guarda a referncia para numero de cartas
	jeq labelpra5maq_final

	call IMPRIMIR2CARTAS_COMNUMERO			;se nao pulou imprime so 2
	jmp CHAMAIMPRESSAOOUTMAQ_final	
	
labelpra3maq_final: 
	call IMPRIMIR3CARTAS_COMNUMERO
	jmp CHAMAIMPRESSAOOUTMAQ_final
labelpra4maq_final:
	call IMPRIMIR4CARTAS_COMNUMERO
	jmp CHAMAIMPRESSAOOUTMAQ_final
labelpra5maq_final:
	call IMPRIMIR5CARTAS_COMNUMERO
	jmp CHAMAIMPRESSAOOUTMAQ_final
	
CHAMAIMPRESSAOOUTMAQ_final:
	pop r7
	pop r6
	pop r5
	pop r4	
	pop r3
	pop r2	
	pop r1
	pop r0
	rts;

SOMADASCARTASMAQUINA:
	push r0	
	push r1	
	push r2	
	push r3	
	push r4	
	push r5
	push r6
	push r7			
	
	load r1, carta1maq
	load r2, carta2maq
	load r3, carta3maq
	load r4, carta4maq
	load r5, carta5maq
	
	add r0, r1, r2 ; soma = c1 + c2
	add r0, r0, r3 ; soma = soma + c3
	add r0, r0, r4 ; soma = soma + c4
	add r0, r0, r5 ; soma = soma + c5
	store somamaq, r0
	pop r7
	pop r6
	pop r5
	pop r4	
	pop r3
	pop r2	
	pop r1
	pop r0
	rts


JOGODAMAQUINA:
	push r0	
	push r1	
	push r2	
	push r3	
	push r4	
	push r5
	push r6
	push r7

	loadn r5, #5 ;num maximo de cartas na mao
	loadn r1, #17;condição de parada
	
CMPMAQ:
	cmp r3, r5
	jeq JOGODAMAQUINAOUT
	call SOMADASCARTASMAQUINA
	load r2, somamaq
	cmp r2, r1
	jle COMPRARMAISMAQUINA
	jeg JOGODAMAQUINAOUT
COMPRARMAISMAQUINA:
	call ATUALIZARAND	
	inc r3
	call CHAMAIMPRESSAOMAQ
	call Delay
	jmp CMPMAQ
JOGODAMAQUINAOUT:
	
	store numcartasmaq, r3
	loadn r0, #520		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #comproupt1	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	call Imprimestr
	
	loadn r1, #536		; posicao da qtd de cartas que a casa comprou 
	loadn r2, #48		; 0 EM ASCII
	add r3, r3, r2
	outchar r3, r1	
	
	loadn r0, #560		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #comproupt2	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	call Imprimestr
	
	pop r7
	pop r6
	pop r5
	pop r4	
	pop r3
	pop r2	
	pop r1
	pop r0
	rts
	
PRINTAFIGURA:
	push r0	
	push r1	
	push r2	
	push r3	
	push r4	
	push r5
	push r6
	push r7	
	loadn r3, #'K'
	outchar r3, r4
	pop r7
	pop r6
	pop r5
	pop r4	
	pop r3
	pop r2	
	pop r1
	pop r0
	rts
	


PRINTANUMERO:
	push r0	
	push r1	
	push r2	
	push r3	
	push r4	
	push r5
	push r6
	push r7	
	outchar r3, r4
	pop r7
	pop r6
	pop r5
	pop r4	
	pop r3
	pop r2	
	pop r1
	pop r0
	rts

JOGODOUSUARIO:
	push r0	
	push r1	
	push r2	
	push r3	
	push r4	
	push r5
	push r6
	push r7	
	;r3 e um registrador global com o numero de suas cartas;
	loadn r5, #5 		;numero maximo de cartas
CMPCARTAS:
	cmp r3, r5	
	jle BUYMAISQUESTION
	jeq OUT
BUYMAISQUESTION:
	loadn r0, #600		; Posicao na tela onde a mensagem sera escrita
	loadn r1, #comprarmais	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	call Imprimestr
	call digLetra
	loadn r0, #110      ; carater N em ascii, MAIUSCULO
	load r1, Letra		; coloco a letra digitada dentro do r1
	cmp r0, r1			;comparo eles
	jeq OUT				;se ele escreveu nao saio da funcao
	inc r3				;se nao incremento o r3
	call ATUALIZARAND
	call CHAMAIMPRESSAO	;função de switch case
	jmp CMPCARTAS		;vou ao loop para ver se nao estorei as 5 cartas
OUT:
	loadn r0, #640		; Posicao na tela onde a mensagem sera escrita
	loadn r1, #suasoma	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	call Imprimestr
	call SOMADASCARTAS
	load r5, somauser
	loadn r6, #655
	call PrintR5R6
	store numcartasuser, r3
	pop r7
	pop r6
	pop r5
	pop r4	
	pop r3
	pop r2	
	pop r1
	pop r0
	rts


CHAMAIMPRESSAO: ;switch case
	push r0	
	push r1	
	push r2	
	push r3	
	push r4	
	push r5
	push r6
	push r7	
	
	loadn r0, #3
	loadn r1, #4
	loadn r2, #5
	cmp r3, r0	;r3 na main guarda a referncia para numero de cartas
	jeq labelpra3
	cmp r3, r1	;r3 na main guarda a referncia para numero de cartas
	jeq labelpra4
	cmp r3, r2	;r3 na main guarda a referncia para numero de cartas
	jeq labelpra5
labelpra3: 
	store carta3user, r7
	call VCIMPRIMIR3CARTAS
	jmp CHAMAIMPRESSAOOUT
labelpra4:
	store carta4user, r7
	call VCIMPRIMIR4CARTAS
	jmp CHAMAIMPRESSAOOUT
labelpra5:
	store carta5user, r7
	call VCIMPRIMIR5CARTAS
	jmp CHAMAIMPRESSAOOUT
	
CHAMAIMPRESSAOOUT:
	pop r7
	pop r6
	pop r5
	pop r4	
	pop r3
	pop r2	
	pop r1
	pop r0
	rts
	
	
SOMADASCARTAS:
	push r0	
	push r1	
	push r2	
	push r3	
	push r4	
	push r5
	push r6
	push r7			
	
	load r1, carta1user
	load r2, carta2user
	load r3, carta3user
	load r4, carta4user
	load r5, carta5user
	
	add r0, r1, r2 ; soma = c1 + c2
	add r0, r0, r3 ; soma = soma + c3
	add r0, r0, r4 ; soma = soma + c4
	add r0, r0, r5 ; soma = soma + c5
	store somauser, r0
	pop r7
	pop r6
	pop r5
	pop r4	
	pop r3
	pop r2	
	pop r1
	pop r0
	rts
	
Imprimestr:	;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	
	loadn r3, #'\0'	; Criterio de parada

ImprimestrLoop:	
	loadi r4, r1
	cmp r4, r3
	jeq ImprimestrSai
	add r4, r2, r4
	outchar r4, r0
	inc r0
	inc r1
	jmp ImprimestrLoop
	
ImprimestrSai:	
	pop r4	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r3
	pop r2
	pop r1
	pop r0
	rts
	
INTRODUCAO:
	push r0	
	push r1	
	push r2	
	push r3	
	push r4	
	push r5
	push r6
	push r7	
	
	loadn r0, #440		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #Msg0	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	call Imprimestr
	loadn r0, #480		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #Msg1	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	call Imprimestr
	loadn r0, #520		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #Msg2	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	call Imprimestr
	loadn r0, #560		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #Msg3	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	call Imprimestr
	loadn r0, #600		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #Msg4	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	call Imprimestr
	loadn r0, #640		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #Msg5	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	call Imprimestr
	loadn r0, #680		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #Msg6	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	call Imprimestr
	loadn r0, #720		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #Msg7	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	call Imprimestr
	loadn r0, #760		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #Msg8	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	call Imprimestr
	loadn r0, #800		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #Msg9	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	call Imprimestr
	
	call digLetra

	pop r7
	pop r6
	pop r5
	pop r4	
	pop r3
	pop r2	
	pop r1
	pop r0
	rts
	
STARTRAND:
	;aqui nessa função nao tem push ou pop pois r6 e 7 ficam forever usados na funçao main;
	
	
	load r0, Letra		;jogo a letra que o usurio digita no load  no r0
	loadn r1, #91 		;coloco o numero 91 que eh primo
	mul r0, r0, r1		; multiplico eles
	loadn r1, #1040 	;coloco 1040 pois temos 1040 numeros aleatorios (0-1039)
	mod r0, r0, r1 		;tiro o modulo deles
	loadn r6, #RAND 	;ponteiro para o primeiro endereco do vetor chamado rand
	add r6, r6, r0		;somo r0 para ir para o index baseado na letra
	loadi r7, r6 		;busca o proximo numero randomico e coloca no r7
	inc r6				;vai para o proximo numero randomico
	

	rts
	
ATUALIZARAND:
	push r0
	push r2
	loadn r2, #1040
	loadn r0, #RAND
	add r2,r2,r0 			;somo o começo do vetor rand com 1040
	loadi r7, r6 			;busca o proximo numero randomica e coloca no r7
	inc r6					;vai para o proximo numero randomico
	cmp r6, r2				;tratar se eu passar de 1040, tamanho maximo do vetor
	jeg ATUALIZARAND_EXCESSAO
	jmp ATUALIZARAND_FIM
ATUALIZARAND_EXCESSAO:
	loadn r6, #RAND			;caso isso aconteça, irei para o começo do vetor
ATUALIZARAND_FIM:
	pop r2
	pop r0
	rts
	
ApagaTela:
	push fr		; Protege o registrador de flags
	push r0
	push r1
	
	loadn r0, #1200		; apaga as 1200 posicoes da Tela
	loadn r1, #' '		; com "espaco"
	
	   ApagaTela_Loop:	;;label for(r0=1200;r3>0;r3--)
		dec r0
		outchar r1, r0
		jnz ApagaTela_Loop
 
	pop r1
	pop r0
	pop fr
	rts

digLetra:	; Espera que uma tecla seja digitada e salva na variavel global "Letra"
	push fr		; Protege o registrador de flags
	push r0
	push r1
	push r2
	loadn r1, #255	; Se nao digitar nada vem 255
	loadn r2, #0	; Logo que programa a FPGA o inchar vem 0

   digLetra_Loop:
		inchar r0			; Le o teclado, se nada for digitado = 255
		cmp r0, r1			;compara r0 com 255
		jeq digLetra_Loop	; Fica lendo ate' que digite uma tecla valida
		cmp r0, r2			;compara r0 com 0
		jeq digLetra_Loop	; Le novamente pois Logo que programa a FPGA o inchar vem 0

	store Letra, r0			; Salva a tecla na variavel global "Letra"
	
   digLetra_Loop2:	
		inchar r0			; Le o teclado, se nada for digitado = 255
		cmp r0, r1			;compara r0 com 255
		jne digLetra_Loop2	; Fica lendo ate' que digite uma tecla valida
	
	pop r2
	pop r1
	pop r0
	pop fr
	rts
	
	
PrintR5R6:	; R5 contem um numero de ate' 2 digitos     e    R6 a posicao onde vai imprimir na tela
	push r0
	push r1
	push r2
	push r3
	
	loadn r0, #10
	loadn r2, #48
	
	div r1, r5, r0	; Divide o numeo por 10 para imprimir a dezena
	
	add r3, r1, r2	; Soma 48 ao numero pra dar o Cod.  ASCII do numero
	outchar r3, r6
	
	inc r6			; Incrementa a posicao na tela
	
	mul r1, r1, r0	; Multiplica a dezena por 10
	sub r1, r5, r1	; Pra subtrair do numero e pegar o resto
	
	add r1, r1, r2	; Soma 48 ao numero pra dar o Cod.  ASCII do numero
	outchar r1, r6
	
	pop r3
	pop r2
	pop r1
	pop r0
	
	rts
	
Delay:
								;Utiliza Push e Pop para nao afetar os Ristradores do programa principal
	push r0
	push r1
	
	loadn r1, #1000  ; a
   Delay_volta2:				; contador de tempo quebrado em duas partes (dois loops de decremento)
	loadn r0, #3000	; b
   Delay_volta: 
	dec r0						; (4*a + 6)b = 1000000  == 1 seg  em um clock de 1MHz
	jnz Delay_volta	
	dec r1
	jnz Delay_volta2
	
	pop r1
	pop r0
	
	rts							;return


;--------------------------------------- AQUI ESTAO AS FUNÇÕES DE IMPRESSÃO DAS CARTAS --------------------------------------------;
;---------------------------------------FUNÇÕES DE IMPRESSÃO DAS CARTAS VIRADAS DA CASA -------------------------------------------;
IMPRIMIR2CARTAS:
	push r0	
	push r1	
	push r2	
	push r3	
	push r4	
	push r5
	push r6
	push r7
	
	loadn r0, #40		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #carta0	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
		
	loadn r0, #80		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #carta1	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #120		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #carta2	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #160		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #carta3	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #200		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #carta4	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #240		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #carta5	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #280		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #carta6	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
		
	;aqui sera colocado o numero na carta 1
	load r3, carta1maq
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #177;posicao do numero na carta
	load r6, carta1maq
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
	
	;aqui sera colocado o numero na carta 2
	load r3, carta2maq
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #184;posicao do numero na carta
	load r6, carta2maq
;	loadn r5, #10
;	cmp r6, r5
;	ceq PRINTAFIGURA
;	cne PRINTANUMERO
	
	
	pop r7
	pop r6
	pop r5
	pop r4	
	pop r3
	pop r2	
	pop r1
	pop r0
	rts
	
IMPRIMIR3CARTAS:
	push r0	
	push r1	
	push r2	
	push r3	
	push r4	
	push r5
	push r6
	push r7
	
	loadn r0, #40		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c3arta0	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #80		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c3arta1	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #120		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c3arta2	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #160		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c3arta3	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #200		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c3arta4	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #240		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c3arta5	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #280		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c3arta6	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	;aqui sera colocado o numero na carta 1
	load r3, carta1maq ;numero a ser colocado na carta
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #173;posicao do numero na carta
	load r6, carta1maq
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
	
	;aqui sera colocado o numero na carta 2
	load r3, carta2maq
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #180;posicao do numero na carta
;	load r6, carta2maq
;	loadn r5, #10
;	cmp r6, r5
;	ceq PRINTAFIGURA
;	cne PRINTANUMERO
	
	;aqui sera colocado o numero na carta 3
	load r3, carta3maq
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #187;posicao do numero na carta
	load r6, carta3maq
;	loadn r5, #10
;	cmp r6, r5
;	ceq PRINTAFIGURA
;	cne PRINTANUMERO
	
	pop r7
	pop r6
	pop r5
	pop r4	
	pop r3
	pop r2	
	pop r1
	pop r0
	rts
	
IMPRIMIR4CARTAS:
	push r0	
	push r1	
	push r2	
	push r3	
	push r4	
	push r5
	push r6
	push r7
	
	loadn r0, #40		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c4arta0	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #80		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c4arta1	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #120		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c4arta2	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #160		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c4arta3	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #200		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c4arta4	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #240		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c4arta5	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #280		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c4arta6	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	;aqui sera colocado o numero na carta 1
	load r3, carta1maq;numero a ser colocado na carta
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #169;posicao do numero na carta
	load r6, carta1maq
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
	
	;aqui sera colocado o numero na carta 2
	load r3, carta2maq
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #176;posicao do numero na carta
	load r6, carta2maq
;	loadn r5, #10
;	cmp r6, r5
;	ceq PRINTAFIGURA
;	cne PRINTANUMERO
	
	;aqui sera colocado o numero na carta 3
	load r3, carta3maq
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #183;posicao do numero na carta
	load r6, carta3maq
;	loadn r5, #10
;	cmp r6, r5
;	ceq PRINTAFIGURA
;	cne PRINTANUMERO
	
	;aqui sera colocado o numero na carta 4
	load r3, carta4maq
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #190;posicao do numero na carta
	load r6, carta4maq
;	loadn r5, #10
;	cmp r6, r5
;	ceq PRINTAFIGURA
;	cne PRINTANUMERO
		
	pop r7
	pop r6
	pop r5
	pop r4	
	pop r3
	pop r2	
	pop r1
	pop r0
	rts
	
IMPRIMIR5CARTAS:
	push r0	
	push r1	
	push r2	
	push r3	
	push r4	
	push r5
	push r6
	push r7
	
	loadn r0, #40		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c5arta0	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #80		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c5arta1	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #120		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c5arta2	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #160		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c5arta3	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #200		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c5arta4	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #240		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c5arta5	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #280		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c5arta6	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	;aqui sera colocado o numero na carta 1
	load r3, carta1maq ;numero a ser colocado na carta
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #166;posicao do numero na carta
	load r6, carta1maq
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
	
	;aqui sera colocado o numero na carta 2
	load r3, carta2maq
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #173;posicao do numero na carta
	load r6, carta2maq
;	loadn r5, #10
;	cmp r6, r5
;	ceq PRINTAFIGURA
;	cne PRINTANUMERO
	
	;aqui sera colocado o numero na carta 3
	load r3, carta3maq
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #180;posicao do numero na carta
	load r6, carta3maq
;	loadn r5, #10
;	cmp r6, r5
;	ceq PRINTAFIGURA
;	cne PRINTANUMERO
	
	;aqui sera colocado o numero na carta 4
	load r3, carta4maq
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #187;posicao do numero na carta
	load r6, carta4maq
;	loadn r5, #10
;	cmp r6, r5
;	ceq PRINTAFIGURA
;	cne PRINTANUMERO
	
	;aqui sera colocado o numero na carta 5
	load r3, carta5maq
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #194;posicao do numero na carta
	load r6, carta5maq
;	loadn r5, #10
;	cmp r6, r5
;	ceq PRINTAFIGURA
;	cne PRINTANUMERO
	
	pop r7
	pop r6
	pop r5
	pop r4	
	pop r3
	pop r2	
	pop r1
	pop r0
	rts

VCIMPRIMIR2CARTAS:
	push r0	
	push r1	
	push r2	
	push r3	
	push r4	
	push r5
	push r6
	push r7
	
	loadn r0, #760		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #carta0	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
		
	loadn r0, #800		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #carta1	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #840		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #carta2	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #880		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #carta3	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #920		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #carta4	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #960		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #carta5	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #1000		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #carta6	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	;aqui sera colocado o numero na carta 1
	load r3, carta1user ;numero a ser colocado na carta
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #897;posicao do numero na carta
	load r6, carta1user
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
	
	;aqui sera colocado o numero na carta 2
	load r3, carta2user
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #904;posicao do numero na carta
	load r6, carta2user
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
	
	pop r7
	pop r6
	pop r5
	pop r4	
	pop r3
	pop r2	
	pop r1
	pop r0
	rts

VCIMPRIMIR3CARTAS:
	push r0	
	push r1	
	push r2	
	push r3	
	push r4	
	push r5
	push r6
	push r7
	
	loadn r0, #760		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c3arta0	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
		
	loadn r0, #800		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c3arta1	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #840		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c3arta2	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #880		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c3arta3	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #920		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c3arta4	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #960		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c3arta5	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #1000		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c3arta6	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	;aqui sera colocado o numero na carta 1
	load r3, carta1user ;numero a ser colocado na carta
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #893;posicao do numero na carta
	load r6, carta1user
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
	
	;aqui sera colocado o numero na carta 2
	load r3, carta2user
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #900;posicao do numero na carta
	outchar r3, r4
	load r6, carta2user
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
	
	
	;aqui sera colocado o numero na carta 3
	load r3, carta3user
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #907;posicao do numero na carta
	load r6, carta3user
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
	
	pop r7
	pop r6
	pop r5
	pop r4	
	pop r3
	pop r2	
	pop r1
	pop r0
	rts
	
VCIMPRIMIR4CARTAS:
	push r0	
	push r1	
	push r2	
	push r3	
	push r4	
	push r5
	push r6
	push r7
	
	loadn r0, #760		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c4arta0	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
		
	loadn r0, #800		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c4arta1	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #840		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c4arta2	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #880		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c4arta3	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #920		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c4arta4	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #960		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c4arta5	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #1000		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c4arta6	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
		
	;aqui sera colocado o numero na carta 1
	load r3, carta1user ;numero a ser colocado na carta
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #889;posicao do numero na carta
	load r6, carta1user
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
	
	;aqui sera colocado o numero na carta 2
	load r3, carta2user
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #896;posicao do numero na carta
	load r6, carta2user
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
	
	;aqui sera colocado o numero na carta 3
	load r3, carta3user
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #903;posicao do numero na carta
	load r6, carta3user
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
			
	;aqui sera colocado o numero na carta 4
	load r3, carta4user
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #910;posicao do numero na carta
	load r6, carta4user
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
		
	pop r7
	pop r6
	pop r5
	pop r4	
	pop r3
	pop r2	
	pop r1
	pop r0
	rts

VCIMPRIMIR5CARTAS:
	push r0	
	push r1	
	push r2	
	push r3	
	push r4	
	push r5
	push r6
	push r7
	
	loadn r0, #760		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c5arta0	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
		
	loadn r0, #800		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c5arta1	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #840		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c5arta2	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #880		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c5arta3	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #920		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c5arta4	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #960		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c5arta5	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #1000		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c5arta6	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	;aqui sera colocado o numero na carta 1
	load r3, carta1user ;numero a ser colocado na carta
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #886;posicao do numero na carta
	load r6, carta1user
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
	
	;aqui sera colocado o numero na carta 2
	load r3, carta2user
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #893;posicao do numero na carta
	load r6, carta2user
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
	
	;aqui sera colocado o numero na carta 3
	load r3, carta3user
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #900;posicao do numero na carta
	load r6, carta3user
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
			
	;aqui sera colocado o numero na carta 4
	load r3, carta4user
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #907;posicao do numero na carta
	load r6, carta4user
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
	
	;aqui sera colocado o numero na carta 4
	load r3, carta5user
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #914;posicao do numero na carta
	load r6, carta5user
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO	
	
		
	pop r7
	pop r6
	pop r5
	pop r4	
	pop r3
	pop r2	
	pop r1
	pop r0
	rts
	
;------------------------------------- funções de impressao com o numero da casa ---------------------------------------------------;

IMPRIMIR2CARTAS_COMNUMERO:
	push r0	
	push r1	
	push r2	
	push r3	
	push r4	
	push r5
	push r6
	push r7
	
	loadn r0, #40		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #carta0	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
		
	loadn r0, #80		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #carta1	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #120		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #carta2	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #160		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #carta3	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #200		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #carta4	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #240		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #carta5	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #280		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #carta6	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
		
	;aqui sera colocado o numero na carta 1
	load r3, carta1maq
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #177;posicao do numero na carta
	load r6, carta1maq
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
	
	;aqui sera colocado o numero na carta 2
	load r3, carta2maq
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #184;posicao do numero na carta
	load r6, carta2maq
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
	
	
	pop r7
	pop r6
	pop r5
	pop r4	
	pop r3
	pop r2	
	pop r1
	pop r0
	rts
	
IMPRIMIR3CARTAS_COMNUMERO:
	push r0	
	push r1	
	push r2	
	push r3	
	push r4	
	push r5
	push r6
	push r7
	
	loadn r0, #40		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c3arta0	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #80		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c3arta1	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #120		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c3arta2	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #160		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c3arta3	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #200		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c3arta4	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #240		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c3arta5	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #280		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c3arta6	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	;aqui sera colocado o numero na carta 1
	load r3, carta1maq ;numero a ser colocado na carta
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #173;posicao do numero na carta
	load r6, carta1maq
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
	
	;aqui sera colocado o numero na carta 2
	load r3, carta2maq
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #180;posicao do numero na carta
	load r6, carta2maq
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
	
	;aqui sera colocado o numero na carta 3
	load r3, carta3maq
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #187;posicao do numero na carta
	load r6, carta3maq
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
	
	pop r7
	pop r6
	pop r5
	pop r4	
	pop r3
	pop r2	
	pop r1
	pop r0
	rts
	
IMPRIMIR4CARTAS_COMNUMERO:
	push r0	
	push r1	
	push r2	
	push r3	
	push r4	
	push r5
	push r6
	push r7
	
	loadn r0, #40		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c4arta0	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #80		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c4arta1	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #120		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c4arta2	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #160		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c4arta3	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #200		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c4arta4	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #240		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c4arta5	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #280		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c4arta6	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	;aqui sera colocado o numero na carta 1
	load r3, carta1maq;numero a ser colocado na carta
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #169;posicao do numero na carta
	load r6, carta1maq
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
	
	;aqui sera colocado o numero na carta 2
	load r3, carta2maq
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #176;posicao do numero na carta
	load r6, carta2maq
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
	
	;aqui sera colocado o numero na carta 3
	load r3, carta3maq
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #183;posicao do numero na carta
	load r6, carta3maq
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
	
	;aqui sera colocado o numero na carta 4
	load r3, carta4maq
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #190;posicao do numero na carta
	load r6, carta4maq
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
		
	pop r7
	pop r6
	pop r5
	pop r4	
	pop r3
	pop r2	
	pop r1
	pop r0
	rts
	
IMPRIMIR5CARTAS_COMNUMERO:
	push r0	
	push r1	
	push r2	
	push r3	
	push r4	
	push r5
	push r6
	push r7
	
	loadn r0, #40		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c5arta0	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #80		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c5arta1	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #120		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c5arta2	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #160		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c5arta3	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #200		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c5arta4	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #240		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c5arta5	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	loadn r0, #280		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #c5arta6	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call Imprimestr
	
	;aqui sera colocado o numero na carta 1
	load r3, carta1maq ;numero a ser colocado na carta
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #166;posicao do numero na carta
	load r6, carta1maq
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
	
	;aqui sera colocado o numero na carta 2
	load r3, carta2maq
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #173;posicao do numero na carta
	load r6, carta2maq
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
	
	;aqui sera colocado o numero na carta 3
	load r3, carta3maq
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #180;posicao do numero na carta
	load r6, carta3maq
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
	
	;aqui sera colocado o numero na carta 4
	load r3, carta4maq
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #187;posicao do numero na carta
	load r6, carta4maq
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
	
	;aqui sera colocado o numero na carta 5
	load r3, carta5maq
	loadn r5, #48 ;zero em char
	add r3, r5, r3;somar o seu numero + zero em char
	loadn r4, #194;posicao do numero na carta
	load r6, carta5maq
	loadn r5, #10
	cmp r6, r5
	ceq PRINTAFIGURA
	cne PRINTANUMERO
	
	pop r7
	pop r6
	pop r5
	pop r4	
	pop r3
	pop r2	
	pop r1
	pop r0
	rts