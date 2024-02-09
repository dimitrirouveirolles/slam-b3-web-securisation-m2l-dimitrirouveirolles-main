<?php
include_once 'configBdd.php';

try {
    $connexion = new PDO(
        'mysql:host=' . $_ENV['MYSQL_HOST'] . ';dbname=' . $_ENV['MYSQL_DATABASE'],
        $_ENV['MYSQL_USER'],
        $_ENV['MYSQL_PASSWORD']
    );
    $connexion->exec('SET NAMES utf8');
} catch (Exception $e) {
    echo 'Une erreur de connexion à la BDD est survenue !';
    die('Erreur : ' . $e->getMessage());
}
