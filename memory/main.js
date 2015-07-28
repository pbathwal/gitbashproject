var memory_array = ['Australia','Australia', 'Argentina','Argentina', 'Belgium', 'Belgium','Chile','Chile', 'Egypt', 'Egypt','Finland','Finland', 'Ghana','Ghana','Italy', 'Italy', 'Jamaica', 'Jamaica', 'Nepal','Nepal','Malasiya', 'Malasiya', 'Poland','Poland', 'Russia','Russia', 'Srilanka', 'Srilanka','Japan', 'Japan','Antarctica','Antarctica','Bangladesh','Bangladesh','Bolivia','Bolivia','China','China','Cuba','Cuba','Czech Republic','Czech Republic','France','France','Ireland','Ireland','Germany','Germany','Mexico','Mexico','New Zealand','New Zealand','Portugal','Portugal','Puerto Rico','Puerto Rico','South Korea','South Korea','Switzerland','Switzerland','United Kingdom','United Kingdom','USA','USA','Uruguay','Uruguay','Cyprus','Cyprus'];


	var memory_values = [];
	var memory_tile_ids = [];
	var tiles_flipped = 0;
	var clicks = 0;
	var isMute = false;
	var music = document.getElementById('start');
	var matchSound = document.getElementById('match');
	var noMatchSound = document.getElementById('noMatch');
	var flipSound = document.getElementById('flipped');
	music.play();
    music.volume = 0.2;
	var score = 0;
	var highScore = 0;
	var array_length = 0;
	

	Array.prototype.memory_tile_shuffle = function(){
		var i = this.length, j, temp;
		while(--i > 0){
			j = Math.floor(Math.random() * (i + 1));
			temp = this[j];
			this[j] = this[i];
			this[i] = temp;
		}

	}

	function newBoard(level){
		tiles_flipped = 0;
		music.volume = 0;
		var output = '';
		document.getElementById('container').style.background = "White";
		var range = ((memory_array.length - 30) / 2) + 1; // range of possible even numbers between 0 and array length - 30	
		var random_array = Math.floor(Math.random() * range) *2; // generate random even number
		
		switch(level){

			case 'easy':
		    output = '<div id="memory_board" class ="easy">';
		    array_length = 16;
		    memory_array = memory_array.slice(random_array,random_array+array_length);
		    break;

		    case 'medium':
            output = '<div id="memory_board" class ="medium">';
            array_length = 20;
            memory_array = memory_array.slice(random_array,random_array+array_length);
            break;

            case 'hard':
		    output = '<div id="memory_board" class ="hard">';
		    array_length = 30;
		    memory_array = memory_array.slice(random_array,random_array+array_length);
		    break;
	    }
		memory_array.memory_tile_shuffle();

		for (var i = 0; i < memory_array.length; i++) {

			output += '<div id="tile_'+i+'" onclick = "memoryFlipTile(this,\''+memory_array[i]+'\')"></div>';
		}
		output += '</div>';
		document.getElementById('start_screen').innerHTML = output;
	}

	function memoryFlipTile(tile, val){
		if(tile.innerHTML =="" && memory_values.length <2){
			tile.style.background = getFlagImage(val);
			tile.style.backgroundSize = 'cover';
			tile.innerHTML = val;
			if(memory_values.length == 0){
				memory_values.push(val);
				memory_tile_ids.push(tile.id);
				flipped.play();
			} else if(memory_values.length ==1){
				memory_values.push(val);
				memory_tile_ids.push(tile.id);
				// if match found.
				if(memory_values[0] == memory_values[1]){
					tiles_flipped += 2;
					matchSound.play();
					// clear both arrays.
					memory_values = [];
					memory_tile_ids = [];
					// ckeck if all the tiles are flipped.
					if (tiles_flipped == array_length) {
						gameOver();	    
					}

				} else{ // not matched.
					function flipBack(){
						noMatchSound.play();
						var tile_1 = document.getElementById(memory_tile_ids[0]);
						var tile_2 = document.getElementById(memory_tile_ids[1]);
						tile_1.style.background = 'url(title.jpg) no-repeat';
						tile_1.style.backgroundSize = 'cover';
						tile_1.innerHTML = "";
						tile_2.style.background = 'url(title.jpg) no-repeat';
						tile_2.style.backgroundSize = 'cover';
						tile_2.innerHTML = "";
						// clear both arrays
						memory_values = [];
						memory_tile_ids = [];
					}
                    setTimeout(flipBack, 700);
				}
			}
		}
	
	}

	function getFlagImage(country){
		var imageURL ;
		switch(country){

			case 'Australia': 
			imageURL = 'images/australia.gif';
            break;
            case 'Argentina': 
			imageURL = 'images/argentina.gif';
            break;
            case 'Antarctica': 
			imageURL = 'images/antarctica.gif';
            break;
            case 'Belgium': 
			imageURL = 'images/belgium.gif';
            break;
            case 'Bangladesh': 
			imageURL = 'images/bangladesh.gif';
            break;
            case 'Bolivia': 
			imageURL = 'images/bolivia.gif';
            break;
            case 'Chile': 
			imageURL = 'images/chile.gif';
            break;
             case 'China': 
			imageURL = 'images/china.gif';
            break;
             case 'Cuba': 
			imageURL = 'images/cuba.gif';
            break;
             case 'Czech Republic': 
			imageURL = 'images/czech_republic.gif';
            break;
            case 'Egypt': 
			imageURL = 'images/egypt.gif';
            break;
            case 'Finland': 
			imageURL = 'images/finland.gif';
            break;
            case 'France': 
			imageURL = 'images/france.gif';
            break;
             case 'Germany': 
			imageURL = 'images/germany.gif';
            break;
            case 'Ghana': 
			imageURL = 'images/ghana.gif';
            break;
             case 'Iran': 
			imageURL = 'images/iran.gif';
            break;
             case 'Ireland': 
			imageURL = 'images/ireland.gif';
            break;
            case 'Italy': 
			imageURL = 'images/italy.gif';
            break;
            case 'Jamaica': 
			imageURL = 'images/jamaica.gif';
            break;
             case 'Japan': 
			imageURL = 'images/japan.gif';
            break;
            case 'Malasiya': 
			imageURL = 'images/malaysia.gif';
            break;
             case 'Mexico': 
			imageURL = 'images/mexico.gif';
            break;
            case 'Nepal': 
			imageURL = 'images/nepal.gif';
            break;
             case 'New Zealand': 
			imageURL = 'images/new_zealand.gif';
            break;
            case 'Poland': 
			imageURL = 'images/poland.gif';
            break;
            case 'Portugal': 
			imageURL = 'images/portugal.gif';
            break;
            case 'Puerto Rico': 
			imageURL = 'images/puerto_rico.gif';
            break;
            case 'Srilanka': 
			imageURL = 'images/sri_lanka.gif';
            break;
            case 'Russia': 
			imageURL = 'images/russia.gif';
            break;
            case 'South Korea': 
			imageURL = 'images/south_korea.gif';
            break;
            case 'Switzerland': 
			imageURL = 'images/switzerland.gif';
            break;
            case 'United Kingdom': 
			imageURL = 'images/uk.gif';
            break;
            case 'Uruguay': 
			imageURL = 'images/uruguay.gif';
            break;
            case 'USA': 
			imageURL = 'images/us.gif';
            break;
            case 'Cyprus': 
			imageURL = 'images/cyprus.gif';
            break;
		}

        var t = "URL("+imageURL+") no-repeat" ;
		return t;
	}

function muteSound(sound){

	if(isMute == false) {
      sound.style.backgroundPosition =  "0px -40px";
      music.volume = 0;
      isMute = true;
    }

    else {
      sound.style.backgroundPosition =  "0px  0px";
      music.volume = 0.2;
      isMute = false;
    }
}

var ui = ui = {
    body: $('body'),
    score_board: $('#score_board'),
    last_score: $('#last_score'),
    high_score: $('#high_score'),
    start_screen: $('#start_screen'),
    start_game: $('#start_game'),
    tweet: $('#tweet'),
    fb: $('#fb'),
    fps_count: $('#fps_count'),
    invincible_timer: $('#invincible_timer'),
    invincible_loader: $('#invincible_loader')
  };


function gameOver() {
    

    if(!isMute){
    	music.volume = 0.2;
    }

    // High Score
    if (score > highScore) {
      highScore = parseInt(score);
      localStorage.setItem("highScore", JSON.stringify(parseInt(score)));

      high_score.text("High Score: "+ highScore);
    }

    // Show last_score
    last_score.text("Last Score: " + parseInt(score));


    //
    document.getElementById('memory_board').innerHTML = "";
    location.reload();
}

