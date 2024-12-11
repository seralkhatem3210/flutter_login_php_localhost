<?php
// Establish a database connection
$db = mysqli_connect('localhost', 'root', '', 'userdata');

// Check if the database connection was successful
if (!$db) {
    die(json_encode(["Error" => "Database connection failed: " . mysqli_connect_error()]));
}

// Check if username and password are provided
if (isset($_POST['username']) && isset($_POST['password'])) {
    // Sanitize input to prevent SQL injection
    $username = mysqli_real_escape_string($db, $_POST['username']);
    $password = mysqli_real_escape_string($db, $_POST['password']);

    // Query to check if the user exists
    $sql = "SELECT * FROM login WHERE username = '$username' AND password = '$password'";
    $result = mysqli_query($db, $sql);

    if (!$result) {
        die(json_encode(["Error" => "Query failed: " . mysqli_error($db)]));
    }

    $count = mysqli_num_rows($result);

    // Return success or error message
    if ($count == 1) {
        echo json_encode(["Success" => "User authenticated successfully"]);
    } else {
        echo json_encode(["Error" => "Invalid username or password"]);
    }
} else {
    // If required fields are missing, return an error
    echo json_encode(["Error" => "Username and password are required"]);
}

// Close the database connection
mysqli_close($db);
?>
