<?php

if($_SERVER['REQUEST_METHOD']=='POST')
{
    include("../db.php");

    $stmt = $conn->prepare("UPDATE category SET catname=?, status=? WHERE id=?");
    $stmt->bind_param("sss", $catname,$status,$category_id);

    $category_id = $_POST['category_id'];

    $catname = $_POST['catname'];
    $status = $_POST['status'];

    if($stmt->execute())
    {
        echo 1;
    }else
    {
        echo 0;
    }

    $stmt->close();
}


?>