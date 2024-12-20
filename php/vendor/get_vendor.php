<?php
include("../db.php");

$stmt = $conn->prepare("SELECT vendor_id, vname,contactno, email, address, status FROM vendor WHERE status = '1' ORDER BY vendor_id DESC");
$stmt->bind_result($vendor_id, $vname,$contactno, $email, $address, $status);   

if($stmt->execute())
{
    while($stmt->fetch())
    {
        $output[] = array("vendor_id"=>$vendor_id, "vname"=>$vname, "contactno"=>$contactno, "email"=>$email, "address"=>$address, "status"=>$status);
    }
    echo json_encode($output);

}

$stmt->close();



?>