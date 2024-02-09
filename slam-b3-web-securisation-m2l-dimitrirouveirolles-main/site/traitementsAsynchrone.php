<?php
    // On vérifie si l'action existe
    if (isset($_POST['action'])) {
        $action = $_POST['action'];
        switch ($action) {
            case 'verifpseudo': // Si l'action est égale à verifPseudo
                verifPseudo();
                break;
            case 'verifemail': // Si l'action est égale à verifMail
                verifEmail();
                break;
            case 'chargeavatars': // Si l'action est égale à chargeAvatars
                chargeAvatars();
                break;
            default:
                echo "Erreur";
                break;
        }
    }

    function verifPseudo() : void {
        $pseudo = htmlentities($_POST['pseudo']);
        include 'BDD/connectBdd.php';
        // Requête pour vérifier si le pseudo existe déjà
        $requetePrepare = $connexion->prepare("SELECT * FROM utilisateur WHERE pseudo = :pseudo");
        $requetePrepare->bindParam(':pseudo', $pseudo, PDO::PARAM_STR);
		$requetePrepare->execute();

        if ($requetePrepare->rowCount() > 0) {
            echo "existe";
        } else {
            echo "n'existe pas";
        }
    }

    function verifEmail() : void {
        $mail = htmlentities($_POST['email']);
        include 'BDD/connectBdd.php';
        // Requête pour vérifier si le mail existe déjà
        $requetePrepare = $connexion->prepare("SELECT * FROM utilisateur WHERE adresseMail = :mail");
        $requetePrepare->bindParam(':mail', $mail, PDO::PARAM_STR);
        $requetePrepare->execute();

        if ($requetePrepare->rowCount() > 0) {
            echo "existe";
        } else {
            echo "n'existe pas";
        }
    }

    function chargeAvatars() : void {
        $age = htmlentities($_POST['age']);
        include 'BDD/connectBdd.php';
        // Requête pour charger les avatars et générer le retour JSON

        $requetePrepare = $connexion->prepare("SELECT id, lienImage FROM galerieavatar WHERE :age BETWEEN ageMin AND ageMax");
        $requetePrepare->bindParam(':age', $age, PDO::PARAM_INT);
        $requetePrepare->execute();
        $tableauFichiers = $requetePrepare->fetchAll(PDO::FETCH_OBJ);
        echo json_encode($tableauFichiers);
    }




?>