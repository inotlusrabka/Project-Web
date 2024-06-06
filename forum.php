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

$sql = "SELECT id, UserID, title, message FROM posts";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CC - Computer Crafter Forum</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="index.php">CC - Computer Crafter</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link" href="index.php">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="index.html#parts">Parts List</a></li>
                        <li class="nav-item"><a class="nav-link" href="index.html#build">Build Guide</a></li>
                        <li class="nav-item active"><a class="nav-link" href="forum.php">Forum</a></li>
                        <li class="nav-item"><a class="nav-link" href="index.html#about">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="index.html#contact">Contact</a></li>
                        <li class="nav-item"><a class="nav-link" href="profile.php"><i class="fas fa-user"></i></a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <main class="py-4">
        <section id="forum" class="py-5">
            <div class="container">
                <h2 class="text-center">Forum Discussion</h2>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Welcome to the Computer Crafter Forum</h5>
                        <p class="card-text">Discuss and share your experiences, tips, and questions about building custom PCs.</p>
                        <!-- Forum content -->
                        <div class="list-group">
                            <?php
                            if ($result->num_rows > 0) {
                                while($row = $result->fetch_assoc()) {
                                    echo '<a href="#" class="list-group-item list-group-item-action">';
                                    echo '<h5 class="mb-1">' . htmlspecialchars($row["title"]) . '</h5>';
                                    echo '<p class="mb-1">' . htmlspecialchars($row["message"]) . '</p>';
                                    echo '</a>';
                                }
                            } else {
                                echo '<p class="text-center">No posts available</p>';
                            }
                            ?>
                        </div>
                        <div class="mt-4">
                            <?php if (isset($_SESSION['username'])): ?>
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#newPostModal">New Post</button>
                            <?php else: ?>
                                <div class="alert alert-danger" role="alert">
                                    Anda harus login terlebih dahulu sebelum mengirim postingan ke forum!
                                </div>
                                <a href="login.php" class="btn btn-primary">Login</a>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="modal fade" id="newPostModal" tabindex="-1" aria-labelledby="newPostModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="newPostModalLabel">New Post</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="post.php" method="POST">
                            <div class="form-group">
                                <label for="post-title">Title</label>
                                <input type="text" class="form-control" id="post-title" name="post-title" placeholder="Enter post title">
                            </div>
                            <div class="form-group">
                                <label for="post-content">Content</label>
                                <textarea class="form-control" id="post-content" name="post-content" rows="3" placeholder="Enter post content"></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <footer class="bg-dark text-white text-center py-3">
        <div class="container">
            <p>&copy; 2024 Computer Crafter. All rights reserved.</p>
        </div>
    </footer>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

<?php
$conn->close();
?>
