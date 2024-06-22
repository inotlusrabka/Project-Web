<?php
    session_start();

    if (!isset($_SESSION['username'])) {
        header('Location: /ProjekUAS/login.php');
        exit();
    } elseif (isset($_SESSION['username'])){
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
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CC - Profile</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/ProjekUAS/stylesheets/footer.css">
    <!-- FontAwesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
</head>
<body>
<header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="/ProjekUAS/">
                    <img src="/ProjekUAS/logo.png" alt="Computer Crafter Logo" style="height: 67px; width: 180px;">
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/#parts">Parts List</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/#build">Build Guide</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/build">Build</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/forum">Forum</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/#about">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/#contact">Contact</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/#team">Our Team</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/profile"><i class="fas fa-user"></i></a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <main class="py-4">
      <section id="profile" class="py-5">
            <div class="container animate__animated animate__fadeIn">
                <h2 class="text-center">Welcome to your profile, <?php echo htmlspecialchars($_SESSION['username']); ?>!</h2>
                <div class="form-group">
                    <label for="profile-name">Name : <?php echo htmlspecialchars($_SESSION['username']); ?></label>
                </div>
                <div class="form-group">
                    <label for="profile-email">Email : <?php echo htmlspecialchars($_SESSION['email']); ?></label>
                </div>
                <div class="form-group">
                    <label for="profile-bio">Bio</label>
                </div>
                <div class="form-group">
                    <textarea class="form-control" id="profile-bio" name="profile-bio" rows="3" placeholder="You have not set your bio yet" disabled><?php if (!empty($_SESSION['bio'])) {
                                                                                                                echo htmlspecialchars($user['Bio']);
                                                                                                            } else {
                                                                                                            } ?></textarea>
                </div>
                <div class="mt-4">
                    <a href="edit-profile.php" class="btn btn-primary">Edit Profile</a>
                    <a href="/ProjekUAS/profile/your-builds" class="btn btn-primary">Your Builds</a>
                </div>
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
