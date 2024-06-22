<?php
session_start();

if (!isset($_SESSION['username'])) {
    header('Location: /ProjekUAS/login.php');
    exit();
}

// Konfigurasi koneksi ke database
$serverName = "localhost";
$databaseUsername = "root";
$databasePassword = "";
$databaseName = "pc_part";

// Membuat koneksi ke database
$connect = new mysqli($serverName, $databaseUsername, $databasePassword, $databaseName);

// Memeriksa koneksi
if ($connect->connect_error) {
    die("Connection failed: " . $connect->connect_error);
}

// Mendapatkan data dari form
$username = $_SESSION['username'];
$email = $_POST['profile-email'];
$bio = $_POST['profile-bio'];

// Update data pengguna di database
$sql = "UPDATE userdata SET Email = ?, Bio = ? WHERE Username = ?";
$stmt = $connect->prepare($sql);
$stmt->bind_param("sss", $email, $bio, $username);

if ($stmt->execute()) {
    // Update session variables
    $_SESSION['email'] = $email;
    $_SESSION['bio'] = $bio;
    header('Location: /ProjekUAS/profile'); // Redirect kembali ke halaman profile
} else {
    echo "Error updating record: " . $connect->error;
}

$stmt->close();
$connect->close();
?>

