var vragenArray = [];
var huidigeIndex = -1;
var aantalSpelers;
var spelerA;
var spelerB;
var gekozenModus;
var gekozenCategorie;
var gegenereerdeZin;
var scoreBord;
var punt;


// PARALLAX (mooi verschuiven van afbeelding) //
var activeerParallax = function activeerParallax(){
  responsive = $(window).width();
  if (responsive >= 768) {
    parallax();
  }
};

var parallax = debounce(function() {
  no_of_elements = 0;
  $('.parallax').each(function() {
    var $elem = $(this);

    if (isElementInViewport($elem)) {
      var parent_top = $elem.offset().top;
      var window_bottom = $(window).scrollTop();
      var $image = $elem.find('.parallax-background-image')
      var $oVal = ((window_bottom - parent_top) / 3);
      $image.css('margin-top', $oVal + 'px');
    }
  });
}, 6)

function debounce(func, wait, immediate) {
  var timeout;
  return function() {
    var context = this,
    args = arguments;
    clearTimeout(timeout);
    timeout = setTimeout(function() {
      timeout = null;
      if (!immediate) func.apply(context, args);
    }, wait);
    if (immediate && !timeout) func.apply(context, args);
  };
};

function isElementInViewport(elem) {
  var $elem = $(elem);

  // Get the scroll position of the page.
  var scrollElem = ((navigator.userAgent.toLowerCase().indexOf('webkit') != -1) ? 'body' : 'html');
  var viewportTop = $(scrollElem).scrollTop();
  var viewportBottom = viewportTop + $(window).height();

  // Get the position of the element on the page.
  var elemTop = Math.round($elem.offset().top);
  var elemBottom = elemTop + $elem.height();

  return ((elemTop < viewportBottom) && (elemBottom > viewportTop));
}

var spelModusConfiguratie = function spelModusConfiguratie(){     //deze fct is er omdat ik dynamisch extra configuratievragen inlaad, als spelmodus "spel" is
gekozenModus = $('input[name="soortModus"]:checked').val();
if(gekozenModus === "Spel modus"){
  $("#spelModusGekozen").removeClass("hide");             //als er voor de "spelModus" gekozen is, moeten de extra vragen getoond worden
  $("input[name='naamSpeler']").prop('required', true);   //inputs moeten dynamisch "required"-attr meekrijgen, anders foutmelding omdat niet alles gecheckt kan w (An invalid form control with name…is not focusable)
} else {
  $("#spelModusGekozen").addClass("hide");            //als er voor "casual" gekozen is, mogen de extra vragen NIET MEER getoond worden
  $("input[name='naamSpeler']").prop('required', false);
}
}

var spelersInputVelden = function spelersInputVelden() {
  aantalSpelers = $("#aantalSpelers").val();
  aantalSpelers = parseInt(aantalSpelers);
  var htmlString = "";
  for(var i = 0; i < aantalSpelers; i++) {
    htmlString += "<div class='form-group'><label for='naamSpeler'>Naam van de speler: </label><input type='text' class='form-control' name='naamSpeler' placeholder='Naam van speler " + (i + 1) + "' id='speler" + (i + 1) + "'/>";
  };
  $("#namenSpelers").html(htmlString);
};


var spelersOpslaan = function spelersOpslaan(e) {     //hier maak ik een JSON-object aan met de naam en score van alle spelers en dit object steek ik dan id Local Storage
  e.preventDefault();
  if(gekozenModus === "Spel modus"){

    var spelers = [];
    for (var i = 0; i < aantalSpelers; i++) {
      var naamSpeler = $('#speler' + (i + 1)).val();
      var score = 0;

      item = {};
      item["naam"] = naamSpeler;
      item["score"] = score;

      spelers.push(item);
    }

    if (typeof Storage !== 'undefined') {
      if (spelers !== null) {
        localStorage.setItem('spelers', JSON.stringify(spelers));
      }
    }
  }
  verkrijgSpelersUitLocalStorage();
  doorgaanNaarSpeelVeld();
};

var verkrijgSpelersUitLocalStorage = function verkrijgSpelersUitLocalStorage() {
  if (typeof Storage !== 'undefined') {
    var result = JSON.parse(localStorage.getItem('spelers'));
  } else {
    alert("Niets in de localstorage, sorry!")
  }
  return result;
};

var doorgaanNaarSpeelVeld = function doorgaanNaarSpeelVeld() {
  $("#step1").slideUp();
  $("#step1").addClass("hide");
  $("#step2").removeClass("hide");
  $("#step2").delay(1000).slideDown();
};

var doFetch = (url,data) => {
  const body = {
    method: 'post',
    datatype: JSON,
    body: data
  };

  return fetch('functions.php?actie=' + url, body)
};

var aanArrayToeTeVoegenVragen = function aanArrayToeTeVoegenVragen(vragenlijst){
  vragenArray = [];
  vragenlijst.forEach(function(vraag){
    vragenArray.push(vraag.vraag);          //zo haal je enkel het "vraag"-gedeelte op uit de "vragenlijst" en stop je het in een nieuwe array van enkel vragen
  });
};



var haalVragenMetIdOp = function haalVragenMetIdOp(){
  gekozenCategorie = $('input[name="categorie"]:checked').val();
  if(gekozenCategorie !== "4"){
    var id = gekozenCategorie;
    var data = new FormData();
    data.append('categorie_id', id);
    doFetch("haalLijstVragenOp",data)
    .then(function(vragen){
      return vragen.json();
    })
    .then(function(vragen){
      aanArrayToeTeVoegenVragen(vragen);
    });
  } else {
    var data = new FormData();
    data.append('categorie_id', 1);
    doFetch("randomVragenOphalen",data)
    .then(function (vragen) {
      return vragen.json();
    })
    .then(function(vragen){
      aanArrayToeTeVoegenVragen(vragen);
    });
  };
};

var haalRandomVragenOp = function haalRandomVragenOp(){
  var data = {categorie_id: 1};
  doFetch('randomVragenOphalen', data).done(aanArrayToeTeVoegenVragen);
};

var kiesRandomSpeler = function kiesRandomSpeler(){
  var data = verkrijgSpelersUitLocalStorage();
  var obj_keys = Object.keys(data);
  var random_key = obj_keys[Math.floor(Math.random() * obj_keys.length)];
  geselecteerdeSpeler = data[random_key];
  return geselecteerdeSpeler;
}

var volgendeVraag = function volgendeVraag(){
  pasWindowAanModusAan();
  if(huidigeIndex  < (vragenArray.length - 1)){   //want arrayposities gaan van 0 - 20 (en length is 21) --> dus als de huidigeIndex kleiner is dan index 20, dan mag je volgende vraag
    huidigeIndex++;
    $("#volgendvraagje").html(vragenArray[huidigeIndex]);
  } else {
    toonGameOver();
  }
};

var pasWindowAanModusAan = function pasWindowAanModusAan(){
  if(gekozenModus === "Spel modus"){
    gameModus();
    $("#puntentoekenning").removeClass("hide");
  } else {
    casualModus();
  }
}

var gameModus = function gameModus(){
  $("#puntentoekenning").removeClass("hide");   //knoppen met punten moeten getoond worden
  var htmlString = "";
  var zin = genereerZin();
  htmlString += "<h2 class='header-text'>" + gekozenModus + "</h2>";
  htmlString += "<p>" + gegenereerdeZin + "</p>";
  $(".genereerEensEenZin").html(htmlString);
}

var casualModus = function casualModus(){
  var htmlString = "";
  htmlString += "<h2 class='header-text'>" + gekozenModus + "</h2>";
  $("#next").removeClass("hide");
  $(".genereerEensEenZin").html(htmlString);
}

var genereerZin = function genereerZin(){
  spelerA = kiesRandomSpeler();
  spelerB = kiesRandomSpeler();

  while(spelerA.naam === spelerB.naam){
    spelerB = kiesRandomSpeler();
  }

  gegenereerdeZin = spelerA.naam + ", het is jouw beurt om een vraag over " + spelerB.naam + " te beantwoorden";
}

var toonGameOver = function toonGameOver() {
  geefTopscores();
  console.log(scoreBord);
  console.log("We zitten in gameover");
  $("#step2").slideUp();
  $("#step2").addClass("hide");
  $("#step3").removeClass("hide");
  $("#step3").delay(1000).slideDown();

  var htmlString = "";

  scoreBord.forEach(speler => {
    htmlString += "<li>" + speler.naam + " had " + speler.score + " punten!" + "</li>";
  });

htmlString += "<br />";
  htmlString += "<a href='index.html' id='opnieuwSpelen'> Opnieuw spelen </a>";

  $("#scorebord").html(htmlString);
};

var slaSpelersOp = function (spelers) {
  if (typeof Storage !== 'undefined') {
    localStorage.setItem("spelers",spelers);
  }
};

var pasTotaalScoreAan = function pasTotaalScoreAan(){
  punt = $(this).val();
  punt = parseInt(punt);      //want anders doe je gewoon  "0" + 2 = 02 ipv 2
  if(spelerA.score !== NaN) spelerA.score += punt;
  var spelers = verkrijgSpelersUitLocalStorage();
  spelers.forEach(speler => {
    if(spelerA.naam === speler.naam ){
      speler.score += punt;
    }
  });
  slaSpelersOp(JSON.stringify(spelers));
  pushNotificatie();
}

var geefTopscores = function geefTopscores(){
  scoreBord = JSON.parse(localStorage.getItem('spelers'));
  scoreBord.sort(function(a, b) {
    return b.score - a.score;
  });
}

var pushNotificatie = function pushNotificatie(){
  Push.create("Score-update",{
    body: spelerA.naam + " verdiende net " + punt + " punten!" + " Huidig totaal van " + spelerA.naam + ": " + spelerA.score + " punten",
    timeout:3000
  });
}

$(function(){
  console.log("We zijn vertrokken en al lang...");
  $(window).on("scroll", activeerParallax);

  $("input[name='soortModus']").on("change", spelModusConfiguratie); //formulierdeel met "aantal spelers" en "spelersnamen" moeten enkel verschijnen als "gameModus" aangeklikt is
  spelersInputVelden();                                    //zonder dit komt het er standaard anders niet meer op
  $("#aantalSpelers").on("change", spelersInputVelden);   //pas inputvelden voor spelersnamen aan aan het aantal spelers

  $("#configuratie").on("submit", haalVragenMetIdOp);     //als de form gesubmit is, worden de vragen uit de databank gehaald
  $("#configuratie").on("submit", spelersOpslaan);        //sla de spelers op in localstorage
  $("#configuratie").on("submit", pasWindowAanModusAan);  //pas de lay-out aan aan de modus (ofwel casual ofwel game)
  $("#beginKnop").on( "click", function() {
    $("#beginKnop").addClass("hide");
    $("button[value='0']").prop('disabled', false);
    $("button[value='1']").prop('disabled', false);
    $("button[value='2']").prop('disabled', false);
  });

  $(".random").on("click", haalRandomVragenOp);

  $("#genereerZin").on("click", genereerZin);           //dit is de dynamisch gegenereerdeZin van "Lara, los nu een vraag over Badlapje op."

  $("#next").on("click", volgendeVraag);                //laad een volgende vraag op het scherm (#next voor de "casual modus" en .score (=puntenknop) voor de "game modus")
  $(".score").on("click", volgendeVraag);

  $(".score").on("click", pasTotaalScoreAan);           //verander de score bij elke klik op een "puntenknop"

  $("#stopSpel").on("click", toonGameOver);
});
