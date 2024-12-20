<?php
include("../db.php");

$stmt = $conn->prepare("SELECT id, brand,status FROM brand WHERE status = '1' ORDER BY id DESC");
$stmt->bind_result($id,$brand,$status);   

if($stmt->execute())
{
    while($stmt->fetch())
    {
        $output[] = array("id"=>$id, "brand"=>$brand, "status"=>$status);
    }
    echo json_encode($output);

}

$stmt->close();



?>