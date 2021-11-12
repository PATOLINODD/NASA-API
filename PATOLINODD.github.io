	/*========================================
	//	ESTILIZANDO A NAV BAR
	//========================================*/

	body{
		background-image: url('imagens/logo.jpg');
		background-size: cover;
		bakcground-repeat: no-repeat;
		display: flex;
		justify-content: space-between;
		flex-flow: column wrap;
	}
	footer{
		align-self: end;
	}
	nav{
		display: flex;
		justify-content: space-between;
		background-color: #003f99;
		height: 2em;
	}
	nav > h1 {
		align-self: center;
		margin-left: 6%;
		background-color: #F14300;
		color: white;
		border: 2px solid #F14300;
		border-radius: 0.6em;
	}
	nav > div{
		align-self: center;
		margin: 0% 15% 0% 0%;
	}
	div > input{
		width: 15em;
	}
	button{
		border-radius: 0.6em;
	}
	
	nav > h1:hover{
		font-size: 1.8em;
		transition: 0.3s;
	}
	/*==============================================
	// 	    ESTILIZANDO A PESQUISA
	//==============================================*/
	header{
		display: flex;
		flex-flow: column wrap;
		align-items: center;
		color: white;
	}
	#conteudo{
		display: flex;
		flex-flow: column;
		justify-content: center;
		align-items: center;
	}
	#img{
		align-self: center;
		width: 100%;
		margin: 0% 20% 0% 70%;
	}
	
	#explicacao{
		display: none;
		width: 50%;
		height: 15em;
		margin: 0% 0% 0% 0%;
		padding: 0;
		resize: none;
	}
		<!DOCTYPE html>
		<html>
			<head>
				<meta charset='utf-8'/>
				<link rel='stylesheet' href='estilo.css'>
				
				<title> NASA IMAGENS </title> 
			</head>
			<body>
				<nav>
					<h1> NASA IMAGENS </h1>
					<div>
						<input type='date'>
						<button id='pesquisar'>buscar</button>
					</div>
				</nav>
				<header>
					<div>
						<h3 id='titulo'></h3>
						<p id='data'>
					</div>
					<div id='conteudo'>
						<div id='img'>
						</div>
						<textarea id='explicacao' disabled></textarea>
					</div>
				</header>
				<footer>
					<hr/>
				</footer>
				<script src='requisicao.js'></script>
			</body>
		</html>	let botaoPesquisa 	= document.querySelector('#pesquisar');
	const pesquisa 		= document.querySelector('input');

	botaoPesquisa.onclick = () => {
		document.querySelector('#explicacao').style.display = 'block';
		console.log('botao pressionado');
		enviarPedido();
	}

	async function enviarPedido(){
		let resposta = await fetch(`https://api.nasa.gov/planetary/apod?api_key=xKNuJ9l2rSf2SOlvZposqh4J9TRhKsTVRSAgQkOy&date=${pesquisa.value}`);
		let data = await resposta.json();
		console.log(data);
		mostrarPedido(data);
	}
	function mostrarPedido(data){
		document.querySelector('#titulo').innerHTML = data.title;
		document.querySelector('#data').innerHTML = "DATA: "+data.date;
		document.querySelector('#img').innerHTML = `<img src='${data.url}' width='50%'>`;
		document.querySelector('#explicacao').innerHTML = data.explanation;
	}