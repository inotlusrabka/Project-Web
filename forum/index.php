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
    <!-- AOS CSS -->
    <link href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" rel="stylesheet">
    
    <!-- Bootstrap CSS and other styles -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/ProjekUAS/stylesheets/footer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="index.html">Computer Crafter</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/#parts">Parts List</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/#build">Build Guide</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/build">Build</a></li>
                        <li class="nav-item active"><a class="nav-link" href="#">Forum</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/#about">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/#contact">Contact</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/profile/"><i class="fas fa-user"></i></a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <main class="py-4">
        <section id="forum" class="py-5">
            <div class="container">
                <h2 class="text-center" data-aos="fade-up">Forum Discussion</h2>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title" data-aos="fade-up">Welcome to the Computer Crafter Forum</h5>
                        <p class="card-text" data-aos="fade-up">Discuss and share your experiences, tips, and questions about building custom PCs.</p>
                        <!-- Forum content -->
                        <div class="list-group">
                            <?php
                            if ($result->num_rows > 0) {
                                while($row = $result->fetch_assoc()) {
                                    echo '<div class="list-group-item" data-aos="fade-up" data-aos-duration="1000">';
                                    echo '<div class="d-flex w-100 justify-content-between">';
                                    echo '<div>';
                                    echo '<h5 class="mb-1">' . htmlspecialchars($row["title"]) . '</h5>';
                                    echo '<p class="mb-1">' . htmlspecialchars($row["message"]) . '</p>';
                                    echo '</div>';
                                    if (isset($_SESSION['username'])) {
                                        echo '<div>';
                                        echo '<button class="btn btn-secondary btn-sm edit-btn mr-2" data-toggle="modal" data-target="#editDeletePostModal" data-id="' . $row["id"] . '" data-title="' . htmlspecialchars($row["title"]) . '" data-message="' . htmlspecialchars($row["message"]) . '">Edit/Delete</button>';
                                        echo '</div>';
                                    }
                                    echo '</div>';
                                    echo '</div>';
                                }
                            } else {
                                echo '<p class="text-center">No posts available</p>';
                            }
                            ?>
                        </div>
                        <div class="mt-4">
                            <?php
                            if (isset($_SESSION['username'])) {
                                echo '<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#newPostModal">New Post</button>';
                            } else {
                                echo '<div class="text-center alert alert-danger" role="alert" data-aos="fade-up" data-aos-duration="1000">You must be logged in to create a new post.</div>';
                            }
                            ?>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- New Post Modal -->
        <div class="modal fade" id="newPostModal" tabindex="-1" aria-labelledby="newPostModalLabel" aria-hidden="true" data-aos="zoom-in">
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
                            <?php
                            if (isset($_SESSION['username'])) {
                                echo '<div class="form-group">';
                                echo '<label for="post-title">Title</label>';
                                echo '<input type="text" class="form-control" id="post-title" name="post-title" placeholder="Enter post title">';
                                echo '</div>';
                                echo '<div class="form-group">';
                                echo '<label for="post-content">Content</label>';
                                echo '<textarea class="form-control" id="post-content" name="post-content" rows="3" placeholder="Enter post content"></textarea>';
                                echo '</div>';
                                echo '<button type="submit" class="btn btn-primary">Submit</button>';
                            } else {
                                echo '<div class="mt-4 alert alert-danger" role="alert">You must be logged in to create a new post.</div>'; 
                            }
                            ?>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Edit/Delete Post Modal -->
        <div class="modal fade" id="editDeletePostModal" tabindex="-1" aria-labelledby="editDeletePostModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editDeletePostModalLabel">Edit/Delete Post</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="editDeletePostForm" action="edit_delete_post.php" method="POST">
                            <?php
                            if (isset($_SESSION['username'])) {
                                echo '<input type="hidden" id="edit-delete-post-id" name="post-id">';
                                echo '<div class="form-group">';
                                echo '<label for="edit-delete-post-title">Title</label>';
                                echo '<input type="text" class="form-control" id="edit-delete-post-title" name="post-title" placeholder="Enter post title">';
                                echo '</div>';
                                echo '<div class="form-group">';
                                echo '<label for="edit-delete-post-content">Content</label>';
                                echo '<textarea class="form-control" id="edit-delete-post-content" name="post-content" rows="3" placeholder="Enter post content"></textarea>';
                                echo '</div>';
                                echo '<button type="submit" name="action" value="edit" class="btn btn-primary">Save Changes</button>';
                                echo '<button type="submit" name="action" value="delete" class="btn btn-danger">Delete Post</button>';
                            } else {
                                echo '<p class="text-center">You must be logged in to edit or delete a post.</p>';
                            }
                            ?>
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

    <!-- Bootstrap JS and other scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- AOS Library -->
    <script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>

    <!-- Initialize AOS -->
    <script>
        AOS.init();
    </script>
</body>
</html>
