<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="stylesheets/login.css">
</head>
<body>
    <script type="text/javascript" src="scripts/scripts.js"></script>
    <div class="top-bar">
    </div>
    <div class="login-form">
        <p>Register</p>
        <hr color="black">
        <?php
        $serverName = "localhost";
        $databaseUsername = "root";
        $databasePassword = "";
        $databaseName = "pc_part";

        $connect = mysqli_connect($serverName, $databaseUsername, $databasePassword, $databaseName);

        if (!$connect){
            die("Maaf, mohon coba lagi nanti." . mysqli_connect_error()); 
        } else if($_SERVER["REQUEST_METHOD"] == "POST"){
            $username = $_POST["username"];
            $email = $_POST["email"];
            $password = $_POST["password"];
            $repassword = $_POST["repassword"];

            // Hash password
            $hashPassword = hash('sha256', $password);

            // PDO connection
            $pdo = new PDO("mysql:host=$serverName;dbname=$databaseName", $databaseUsername, $databasePassword);

            // Check if username already exists
            $stmt = $pdo->prepare('SELECT COUNT(*) FROM userdata WHERE Username = :username');
            $stmt->execute(['username' => $username]);
            if ($stmt->fetchColumn() > 0) {
                echo '<script>alert("Username sudah terdaftar.")</script>';
            } else {
                // Check if email already exists
                $stmt = $pdo->prepare('SELECT COUNT(*) FROM userdata WHERE Email = :email');
                $stmt->execute(['email' => $email]);
                if ($stmt->fetchColumn() > 0) {
                    echo '<script>alert("Email sudah terdaftar.")</script>';
                } else {
                    // Jika username dan email belum ada, lakukan INSERT
                    $stmt = $pdo->prepare('INSERT INTO userdata (Username, Email, Password, AccessLevel) VALUES (:username, :email, :password, "Member")');
                    $stmt->execute(['username' => $username, 'email' => $email, 'password' => $hashPassword]);
                    // Redirect to login page after successful registration
                    header("Location: login.php");
                }
            }
        }
        ?>
        <form action="register.php" method="post">
            <input type="text" name="username" placeholder="Username" onkeyup='checkUsernameExists()' required> <!-- REMINDER : Usahakan check username langsung kayak password -->
            <span id="UsernameConfirmMessage"></span>
            <input type="text" name="email" placeholder="E-mail" onkeyup='checkEmailExists()' required> <!-- REMINDER : Usahakan check email langsung kayak password -->
            <span id="EmailConfirmMessage"></span>
            <input type="password" id="password" name="password" placeholder="Password" onkeyup='passConfirm();' required/>
            <input type="password" id="repassword" name="repassword" placeholder="Confirm Password" onkeyup='passConfirm();' required/>
            <span id="PasswordConfirmMessage"></span>
            <input class="register-button" type="submit" value="Register">
        </form>
    </div>
    <div>
        <p>Have an account? <a href="login.php">Click Here!</a></p>
    </div>
</body>
</html>
