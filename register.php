<?php
// Database connection
$db = mysqli_connect('localhost', 'root', '', 'websys');
if (!$db) {
    die("Database Connection Failed: " . mysqli_connect_error());
}

// Check if POST data exists and sanitize inputs
if (isset($_POST['username']) && isset($_POST['password'])) {
    $username = mysqli_real_escape_string($db, $_POST['username']);
    $password = mysqli_real_escape_string($db, $_POST['password']);

    // Check if user exists
    $sql = "SELECT * FROM login WHERE username = '$username' AND password = '$password'";
    $result = mysqli_query($db, $sql);

    if (!$result) {
        die("Query Failed: " . mysqli_error($db));
    }

    $count = mysqli_num_rows($result);

    if ($count == 1) {
        echo json_encode("Error: User already exists.");
    } else {
        // Insert new user
        $insert = "INSERT INTO login (username, password) VALUES ('$username', '$password')";
        $query = mysqli_query($db, $insert);

        if ($query) {
            echo json_encode("Success: User registered successfully.");
        } else {
            echo json_encode("Error: Unable to register user.");
        }
    }
} else {
    echo json_encode("Error: Username and password are required.");
}

// Close the database connection
mysqli_close($db);
?>
