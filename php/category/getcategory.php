<?php
include("../db.php");

$stmt = $conn->prepare("SELECT id, catname,status FROM category WHERE status = '1' ORDER BY id DESC");
$stmt->bind_result($id,$catname,$status);  

if($stmt->execute())
{
    while($stmt->fetch())
    {
        $output[] = array("id"=>$id, "catname"=>$catname, "status"=>$status);
    }
    echo json_encode($output);

}

$stmt->close();



?>