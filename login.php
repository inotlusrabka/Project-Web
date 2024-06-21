<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Konfigurasi koneksi ke database
    $serverName = "localhost";
    $databaseUsername = "root";
    $databasePassword = "";
    $databaseName = "pc_part";

    // Membuat koneksi ke database
    $connect = mysqli_connect($serverName, $databaseUsername, $databasePassword, $databaseName);

    // Memeriksa koneksi database
    if (!$connect) {
        die("Maaf, mohon coba lagi nanti." . mysqli_connect_error()); 
    } else {
        // Mengambil data dari form login
        $username = $_POST["username"];
        $password = $_POST["password"];

        // Hash password
        $hashPassword = hash('sha256', $password);

        // PDO connection
        $pdo = new PDO("mysql:host=$serverName;dbname=$databaseName", $databaseUsername, $databasePassword);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Memeriksa apakah username dan password cocok
        $stmt = $pdo->prepare('SELECT UserID, Username, Email FROM userdata WHERE Username = :username AND Password = :password LIMIT 1');
        $stmt->execute(['username' => $username, 'password' => $hashPassword]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user) {
            // Jika cocok, simpan informasi pengguna di session
            session_start();
            $_SESSION['username'] = $user['Username'];
            $_SESSION['access_level'] = $user['AccessLevel'];
            $_SESSION['email'] = $user['Email'];
            $_SESSION['userid'] = $user['UserID'];

            // Redirect ke halaman index.php setelah login berhasil
            header("Location: /ProjekUAS/");
            exit(); // Penting untuk memastikan tidak ada output lain yang dikirim sebelum redirect
        } else {
            // Jika tidak cocok, tampilkan pesan error
            $error = "Username atau password salah.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CC - Login</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="stylesheets/login.css">
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="/ProjekUAS/">
                    <img src="logo.png" alt="Computer Crafter Logo" style="height: 67px; width: 180px;">
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
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/forum">Forum</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/#about">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/#contact">Contact</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/#team">Our Team</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    
    <main class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-md-6">
                <h1 class="text-center mb-4">Welcome to Computer Crafter</h1>
                <div class="login-form p-4 shadow">
                    <h2 class="text-center">Log In</h2>
                    <hr>
                    <?php if(isset($error)) { ?>
                        <div class="alert alert-danger"><?php echo $error; ?></div>
                    <?php } ?>
                    <form action="<?php echo $_SERVER["PHP_SELF"]; ?>" method="post">
                        <div class="form-group">
                            <input type="text" class="form-control" name="username" placeholder="Username" required>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" name="password" placeholder="Password" required>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block animated bounce">Login</button>
                    </form>
                </div>
                <div class="text-center mt-3">
                    <p>Don't have an account? <a href="register.php">Click Here!</a></p>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS (optional) -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <!-- FontAwesome (optional) -->
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>
</html>
