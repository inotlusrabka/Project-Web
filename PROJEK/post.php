<?php
session_start(); // Start the session to access the session variables

$servername = "localhost";
$username = "root";
$password = "rafie1715";
$dbname = "pc_part";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Debugging output
    echo '<pre>';
    print_r($_POST);
    echo '</pre>';
    
    // Validate and sanitize input data
    if (isset($_POST['post-title']) && isset($_POST['post-content'])) {
        $title = htmlspecialchars($_POST['post-title']);
        $content = htmlspecialchars($_POST['post-content']);
        
        // Check if UserID is set in session, otherwise set it to NULL
        if (isset($_SESSION['UserID'])) {
            $userId = $_SESSION['UserID'];
        } else {
            $userId = NULL; // Set UserID to NULL if user is not logged in
        }
        
        // Prepare and execute SQL query to insert post
        $stmt = $conn->prepare("INSERT INTO posts (UserID, title, message) VALUES (?, ?, ?)");
        if ($stmt) {
            $stmt->bind_param("iss", $userId, $title, $content);
            if ($stmt->execute()) {
                // Redirect back to the forum page after successful submission
                header("Location: forum.php");
                exit();
            } else {
                echo "Error: " . $stmt->error;
            }
            $stmt->close();
        } else {
            echo "Error: " . $conn->error;
        }
    } else {
        echo "Post title or content not set.";
    }
}

$conn->close();
?>
