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
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Validate and sanitize input data
    if (isset($_POST['post-id']) && isset($_SESSION['userid'])) {
        $postId = intval($_POST['post-id']);
        $userId = $_SESSION['userid'];
        
        // Get user access level
        $stmt = $conn->prepare("SELECT AccessLevel FROM userdata WHERE UserID = ?");
        $stmt->bind_param("i", $userId);
        $stmt->execute();
        $result = $stmt->get_result();
        $user = $result->fetch_assoc();
        $accessLevel = $user['AccessLevel'];
        $stmt->close();

        // Check if the user is the post owner or an admin
        $stmt = $conn->prepare("SELECT UserID FROM posts WHERE id = ?");
        $stmt->bind_param("i", $postId);
        $stmt->execute();
        $result = $stmt->get_result();
        $post = $result->fetch_assoc();
        $postOwnerId = $post['UserID'];
        $stmt->close();

        if ($accessLevel == 'Admin' || $userId == $postOwnerId) {
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
            echo "You do not have permission to edit or delete this post.";
        }
    } else {
        echo "Post ID or User ID not set.";
    }
}

$conn->close();
?>
