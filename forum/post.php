<?php
session_start();

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

// Check if form is submitted
if (!isset($_SESSION['username'])) {
    header('Location: /ProjekUAS/login.php');
    exit();
} elseif ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Validate and sanitize input data
    if (isset($_POST['post-title']) && isset($_POST['post-content']) && isset($_POST['build_id'])) {
        $title = htmlspecialchars($_POST['post-title']);
        $content = htmlspecialchars($_POST['post-content']);
        $build_id = htmlspecialchars($_POST['build_id']);

        // Assuming you have stored user ID in session after login
        if (isset($_SESSION['userid'])) {
            $userId = $_SESSION['userid'];

            // Prepare and execute SQL query to insert post
            $stmt = $conn->prepare("INSERT INTO posts (UserID, title, message, build_id) VALUES (?, ?, ?, ?)");
            if ($stmt) {
                $stmt->bind_param("issi", $userId, $title, $content, $build_id);
                if ($stmt->execute()) {
                    // Redirect back to the forum page after successful submission
                    header("Location: /ProjekUAS/forum");
                    exit();
                } else {
                    echo "Error: " . $stmt->error;
                }
                $stmt->close();
            } else {
                echo "Error: " . $conn->error;
            }
        } else {
            echo "User ID not set in session.";
        }
    } else {
        echo "Post title, content, or build_id not set.";
    }
}

$conn->close();
?>
