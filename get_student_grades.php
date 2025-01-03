<?php
header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");
header("Content-Type: application/json");

$con = mysqli_connect("localhost", "root", "", "school");


if (mysqli_connect_errno()) {
    echo json_encode(["error" => "Failed to connect to MySQL: " . mysqli_connect_error()]);
    exit();
}


if (isset($_GET['student_id'])) {
    $student_id = mysqli_real_escape_string($con, $_GET['student_id']);

    $sql = "
        SELECT 
            students.student_id, students.name, 
            subjects.subject_code, subjects.subject_name, 
            grades.grade
        FROM grades
        INNER JOIN students ON grades.student_id = students.id
        INNER JOIN subjects ON grades.subject_id = subjects.id
        WHERE students.student_id = '$student_id'
    ";

    if ($result = mysqli_query($con, $sql)) {
        $grades = [];
        while ($row = mysqli_fetch_assoc($result)) {
            $grades[] = $row;
        }

       
        if (count($grades) > 0) {
            echo json_encode($grades);
        } else {
            echo json_encode(["error" => "No grades found for this student ID."]);
        }

        mysqli_free_result($result);
    } else {
        echo json_encode(["error" => "Query failed: " . mysqli_error($con)]);
    }
} else {
    echo json_encode(["error" => "Student ID is required."]);
}

mysqli_close($con);
?>
