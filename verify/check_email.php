<?php
    $serverName = "localhost";
    $databaseUsername = "root";
    $databasePassword = "";
    $databaseName = "rakitpc";

    $pdo = new PDO("mysql:host=$serverName;dbname=$databaseName", $databaseUsername, $databasePassword);

    $email = $_POST["email"];

    $stmt = $pdo->prepare('SELECT COUNT(*) FROM userdata WHERE Email = :email');
    $stmt->execute(['email' => $email]);
    if ($stmt->fetchColumn() > 0) {
        echo 'exists';
    } else {
        echo 'not_exists';
    }
?>
