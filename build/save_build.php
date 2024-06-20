<?php
session_start();

if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}

// Konfigurasi koneksi ke database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "pc_part";

// Membuat koneksi ke database
$conn = new mysqli($servername, $username, $password, $dbname);

// Memeriksa koneksi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Mendapatkan UserID dari sesi
$UserID = $_SESSION['userid'];

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $motherboard_id = $_POST['motherboard'];
    $processor_id = $_POST['cpu'];
    $ram_id = $_POST['ram'];
    $gpu_id = $_POST['gpu'];
    $powersupply_id = $_POST['psu'];
    $cases_id = $_POST['case'];

    // Debugging statements
    error_log("Motherboard ID: $motherboard_id");
    error_log("Processor ID: $processor_id");
    error_log("RAM ID: $ram_id");
    error_log("GPU ID: $gpu_id");
    error_log("Power Supply ID: $powersupply_id");
    error_log("Case ID: $cases_id");

    // Mempersiapkan dan mengeksekusi pernyataan SQL
    $sql = "INSERT INTO build_component (UserID, motherboard_id, processor_id, ram_id, gpu_id, powersupply_id, cases_id)
            VALUES (?, ?, ?, ?, ?, ?, ?)";
    
    $stmt = $conn->prepare($sql);
    if ($stmt === false) {
        die("Prepare failed: " . $conn->error);
    }
    
    $stmt->bind_param("iiiiiii", $UserID, $motherboard_id, $processor_id, $ram_id, $gpu_id, $powersupply_id, $cases_id);
    
    if ($stmt->execute()) {
        header("Location: index.php");
        exit();
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>
