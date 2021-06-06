	let botaoPesquisa 	= document.querySelector('#pesquisar');
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
	}