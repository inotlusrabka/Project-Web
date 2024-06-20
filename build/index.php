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

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CC - Computer Crafter Simulator</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <!-- AOS CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="/ProjekUAS/">Computer Crafter</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/#parts">Parts List</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/#build">Build Guide</a></li>
                        <li class="nav-item active"><a class="nav-link" href="/ProjekUAS/build">Build</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/Forum">Forum</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/#about">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/#contact">Contact</a></li>
                        <?php
                            if (!isset($_SESSION['username'])) {
                                header('Location: login.php');
                                exit();
                            } elseif (isset($_SESSION['username'])){
                                echo '<li class="nav-item"><a class="nav-link" href="/ProjekUAS/profile"><i class="fas fa-user"></i></a></li>';
                            }
                        ?>
                        
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <main class="py-4">
        <div class="container">
            <h2 class="text-center" data-aos="fade-up">Simulate Your PC Build</h2>
            <form id="pc-assembly-form" method="POST" action="save_build.php">
                <div class="form-group" data-aos="fade-up">
                    <label for="motherboard">Select Motherboard</label>
                    <select class="form-control" id="motherboard" name="motherboard">
                        <option value="">Select a Motherboard</option>
                        <!-- Options will be populated using JavaScript -->
                    </select>
                    <img id="motherboard-img" src="" alt="Motherboard Image" class="img-fluid mt-2" style="display:none; width: 150px; height: 150px;">
                </div>
                <div class="form-group" data-aos="fade-up">
                    <label for="cpu">Select CPU</label>
                    <select class="form-control" id="cpu" name="cpu" disabled>
                        <option value="">Select a CPU</option>
                        <!-- Options will be populated based on selected motherboard -->
                    </select>
                    <img id="cpu-img" src="" alt="CPU Image" class="img-fluid mt-2" style="display:none; width: 150px; height: 150px;">
                </div>
                <div class="form-group" data-aos="fade-up">
                    <label for="gpu">Select GPU</label>
                    <select class="form-control" id="gpu" name="gpu">
                        <option value="">Select a GPU</option>
                        <!-- Options will be populated using JavaScript -->
                    </select>
                    <img id="gpu-img" src="" alt="GPU Image" class="img-fluid mt-2" style="display:none; width: 150px; height: 150px;">
                </div>
                <div class="form-group" data-aos="fade-up">
                    <label for="ram">Select RAM</label>
                    <select class="form-control" id="ram" name="ram">
                        <option value="">Select RAM</option>
                        <!-- Options will be populated using JavaScript -->
                    </select>
                    <img id="ram-img" src="" alt="RAM Image" class="img-fluid mt-2" style="display:none; width: 150px; height: 150px;">
                </div>
                <div class="form-group" data-aos="fade-up">
                    <label for="psu">Select Power Supply (PSU)</label>
                    <select class="form-control" id="psu" name="psu">
                        <option value="">Select a Power Supply</option>
                        <!-- Options for PSU will be populated using JavaScript -->
                    </select>
                    <img id="psu-img" src="" alt="PSU Image" class="img-fluid mt-2" style="display:none; width: 150px; height: 150px;">
                </div>
                <div class="form-group" data-aos="fade-up">
                    <label for="case">Select Case</label>
                    <select class="form-control" id="case" name="case">
                        <option value="">Select a Case</option>
                        <!-- Options for Case will be populated using JavaScript -->
                    </select>
                    <img id="case-img" src="" alt="Case Image" class="img-fluid mt-2" style="display:none; width: 150px; height: 150px;">
                </div>
                <?php
                    if (isset($_SESSION['username'])) {
                        echo '<div class="text-center mt-4">';
                        echo '<button type="submit" class="btn btn-primary" data-aos="fade-up">Save Build</button>';
                        echo '</div>';
                    } else {
                        echo '<div class="mt-4 alert alert-danger" role="alert" data-aos="fade-up">You must be logged in to save the build.</div>'; 
                    }
                ?>                         
            </form>

            <div class="mt-4" data-aos="fade-up">
                <h4>Total Harga: Rp<span id="total-price">0</span></h4>
            </div>
            <div class="mt-4" data-aos="fade-up">
                <h4>Total Power Consumption: <span id="total-power">0 W</span></h4>
            </div>
            <div class="mt-2" data-aos="fade-up">
                <p id="power-warning" class="text-danger"></p>
            </div>
        </div>
    </main>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Font Awesome -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <!-- AOS JS -->
    <script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>
    <!-- Custom JavaScript -->
    <script src="build_script.js"></script>
</body>
</html>
