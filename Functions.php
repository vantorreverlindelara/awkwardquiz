<?php
require_once 'Database.php';

function getVraagdbInstantie(){


  return VraagDb::getVraagdbInstantie('localhost', 'root', '', 'AwkwardQuestions');
}

if(isset($_GET['actie'])){
  $_GET['actie']();       //deze triggert dan de fct "haalLijstVragenOp"
}


function haalLijstVragenOp(){
  // om data op te halen
   if(isset($_POST['categorie_id'])){
     $vragen = getVraagdbInstantie()->vragenOpvragenMetCategorieID($_POST['categorie_id']);
     echo json_encode($vragen);
  //   var_dump($vragen);
   }
}

function randomVragenOphalen(){
  $vragen = getVraagdbInstantie()->randomVragenOpvragen();
  echo json_encode($vragen);
};


?>
