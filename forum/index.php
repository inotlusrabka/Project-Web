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

// Query to get posts and join with build_component and part pc tables
$sql = "
    SELECT
        posts.id AS post_id, posts.UserID, posts.title, posts.message, build_component.build_id, build_component.motherboard_id,
        build_component.processor_id, build_component.ram_id, build_component.gpu_id, build_component.powersupply_id,
        build_component.cases_id, motherboard.brand AS motherboard_brand, motherboard.item_name AS motherboard_item_name,
        motherboard.image_url AS motherboard_image_url, motherboard.buy_url AS motherboard_buy_url,
        processor.brand AS processor_brand, processor.item_name AS processor_item_name, processor.image_url AS processor_image_url, processor.buy_url AS processor_buy_url,
        ram.brand AS ram_brand, ram.item_name AS ram_item_name, ram.image_url AS ram_image_url, ram.buy_url AS ram_buy_url,
        gpu.brand AS gpu_brand, gpu.item_name AS gpu_item_name, gpu.image_url AS gpu_image_url, gpu.buy_url AS gpu_buy_url,
        powersupply.model AS powersupply_model, powersupply.image_url AS powersupply_image_url, powersupply.buy_url AS powersupply_buy_url,
        cases.model AS cases_model, cases.image_url AS cases_image_url, cases.buy_url AS cases_buy_url, 
        userdata.username, userdata.AccessLevel
    FROM posts
    LEFT JOIN build_component ON posts.build_id = build_component.build_id
    LEFT JOIN motherboard ON build_component.motherboard_id = motherboard.item_id
    LEFT JOIN processor ON build_component.processor_id = processor.item_id
    LEFT JOIN ram ON build_component.ram_id = ram.item_id
    LEFT JOIN gpu ON build_component.gpu_id = gpu.item_id
    LEFT JOIN powersupply ON build_component.powersupply_id = powersupply.id
    LEFT JOIN cases ON build_component.cases_id = cases.id
    LEFT JOIN userdata ON posts.UserID = userdata.UserID
";

$result = $conn->query($sql);

// Mendapatkan UserID dari sesi
$UserID = $_SESSION['userid'] ?? null;

// Query untuk mengambil data build_component dengan nomor urut berdasarkan UserID
$sql_build = "
    SELECT build_component.build_id, build_component.UserID, 
    ROW_NUMBER() OVER (PARTITION BY build_component.UserID ORDER BY build_component.build_id) AS build_number 
    FROM build_component 
    WHERE build_component.UserID = ?
";

$stmt = $conn->prepare($sql_build);
if ($stmt === false) {
    die("Prepare failed: " . $conn->error);
}

$stmt->bind_param("i", $UserID);
$stmt->execute();
$build_result = $stmt->get_result();

$stmt->close();

// Fetch comments for each post
$sql_comments = "
    SELECT comment.id, comment.PostId, comment.UserId, comment.message, userdata.username
    FROM comment
    JOIN userdata ON comment.UserId = userdata.UserID
";
$comments_result = $conn->query($sql_comments);

$comments = [];
if ($comments_result->num_rows > 0) {
    while ($row = $comments_result->fetch_assoc()) {
        $comments[$row['PostId']][] = $row;
    }
}

$conn->close();
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
                <a class="navbar-brand" href="index.html">
                    <img src="/ProjekUAS/logo.png" alt="Computer Crafter Logo" style="height: 67px; width: 180px;">
                </a>
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
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/#team">Our Team</a></li>
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
                        <?php
                            if (isset($_SESSION['username'])) {
                                echo '<div class="text-right mb-3">';
                                echo '<button class="btn btn-success" data-toggle="modal" data-target="#newPostModal">New Post</button>';
                                echo '</div>';
                            } else {
                                echo '<div class="text-center alert alert-danger" role="alert" data-aos="fade-up" data-aos-duration="1000">You must be logged in to create a new post.</div>';
                            }
                        ?>
                        <?php if ($result->num_rows > 0): ?>
                            <?php while($row = $result->fetch_assoc()): ?>
                                <div class="card mb-3" data-aos="fade-up">
                                    <div class="card-body">
                                        <h5 class="card-subtitle mb-2">Posted by: <?php echo htmlspecialchars($row['username']); ?></h5>
                                        <h6 class="card-title"><?php echo htmlspecialchars($row['title']); ?></h6>
                                        <p class="card-text"><?php echo nl2br(htmlspecialchars($row['message'])); ?></p>
                                        <?php if (!empty($row['build_id'])): ?>
                                            <div class="card mt-3">
                                                <div class="card-body">
                                                    <h6 class="card-subtitle mb-2 text-muted">Build Details</h6>
                                                    <ul class="list-unstyled mb-0">
                                                        <li><strong>Motherboard:</strong> <?php echo htmlspecialchars($row['motherboard_brand'] . ' ' . $row['motherboard_item_name']); ?></li>
                                                        <li><strong>Processor:</strong> <?php echo htmlspecialchars($row['processor_brand'] . ' ' . $row['processor_item_name']); ?></li>
                                                        <li><strong>RAM:</strong> <?php echo htmlspecialchars($row['ram_brand'] . ' ' . $row['ram_item_name']); ?></li>
                                                        <li><strong>GPU:</strong> <?php echo htmlspecialchars($row['gpu_brand'] . ' ' . $row['gpu_item_name']); ?></li>
                                                        <li><strong>Power Supply:</strong> <?php echo htmlspecialchars($row['powersupply_model']); ?></li>
                                                        <li><strong>Case:</strong> <?php echo htmlspecialchars($row['cases_model']); ?></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        <?php endif; ?>
                                        <div class="card-body">
                                            <h5 class="card-subtitle mb-2">Comments:</h5>
                                            <?php if (isset($comments[$row['post_id']])): ?>
                                                <?php foreach ($comments[$row['post_id']] as $comment): ?>
                                                    <div class="border p-2 mb-2">
                                                        <p class="mb-1"><strong><?php echo htmlspecialchars($comment['username']); ?>:</strong></p>
                                                        <p class="mb-1"><?php echo nl2br(htmlspecialchars($comment['message'])); ?></p>
                                                    </div>
                                                <?php endforeach; ?>
                                            <?php else: ?>
                                                <p class="text-muted">No comments yet.</p>
                                            <?php endif; ?>
                                            <?php if (isset($_SESSION['username'])): ?>
                                                <form action="comment.php" method="post">
                                                    <input type="hidden" name="post_id" value="<?php echo $row['post_id']; ?>">
                                                    <div class="form-group">
                                                        <textarea class="form-control" name="message" rows="2" placeholder="Add a comment..." required></textarea>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary btn-sm">Comment</button>
                                                </form>
                                            <?php endif; ?>
                                        </div>
                                        <?php
                                            if (isset($_SESSION['userid']) && ($_SESSION['userid'] == $row['UserID'] ) || $_SESSION['access_level'] == 'Admin' ) {
                                                echo '<div class="text-right mb-3">';
                                                echo '<button class="btn btn-primary mt-3" data-toggle="modal" data-target="#editDeletePostModal" data-id="' . $row['post_id'] . '" data-title="' . htmlspecialchars($row['title']) . '" data-message="' . htmlspecialchars($row['message']) . '">Edit / Delete</button>';
                                                echo '</div>';
                                            }
                                        ?>
                                    </div>
                                </div>
                            <?php endwhile; ?>
                        <?php else: ?>
                            <div class="alert alert-info" role="alert" data-aos="fade-up" data-aos-duration="1000">No posts found.</div>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <!-- New Post Modal -->
    <div class="modal fade" id="newPostModal" tabindex="-1" role="dialog" aria-labelledby="newPostModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="newPostModalLabel">New Post</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="newPostForm" action="post.php" method="post">
                        <div class="form-group">
                            <label for="title">Title</label>
                            <input type="text" class="form-control" id="post-title" name="post-title" required>
                        </div>
                        <div class="form-group">
                            <label for="message">Message</label>
                            <textarea class="form-control" id="post-content" name="post-content" rows="5" required></textarea>
                        </div>
                        <div class="form-group">
                            <label for="build_id">Select a Build (Optional)</label>
                            <select class="form-control" id="build_id" name="build_id">
                                <option value="">None</option>
                                <?php if ($build_result->num_rows > 0): ?>
                                    <?php while($build_row = $build_result->fetch_assoc()): ?>
                                        <option value="<?php echo $build_row['build_id']; ?>">
                                            Build <?php echo $build_row['build_number']; ?>
                                        </option>
                                    <?php endwhile; ?>
                                <?php endif; ?>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit / Delete Post Modal -->
    <div class="modal fade" id="editDeletePostModal" tabindex="-1" role="dialog" aria-labelledby="editDeletePostModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editDeletePostModalLabel">Edit / Delete Post</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="editDeletePostForm" action="edit_delete_post.php" method="post">
                        <input type="hidden" id="editDeletePostId" name="post_id">
                        <div class="form-group">
                            <label for="editDeleteTitle">Title</label>
                            <input type="text" class="form-control" id="editDeleteTitle" name="title" required>
                        </div>
                        <div class="form-group">
                            <label for="editDeleteMessage">Message</label>
                            <textarea class="form-control" id="editDeleteMessage" name="message" rows="5" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                        <button type="button" class="btn btn-danger" id="deletePostButton">Delete Post</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <footer class="bg-dark text-white mt-5 p-4 text-center">
        &copy; 2024 Computer Crafter. All Rights Reserved.
    </footer>

    <!-- AOS JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>

    <!-- jQuery, Bootstrap JS, and other scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        $('#editDeletePostModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget)
            var id = button.data('id')
            var title = button.data('title')
            var message = button.data('message')
            var modal = $(this)
            modal.find('#editDeletePostId').val(id)
            modal.find('#editDeleteTitle').val(title)
            modal.find('#editDeleteMessage').val(message)
        })

        $('#deletePostButton').on('click', function () {
            if (confirm('Are you sure you want to delete this post?')) {
                $('#editDeletePostForm').attr('action', 'delete_post.php');
                $('#editDeletePostForm').submit();
            }
        })
    </script>
</body>
</html>
