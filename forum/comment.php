<?php
session_start();
if (!isset($_SESSION['userid'])) {
    die('You must be logged in to comment.');
}

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "pc_part";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$post_id = $_POST['post_id'];
$user_id = $_SESSION['userid'];
$message = $_POST['message'];

$sql = "INSERT INTO comment (PostId, UserId, message) VALUES (?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("iis", $post_id, $user_id, $message);
$stmt->execute();
$stmt->close();
$conn->close();

header("Location: index.php");
exit();
?>
