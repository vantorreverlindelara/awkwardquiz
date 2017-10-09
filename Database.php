<?php
class VraagDB
{
	private static $vraagdbInstantie = null;
	private $dbh;

	private function __construct($server, $username, $password, $database){
		try{
			$this->dbh =
			new PDO("mysql:host=$server; dbname=$database;charset=utf8; port=3306", $username, $password);
			$this->dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		}
		catch (PDOException $e){ die($e->getMessage());}
	}

	public static function getVraagdbInstantie($server, $username, $password, $database){
		if(is_null(self::$vraagdbInstantie)){
			self::$vraagdbInstantie =
			new Vraagdb($server, $username, $password, $database);
		}
		return self::$vraagdbInstantie;
	}

	public function sluitDB()
	{
		$this->dbh = null;
	}

	public function vragenOpvragenMetCategorieID($categorie_id){
		try {
			$sql = "SELECT * FROM vragen WHERE categorie_id = :categorie_id";
			$stmt = $this->dbh->prepare($sql);
			$stmt->bindParam(":categorie_id", $categorie_id);
			$stmt->execute();
			$vragentabel = $stmt->fetchAll(PDO::FETCH_CLASS);
		} catch (PDOException $e){
			die($e->getMessage());
		}
		return $vragentabel;
	}

	public function randomVragenOpvragen(){
		try {
			$sql = "SELECT vraag FROM vragen ORDER BY RAND()";
			$stmt = $this->dbh->prepare($sql);
			$stmt->execute();
			$vragentabel = $stmt->fetchAll(PDO::FETCH_CLASS);
		} catch (PDOException $e){
			die($e->getMessage());
		}
		return $vragentabel;
	}
}
?>
