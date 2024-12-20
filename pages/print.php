<?php
include("../php/db.php");



if($_SERVER['REQUEST_METHOD'] == 'GET')
{
    $last_id = $_GET['last_id'];
    $sql = "SELECT i.purchase_id,i.product_id,i.buy_price,i.qty,i.total,p.date,p.total,p.pay,p.due, pr.product_name FROM purchase p, purchase_item i, product pr WHERE p.id = i.purchase_id AND i.purchase_id AND pr.barcode = i.product_id AND i.purchase_id = $last_id";

    $orderResult = $conn->query($sql);
    $orderdata = $orderResult->fetch_array();

    $purchase_id = $orderdata[0];
    $product_id = $orderdata[1];
    $buy_price = $orderdata[2];
    $qty = $orderdata[3];
    $total = $orderdata[4];
    $date = $orderdata[5];
    $subtotal = $orderdata[6];
    $pay = $orderdata[7];
    $due = $orderdata[8];

}
?>



<html>

<head>
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">

    <link rel="stylesheet" type="text/css" href="../components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../components/bootstrap/dist/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../components/jquery-confirm-master/css/jquery-confirm.css">
    <link href="http://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">

    <style>
        @media print
        {
            .button
            {
                display: none;
            }
        }

        @media print
        {
            @page
            {
                margin-top: 0;
                margin-bottom: 0;
            }
            body
            {
                padding-top: 72px;
                padding-bottom: 72px;
            }
        }
    </style>



</head>

<body style="background: #f9f9f9">

<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <div class='print' style="border: 1px solid #a1a1a1; width: 88mm; background: white; padding: 10px; margin: 0 auto; text-align: center;">
                <div align="center">
                    <H3>Purchase Invoice</H3>
                </div>

                <div align="left">
                    Date <b><?php echo $date; ?></b>
                </div>

                <div align="right">
                    Invoice <b><?php echo $last_id ?></b>
                </div>
                </br>

                <table class="table table-responsive">
                    <thead>
                        <tr>
                            <td class="text-center"><b>No</b></td>
                            <td class="text-center"><b>Item</b></td>
                            <td class="text-center"><b>Qty</b></td>
                            <td class="text-center"><b>Price</b></td>
                            <td class="text-center"><b>Total</b></td>
                        </tr>   
                    </thead>

                    <?php
                        $x = 1;
                        $orderResult = $conn->query($sql);
                        while ($row = $orderResult->fetch_array())
                        {
                    ?>

                        <tr>
                            <td class="text-center"><?php echo $x ?></td>
                            <td class="text-center"><?php echo $row[9] ?></td>
                            <td class="text-center"><?php echo $row[3] ?></td>
                            <td class="text-center"><?php echo $row[2] ?></td>
                            <td class="text-center"><?php echo $row[4] ?></td>
                        </tr>
                        
                        <?php $x++; } ?>
                        
                </table>

                <div align="right">
                    Sub Total <b><?php echo $subtotal; ?></b>
                </div>

                <div align="right">
                    Pay <b><?php echo $pay; ?></b>
                </div>

                <div align="right">
                    Due <b><?php echo $due; ?></b>
                </div>
            </div>
        </div>

    </div>



</div>





    <script src="../components/jquery/dist/jquery.js"></script>
    <script src="../components/jquery/dist/jquery.min.js"></script>
    <script src="../components/jquery.validate.min.js"></script>


    <script src="../components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="../components/bootstrap/dist/js/bootstrap.js"></script>
    <script src="../components/jquery-confirm-master/js/jquery-confirm.js"></script>

    <script src="http://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

<script>
    myFunction();

    function myFunction(){
        window.print();
    }

    window.onafterprint = function(e){
        closePrintView();
    }

    function closePrintView(){
        window.location.href = 'purchase.php';
    }
</script>


</body>

</html>

