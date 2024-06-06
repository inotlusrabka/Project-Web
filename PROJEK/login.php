<?php
session_start();

// Mengecek apakah form login sudah disubmit
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Konfigurasi koneksi ke database
    $serverName = "localhost";
    $databaseUsername = "root";
    $databasePassword = "rafie1715";
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
        $stmt = $pdo->prepare('SELECT * FROM userdata WHERE Username = :username AND Password = :password LIMIT 1');
        $stmt->execute(['username' => $username, 'password' => $hashPassword]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user) {
            // Jika cocok, simpan informasi pengguna di session
            $_SESSION['username'] = $user['Username'];
            $_SESSION['access_level'] = $user['AccessLevel'];

            // Redirect ke halaman index.html setelah login berhasil
            header("Location: index.html");
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
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="stylesheets/login.css">
</head>
<body>
    <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-md-6">
                <div class="login-form">
                    <h1 class="text-center mb-4">Welcome To Computer Crafter</h1>
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
</body>
</html>
