<?php //on utilise ici une autre stratégie que celle du routeur que vous avez vu en PPE1 pour uniformiser les pages de l'application. Il s'agit d'inclure sur chaque page du site des entetes et bas de page identiques 
include "header.php";

?>
<div class="container">
	<h1>Affichage des utilisateurs existants</h1>
	<script>
		$(document).ready(function() {
			$('#example').DataTable();
		});
	</script

	<?php
	$requetePrepare = $connexion->prepare('SELECT pseudo, nom, prenom, libelleStatut, libelleAssociation, adresse from utilisateur U join association A on U.idAssociation = A.idAssociation join statut S on (U.idAssociation,U.idStatut) = (S.idAssociation,S.idStatut);');
	$resultats = $requetePrepare->execute();
	$utilisateurs = $requetePrepare->fetchAll(PDO::FETCH_OBJ);
	?>

	<table id="example" class="table table-striped">
		<thead>
			<tr>
				<th class="th-sm" scope="col">pseudo</th>
				<th class="th-sm" scope="col">nom</th>
				<th class="th-sm" scope="col">prénom</th>
				<th class="th-sm" scope="col">association</th>
				<th class="th-sm" scope="col">statut</th>
				<th class="th-sm" scope="col">adresse</th>
			</tr>
		</thead>
		<tbody>
			<?php
			foreach ($utilisateurs as $ligne) {
				echo 	'
				<tr>
				  <th scope="row">' . $ligne->pseudo . '</th>
				  <td>' . $ligne->nom . '</td>
				  <td>' . $ligne->prenom . '</td>
				  <td>' . $ligne->libelleAssociation . '</td>
				  <td>' . $ligne->libelleStatut . '</td>
				  <td>' . $ligne->adresse . '</td>
				</tr>';
			}
			?>
		</tbody>
	</table>
</div>
<?php
include "footer.php";
?>