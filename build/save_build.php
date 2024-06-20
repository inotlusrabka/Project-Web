<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "pc_part";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Assuming $_POST variables correspond to your select element IDs
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $UserID = $_POST['UserID'];
    $motherboard_id = $_POST['motherboard'];
    $processor_id = $_POST['cpu'];
    $ram_id = $_POST['ram'];
    $gpu_id = $_POST['gpu'];
    $powersupply_id = $_POST['psu'];
    $cases_id = $_POST['case'];

    $sql = "INSERT INTO build_component (UserID, motherboard_id, processor_id, ram_id, gpu_id, powersupply_id, cases_id)
            VALUES (?, ?, ?, ?, ?, ?, ?)";
    
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("iiiiiii", $UserID, $motherboard_id, $processor_id, $ram_id, $gpu_id, $powersupply_id, $cases_id);

    if ($stmt->execute()) {
        header("Location: index.html");
        exit();
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    $stmt->close();
    $conn->close();
}
?>
