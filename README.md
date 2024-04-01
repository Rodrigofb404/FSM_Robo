<h1>Finitie State Machine Robot</h1>
<span>Observação 1: o testbench foi feito pelos professores e somente o design em verilog foi implementado pelos alunos</span> <br>
<span>Observação 2: o mapa da imagem é meramente <b>ilustrativo</b>, a fsm foi projetada para tipos variados de mapas, os quais são passados no arquivo .txt deste projeto</span>  <br>
<span>Observação 3: o caminho do arquivo mapa.txt deve ser passado de forma absoluta</span>  <br>
<h2>Especificação do Problema</h2>

<p>Deseja-se construir o controlador de um robô capaz de acompanhar um muro. A figura 1 ilustra o
problema, enquanto a figura 2 ilustra uma solução desenvolvida.</p>

![image](https://github.com/Rodrigofb404/FSM_Robo/assets/97321841/e06a611b-efbb-4bd1-a205-221590ff2337)


Na parte <b>a)</b> da fig. 1, o mundo do robô é uma matriz de células, na qual cada componente é livre
(células brancas) ou ocupado por um muro (células escuras). O robô, mostrado como um triângulo,
é colocado em qualquer célula livre, respeitando uma das direções paralelas ao gradeado da matriz
(horizontal ou vertical), com sua frente voltada para qualquer um dos 4 sentidos possíveis (Norte,
Sul, Leste ou Oeste). O robô possui 2 sensores binários: <b>head</b> (sensor situado na frente do robô, que
retorna 1 quando a célula situada à frente do robô está ocupada por um muro – caso contrário, retorna 0) e <b>left</b> (sensor situado na lateral esquerda do robô, que retorna 1 quando a célula do lado
esquerdo do robô é ocupada por um muro - caso contrário, retorna 0).
Em relação à movimentação, o robô é capaz de fazer apenas 2 tipos de movimento: avançar para
uma célula livre à sua frente ou rotacionar 90° para a esquerda, mantendo-se na mesma célula em que se encontra. Cada movimento consome 1 pulso de clock.

Ao ligar o robô, 4 casos são possíveis, os quais deverão ser tratados como segue: <br><br>
<b>Caso 1</b>: robô em uma área livre (ambos sensores retornando 0). Neste caso, o robô deverá avançar até o
encontro de um muro e acompanhá-lo, dando-lhe o lado esquerdo; <br>
<b>Caso 2</b>: robô com muro à frente e do lado esquerdo (ambos sensores retornando 1). Neste caso, o robô
deverá rotacionar até encontrar um muro à sua esquerda que possa ser acompanhado; <br>
<b>Caso 3</b>: robô com muro somente à frente (<b>head</b> = 1, <b>left</b> = 0). Mesmo comportamento do caso 2; <br>
<b>Caso 4</b>: robô com muro somente à esquerda (<b>head</b> = 0, <b>left</b> = 1). Neste caso, robô acompanhará o muro. <br><br>

Em qualquer dos casos citados, o robô deverá acompanhar o muro até que um novo muro seja
encontrado ou até que o muro dobre à esquerda, como na parte <b>b)</b> da fig. 1, fazendo com que o
robô também dobre à esquerda e prossiga. Como regra prioritária, após cada rotação, se houver um
muro à esquerda do robô, este deverá ser acompanhado.
