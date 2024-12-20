<?php

if($_SERVER['REQUEST_METHOD']=='POST')
{
    include("../db.php");

    $stmt = $conn->prepare("UPDATE vendor SET vname=?,contactno=?,email=?,address=?,status=? WHERE vendor_id=?");
    $stmt->bind_param("sissii",$vname,$contactno,$email,$address,$status,$vendor_id);

    $vendor_id = $_POST['vendor_id'];

    $vname = $_POST['vendorname'];
    $contactno = $_POST['contactno'];
    $email = $_POST['email'];
    $address = $_POST['address'];
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