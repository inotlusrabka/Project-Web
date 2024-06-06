<?php
    $serverName = "localhost";
    $databaseUsername = "root";
    $databasePassword = "";
    $databaseName = "rakitpc";

    $pdo = new PDO("mysql:host=$serverName;dbname=$databaseName", $databaseUsername, $databasePassword);

    $username = $_POST["username"];

    $stmt = $pdo->prepare('SELECT COUNT(*) FROM userdata WHERE Username = :username');
    $stmt->execute(['username' => $username]);
    if ($stmt->fetchColumn() > 0) {
        echo 'exists';
    } else {
        echo 'not_exists';
    }
?>
