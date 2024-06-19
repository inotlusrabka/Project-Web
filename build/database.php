<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "pc_part";

// Buat koneksi
$conn = new mysqli($servername, $username, $password, $dbname);

// Periksa koneksi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$tables = ['motherboard', 'processor', 'gpu', 'ram', 'powersupply', 'cases'];
$data = [];

foreach ($tables as $table) {
    $sql = "SELECT * FROM $table";
    $result = $conn->query($sql);

    $data[$table] = [];
    while ($row = $result->fetch_assoc()) {
        $data[$table][] = $row;
    }
}

header('Content-Type: application/json');
echo json_encode($data);

$conn->close();
?>
