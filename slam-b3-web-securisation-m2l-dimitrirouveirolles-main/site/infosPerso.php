<?php //on utilise ici une autre stratégie que celle du routeur que vous avez vu en PPE1 pour uniformiser les pages de l'application. Il s'agit d'inclure sur chaque page du site des entetes et bas de page identiques 
include "header.php";

$connected = false; // initialisation de la variable qui nous permettra de savoir si l'utilisateur est connecté ou non
$titrePage = "Connexion"; // le titre de la page par défaut

if(isset($_POST['pseudo']) && isset($_POST['password'])) {
	$pseudo = $_POST['pseudo'];
	$password = $_POST['password'];
	$sql = "SELECT * FROM utilisateur U JOIN association A ON U.idAssociation = A.idAssociation JOIN statut S ON (U.idAssociation,U.idStatut) = (S.idAssociation,S.idStatut) WHERE pseudo = '". $pseudo . "' AND motPasse = '" . $password . "' ;";

	// on récupère les infos de l'utilisateur
	$requetePrepare = $connexion->prepare($sql);
	$resultats = $requetePrepare->execute();
	$utilisateur = $requetePrepare->fetch(PDO::FETCH_OBJ);

	if ($utilisateur) {
		$message = '<div class="alert alert-success" role="alert">Vous êtes connecté</div>';
		$connected = true;
		$titrePage = "Infos personnelles de " . $utilisateur->prenom . " " . $utilisateur->nom;
	} else {
		$message = '<div class="alert alert-danger" role="alert">Vous n\'êtes pas autorisé à accéder à cette page</div>';
		$connected = false;
		$titrePage = "Accès refusé";
	}
}

?>
<div class="container">
	<h1><?= $titrePage ?></h1>

	<?php
	if (isset($message)) {
		echo $message;
	}
	if ($connected){
		echo '<div class="row">
		<div class="col-md-6">
			<h2>Informations personnelles</h2>
			<ul>
				<li>Pseudo : ' . $utilisateur->pseudo . '</li>
				<li>Nom : ' . $utilisateur->nom . '</li>
				<li>Prénom : ' . $utilisateur->prenom . '</li>
				<li>Adresse : ' . $utilisateur->adresse . '</li>
				<li>Adresse mail : ' . $utilisateur->adresseMail . '</li>
				<li>date de naissance : ' . $utilisateur->dateNaissance . '</li>
				<li>mot de passe : ' . $utilisateur->motPasse . '</li>
				<li>Association : ' . $utilisateur->libelleAssociation . '</li>
				<li>Statut : ' . $utilisateur->libelleStatut . '</li>
			</ul>
		</div>';
	} else {
		// on affiche le formulaire de connexion
		?>
		<form action="infosPerso.php" method="post">
			<label for="pseudo">Pseudo :</label>
			<input type="text" id="pseudo" name="pseudo" required>

			<label for="password">Mot de passe :</label>
			<input type="password" id="password" name="password" required>

			<input type="submit" value="Se connecter">
		</form>
	<?php
	}
	?>
</div>

<?php
include "footer.php";
?>