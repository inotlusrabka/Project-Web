<?php
    session_start();

    if (!isset($_SESSION['username'])) {
        header('Location: /ProjekUAS/login.php');
        exit();
    }

    // Konfigurasi koneksi ke database
    $serverName = "localhost";
    $databaseUsername = "root";
    $databasePassword = "";
    $databaseName = "pc_part";

    // Membuat koneksi ke database
    $connect = new mysqli($serverName, $databaseUsername, $databasePassword, $databaseName);

    // Memeriksa koneksi
    if ($connect->connect_error) {
        die("Connection failed: " . $connect->connect_error);
    }

    // Ambil data pengguna dari database
    $username = $_SESSION['username'];
    $sql = "SELECT * FROM userdata WHERE Username = ?";
    $stmt = $connect->prepare($sql);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();
    } else {
        echo "User not found.";
        exit();
    }

    $stmt->close();
    $connect->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Customization</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/ProjekUAS/stylesheets/footer.css">
    <!-- FontAwesome CSS -->
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
                        <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <main class="py-4">
        <section id="profile" class="py-5">
            <div class="container">
                <h2 class="text-center">Customize Your Profile</h2>
                <form method="POST" action="update_profile.php" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="profile-name">Name</label>
                        <input type="text" class="form-control" id="profile-name" name="profile-name" value="<?php echo htmlspecialchars($user['Username']); ?>" placeholder="Enter your name">
                    </div>
                    <div class="form-group">
                        <label for="profile-email">Email</label>
                        <input type="email" class="form-control" id="profile-email" name="profile-email" value="<?php echo htmlspecialchars($user['Email']); ?>" placeholder="Enter your email">
                    </div>
                    <div class="form-group">
                        <label for="profile-bio">Bio</label>
                        <textarea class="form-control" id="profile-bio" name="profile-bio" rows="3" placeholder="Tell us about yourself"><?php echo htmlspecialchars($user['Bio']); ?></textarea>
                    </div>
                    <a href="index.php" class="btn btn-danger">Cancel</a> <button type="submit" class="btn btn-primary">Save Changes</button>
                </form>
                <div class="text-center mt-4">
                    <a href="/ProjekUAS/logout.php" class="btn btn-danger">Logout</a>
                </div>
            </div>
        </section>
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
