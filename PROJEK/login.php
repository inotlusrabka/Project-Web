<?php
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $serverName = "localhost";
    $databaseUsername = "root";
    $databasePassword = "";
    $databaseName = "pc_part";

    $connect = mysqli_connect($serverName, $databaseUsername, $databasePassword, $databaseName);

    if (!$connect) {
        die("Maaf, mohon coba lagi nanti." . mysqli_connect_error()); 
    } else {
        $username = $_POST["username"];
        $password = $_POST["password"];

        // Hash password
        $hashPassword = hash('sha256', $password);

        // PDO connection
        $pdo = new PDO("mysql:host=$serverName;dbname=$databaseName", $databaseUsername, $databasePassword);

        // Check if username and password match
        $stmt = $pdo->prepare('SELECT * FROM userdata WHERE Username = :username AND Password = :password LIMIT 1');
        $stmt->execute(['username' => $username, 'password' => $hashPassword]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user) {
            // Jika cocok, simpan informasi pengguna di session
            $_SESSION['username'] = $user['Username'];
            $_SESSION['access_level'] = $user['AccessLevel'];
            // Redirect ke halaman berikutnya
            header("Location: halaman_berhasil_login.php");
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
    <link rel="stylesheet" href="stylesheets/login.css">
</head>
<body>
    <div class="top-bar"></div>
    <div class="login-form">
        <p>Log In</p>
        <hr color="black">
        <?php if(isset($error)) { ?>
            <p style="color: red;"><?php echo $error; ?></p>
        <?php } ?>
        <form action="<?php echo $_SERVER["PHP_SELF"]; ?>" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <input class="login-button" type="submit" value="Login">
        </form>
    </div>
    <div>
        <p>Don't have an account? <a href="register.php">Click Here!</a></p>
    </div>
</body>
</html>
