<?php //on utilise ici une autre stratégie que celle du routeur que vous avez vu en PPE1 pour uniformiser les pages de l'application. Il s'agit d'inclure sur chaque page du site des entetes et bas de page identiques 
include "header.php";

?>
<div class="container">
	<h1>Affichage de la fiche</h1>

	<?php
	$association = 0;
	$image = "";
	$pseudo = "pas de pseudo transmis";
	$nom = "pas de nom transmis";
	$prenom = "pas de prénom transmis";
	$statut = "";
	$dateNaissance = '2000-01-01';
	$avatar = 1;
	$adresse = "";
	$pays = "";

	if (isset($_GET['choix']) && $_GET['choix'] != "") {
		$asso = htmlentities($_GET['choix']);
		$requetePrepare = $connexion->prepare('SELECT libelleAssociation, imageAssociation, descriptionAssociation FROM association WHERE idAssociation = ' . $asso );
		$resultats = $requetePrepare->execute();
		$ligne = $requetePrepare->fetch(PDO::FETCH_OBJ); // on dit qu'on veut que le résultat soit récupérable sous forme d'objet
		$description = $ligne->descriptionAssociation;
		$image = "images/associations/" . $ligne->imageAssociation;
		$libelleAsso = $ligne->libelleAssociation;
	}

	if (isset($_POST['pseudo']) && $_POST['pseudo'] != "") {
		$pseudo = $_POST['pseudo'];
	}
	if (isset($_POST['nom']) && $_POST['nom'] != "") {
		$nom = $_POST['nom'];
	}
	if (isset($_POST['prenom']) && $_POST['prenom'] != "") {
		$prenom = $_POST['prenom'];
	}
	if (isset($_POST['statut']) && $_POST['statut'] != "") {
		$statut = $_POST['statut'];
	}
	if (isset($_POST['dateNaissance']) && $_POST['dateNaissance'] != "") {
		$dateNaissance = $_POST['dateNaissance'];
	}
	if (isset($_POST['avatar']) && $_POST['avatar'] != "") {
		$avatar = $_POST['avatar'];
	}

	if (isset($_POST['civilite']) && $_POST['civilite'] != "") {
		$civilite = $_POST['civilite'];
	}
	if (isset($_POST['email']) && $_POST['email'] != "") {
		$email = $_POST['email'];
	}

	if (isset($_POST['adresse']) && $_POST['adresse'] != "") {
		$adresse = $_POST['adresse'];
	}
	if (isset($_POST['motDePasse']) && $_POST['motDePasse'] != "") {
		$motDePasse = $_POST['motDePasse'];
	}
	if (isset($_POST['confirmationMotDePasse']) && $_POST['confirmationMotDePasse'] != "") {
		$confirmationMotDePasse = $_POST['confirmationMotDePasse'];
	}

	if (isset($_POST['pays']) && $_POST['pays'] != "") {
		$pays = $_POST['pays'];
	}
	if (isset($_POST['newsletter']) && $_POST['newsletter'] != "") {
		if ($_POST['newsletter'] == "on"){
			$newsletter = 1;
		}
	} else {
		$newsletter = 0;
	}

	$requete = "INSERT INTO utilisateur (pseudo, nom, prenom, idAssociation, idStatut, civilite, adresseMail, dateNaissance, adresse, motPasse, id_GalerieAvatar, id_pays, newsletter) VALUES ('$pseudo', '$nom', '$prenom', '$asso', '$statut', '$civilite', '$email', '$dateNaissance', '$adresse', '$motDePasse', '$avatar', '$pays', '$newsletter')";

	$resultat = $connexion->query($requete);

	if ($resultat) {
	?>
		<div class="alert alert-success">Fiche bien enregistrée pour l'association <?php echo $libelleAsso; ?></div>
		<div class="row">
			<div class="col-md-3">
				<img class="img-responsive" src="<?php echo $image; ?>" width="150px" alt="logo"/>
			</div>

			<?php
			$requetePrepare = $connexion->prepare('SELECT lienImage FROM galerieavatar WHERE id = '. $avatar );
			$resultats = $requetePrepare->execute();
			$ligne = $requetePrepare->fetch(PDO::FETCH_OBJ);
			$lienImageAvatar = $ligne->lienImage;
			?>
			<div class="col-md-3">
				<u>Avatar :</u> <img src="images/<?php echo $lienImageAvatar; ?>" alt="avatar" />
			</div>

			<div class="col-md-3">
				<u>Pseudo :</u> <?php echo $pseudo; ?>
			</div>

			<div class="col-md-3">
				<u>Nom :</u> <?php echo $nom; ?>
			</div>

			<div class="col-md-3">
				<u>Prénom : </u> <?php echo $prenom; ?>
			</div>

			<div class="col-md-3">
				<u>Date de naissance :</u> <?php echo $dateNaissance; ?>
			</div>

			<?php
			$requetePrepare = $connexion->prepare('SELECT libelleStatut FROM statut WHERE idStatut = '. $statut .' AND idAssociation = ' . $asso );
			$resultats = $requetePrepare->execute();
			$ligne = $requetePrepare->fetch(PDO::FETCH_OBJ);
			?>
			<div class="col-md-3">
				<u>Statut </u> <?php echo $ligne->libelleStatut; ?>
			</div>

			<?php
			$requetePrepare = $connexion->prepare('SELECT libelle FROM civilite WHERE id = '. $civilite );
			$resultats = $requetePrepare->execute();
			$ligne = $requetePrepare->fetch(PDO::FETCH_OBJ);
			$civilite = $ligne->libelle;
			?>
			<div class="col-md-3">
				<u>Civilité :</u> <?php echo $civilite; ?>
			</div>

			<div class="col-md-3">
				<u>Email :</u> <?php echo $email; ?>
			</div>

			<div class="col-md-3">
				<u>Adresse :</u> <?php echo $adresse; ?>
			</div>

			<div class="col-md-3">
				<u>Mot de passe :</u> <?php echo $motDePasse; ?>
			</div>

			<?php
			$requetePrepare = $connexion->prepare('SELECT libelle FROM pays WHERE id = '. $pays );
			$resultats = $requetePrepare->execute();
			$ligne = $requetePrepare->fetch(PDO::FETCH_OBJ);
			$pays = $ligne->libelle;
			?>
			<div class="col-md-3">
				<u>Pays :</u> <?php echo $pays; ?>
			</div>

			<?php 
			if ($newsletter == 1){
				$newsletter = "oui";
			} else {
				$newsletter = "non";
			}
			?>
			<div class="col-md-3">
				<u>Newsletter :</u> <?php echo $newsletter; ?>
			</div>

		</div>
	<?php
	} else {
	?>
		<div class="row alert alert-danger">
			<strong>Erreur</strong> La fiche n'a pas pu être enregistrée
		</div>
	<?php
	}
	?>
</div>
<?php
include "footer.php";
?>