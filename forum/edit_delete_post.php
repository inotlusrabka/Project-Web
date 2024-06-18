<?php
session_start();

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
    // Validate and sanitize input data
    if (isset($_POST['post-id'])) {
        $postId = intval($_POST['post-id']);
        
        if ($_POST['action'] == 'edit' && isset($_POST['post-title']) && isset($_POST['post-content'])) {
            $title = htmlspecialchars($_POST['post-title']);
            $content = htmlspecialchars($_POST['post-content']);
            
            // Prepare and execute SQL query to update post
            $stmt = $conn->prepare("UPDATE posts SET title = ?, message = ? WHERE id = ?");
            if ($stmt) {
                $stmt->bind_param("ssi", $title, $content, $postId);
                if ($stmt->execute()) {
                    // Redirect back to the forum page after successful update
                    header("Location: index.php");
                    exit();
                } else {
                    echo "Error: " . $stmt->error;
                }
                $stmt->close();
            } else {
                echo "Error: " . $conn->error;
            }
        } elseif ($_POST['action'] == 'delete') {
            // Prepare and execute SQL query to delete post
            $stmt = $conn->prepare("DELETE FROM posts WHERE id = ?");
            if ($stmt) {
                $stmt->bind_param("i", $postId);
                if ($stmt->execute()) {
                    // Redirect back to the forum page after successful deletion
                    header("Location: index.php");
                    exit();
                } else {
                    echo "Error: " . $stmt->error;
                }
                $stmt->close();
            } else {
                echo "Error: " . $conn->error;
            }
        } else {
            echo "Invalid action or missing post data.";
        }
    } else {
        echo "Post ID not set.";
    }
}

$conn->close();
?>
