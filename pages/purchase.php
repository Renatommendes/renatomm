<html>

<head>
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">

    <link rel="stylesheet" type="text/css" href="../components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../components/bootstrap/dist/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../components/jquery-confirm-master/css/jquery-confirm.css">
    <link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
    
    
<style>
.viewport {
    position: relative;
    }

canvas.drawingBuffer {
            position: absolute;
            left: 0;
            top: 100;

    }
.element.style{
    width: 50px;
}

</style>

</head>

<body>

<?php include ("../header.php") ?>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-8">
            <form class="form-horizontal" id="frmBrand">
                <form class="form-horizontal" id="frmvender">
                    <div class="form-group" align="right">
                        <label class="col-sm-3">Vendor</label>
                        <div class="col-sm-3" align="right">
                            <select class="form-control" id="vendor" name="vendor">
                                <option value="">Please Select</option>

                            </select>
                        </div>
                </form>
                
                <form id="frmProduct">

                    <table class="table table-bordered" >
                    
                    <caption> Add Product</caption>
                    
                    

                    <tr>
                    <label class="table table-bordered" align="left" >Leitor de Codigo de Barras</label>
                    <div style="display: flex; flex-direction: column;">
                        <input align="left" class="col-sm-3" type="button" id="btn" class="form-control" value="Iniciar/Fechar Leitor" />
                        <div class="table table-bordered" align="left" id="camera" style="display: none;" class="viewport">
                            <video id="videocamera" style="width: 227px; display: none;"></video>
                        </div>
                    </div>
                        <th>Product Code</th>
                        <th>Product Name</th>
                        <th>Price</th>
                        <th>Qty</th>
                        <th>Amount</th>
                        <th>Option</th>
                    </tr>

                    <tr>
                        <td>
                            <input type="text" id="procode" class="form-control" name="procode" placeholder="procode" required>
                        </td>
                        <td>
                            <input type="text" id="proname" class="form-control" name="proname" placeholder="proname" disabled>
                        </td>
                        <td>
                            <input type="text" id="price" class="form-control" name="price" placeholder="price" disabled>
                        </td>
                        <td>
                            <input type="number" id="qty" class="form-control" name="qty" placeholder="qty" min="1" value="1" required>
                        </td>
                        <td>
                            <input type="text" id="tot_cost" class="form-control" name="tot_cost" disabled>
                        </td>
                        <td>
                            <button class="btn btn-success" type="button" onclick="addproduct()">Add</button>
                        </td>
                    </tr>
                    </table>
                </form>

                <table class="table table-bordered" id="productlist">
                    <thead>
                        <tr>
                            <th>Remove</th>
                            <th>Product Code</th>
                            <th>Product Name</th>
                            <th>Price</th>
                            <th>Qty</th>
                            <th>Amount</th>
                        </tr>
                    </thead>
                    <tbody>


                    </tbody>
                </table> 
                </div>

             
            </form>
        </div>
        <div class="col-sm-4">
           <div class="col s12 m6 offset-m4">

                <div class="form-group" align="left">
                    <label>Total</label>
                    <input type="text" id="total" class="form-control" name="total" placeholder="total" disabled>

                </div>
                <div class="form-group" align="left">
                    <label>Pay</label>
                    <input type="text" id="pay" class="form-control" name="pay" placeholder="Pay">

                </div>
                <div class="form-group" align="left">
                    <label>Due</label>
                    <input type="text" id="due" class="form-control" name="due" placeholder="due">

                </div>
                <div class="form-group" align="left">
                    <label>Payament Status</label>
                    <select class="form-control" id="pstatus" name="pstatus">
                        <option value="">Please Select</option>
                        <option value="1">Cash</option>
                        <option value="2">Cheque</option>
                    </select>
                </div>
                <div align="right">
                    <button type="button" class="btn btn-info" id="save" onclick="AddInvoice()">Add</button>
                    <button type="button" class="btn btn-warning" id="reset" onclick="">Reset</button>
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


    <script src="http://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="../components/jquery-confirm-master/js/jquery-confirm.js"></script>
    <script src="../quagga.min.js"></script>

<script>
    var isNew = true;
    getProductcode();
    getVendor();
    
    

var sonido = new Audio("../pages/beep-06.mp3");

function startScanner() {
Quagga.init({
    inputStream: {
        name: "Live",
        type: "LiveStream",
        //target: document.querySelector('#camera')    // Or '#yourElement' (optional)
        target: document.querySelector('#camera'),
      constraints: {
                width: 380,
                height: 220,
                facingMode: "environment"
            },
        },
    frequency: 2,
    decoder: {
        readers: ["code_128_reader",
                "ean_reader",
                "ean_8_reader",
                "code_39_reader",
                "code_39_vin_reader",
                "codabar_reader",
                "upc_reader",
                "upc_e_reader",
                "i2of5_reader",
                "2of5_reader",
                "code_93_reader"]
    }
}, function (err) {
    if (err) {
        console.log(err);
        return
    }
    console.log("Initialization finished. Ready to start");
    Quagga.start();
});

Quagga.onProcessed(function(result){
    var drawingCtx = Quagga.canvas.ctx.overlay,
    drawingCanvas = Quagga.canvas.dom.overlay;
    drawingCanvas.style.width = '200';

    if(result){
        if(result.boxes){
            drawingCtx.clearRect(0,0,parseInt(drawingCanvas.getAttribute("width")),parseInt(drawingCanvas.getAttribute("height")));
            result.boxes.filter(function(box){
                return box !==result.box;
            }).forEach(function(box){
                Quagga.ImageDebug.drawPath(box,{
                    x:0,
                    y:1
                }, drawingCtx,{
                    color: "green",
                    lineWidth: 2
                
                });
            });
        }

        if(result.box){
            Quagga.ImageDebug.drawPath(result.box,{
                x:0,
                y:1
            },drawingCtx,{
                color:"#00F",
                lineWidth:2
            });
        }

        if(result.codeResult && result.codeResult.code){
            Quagga.ImageDebug.drawPath(result.line,{
                x:'x',
                y:'y'
            },drawingCtx,{
                color:'red',
                lineWidth:3
          });
        }
    }
});
//-------
Quagga.onDetected(function (data) {
    sonido.play();
   // alertify.success(''+ data.codeResult.code);
    console.log(data.codeResult.code);
    var codigo = data.codeResult.code;
    document.getElementById('procode').value = codigo;
});
}

//-------
var video = document.getElementById("videocamera");
var button = document.getElementById("btn");
button.addEventListener("click", function () {
//  if (_scannerIsRunning) {
//           Quagga.stop();
//            Quagga.closed();
    //}

    
    var container = document.getElementById("camera");
    if(video.style.display === "none"){
        video.style.display = "block";
    }
    if(container.style.display === "none"){
        container.style.display = "block";
        startScanner();


    }else{
        container.style.display ="none";
        
        Quagga.stop();
    }
});

//------------------------------------------------------//
    function getProductcode()
    {
        $("#procode").keyup(function(e){
            $.ajax({
                type: "POST",
                url: '../php/product/get_product.php',
                dataType: "JSON",
                data: {procode: $("#procode").val() },
                
                success: function(data)
                {
                    console.log(data);

                    $("#proname").val(data[0].product_name);
                    $("#price").val(data[0].price_retail);
                    $("#qty").focus();
                },

                error: function()
                {

                }
            });

        });
    }

    $(function(){
        $("#price, #qty").on("keydown keyup click",qty);

        function qty()
        {
            var sum = (Number($("#price").val()) * Number ($("#qty").val()));

            $('#tot_cost').val(sum);    
        }
    });

    function getVendor()
    {

        $.ajax({
                type: "GET",
                url: '../php/vendor/get_vendor.php',
                dataType: "JSON",
                
                
                success: function(data)
                {
                    console.log(data);

                    for(var i = 0; i< data.length; i++)
                    {
                        $('#vendor').append($("<option/>",{

                            value: data[i].vendor_id,
                            text: data[i].vname,
                        }));
                    }


                },

                error: function()
                {

                }
            });
    }


    function addproduct()
    {
        var product = {
            procode: $("#procode").val(),
            proname: $("#proname").val(),
            price: $("#price").val(),
            qty: $("#qty").val(),
            tot_cost: $("#tot_cost").val(),

        };
        addRow(product);
        $("#frmProduct")[0].reset();
    }

    var total = 0;

    function addRow(product)
    {
        if($('#procode').val().length == 0)
        {
            $.alert({
                title: 'Error',
                content: "Please Enter the Code",
                type: 'red',
                autoClose: 'ok|2000'
            });
        }
        else if(!$('#vendor').val())
        {
            $.alert({
                title: 'Error',
                content: "Please Select the Vendor",
                type: 'red',
                autoClose: 'ok|2000'
            });
        }
        else {

            $.ajax({
                type: "POST",
                url: '../php/product/qty_in.php',
                dataType: "JSON",
                data: {qty : $("#qty").val(), procode: $("#procode").val()},
                
                success: function(data)
                {
                    console.log(data);

                    


                },

                error: function()
                {

                }
            });


            var $tableB = $("#productlist tbody");
            var $row = $(
                "<tr>"+
                "<td> <button type='button' name='record' class='btn btn-warning btn-xs' onclick='deleterow(this)'>Delete</td>" +
                "<td>"+ product.procode + "</td>" +
                "<td>"+ product.proname + "</td>" +
                "<td>"+ product.price + "</td>" +
                "<td>"+ product.qty + "</td>" +
                "<td>"+ product.tot_cost + "</td>" +
                "</tr>"
            );

            $row.data("procode",product.procode);
            $row.data("proname",product.proname);
            $row.data("price",product.price);
            $row.data("qty",product.qty);
            $row.data("tot_cost",product.tot_cost);

            $tableB.append($row);
            total += Number(product.tot_cost);
            $('#total').val(total);
        }
    }

    var product_total_cost;

    function deleterow(e)
    {
        $.ajax({
                type: "POST",
                url: '../php/product/qty_de.php',
                dataType: "JSON",
                data:{
                    qty: parseInt($(e).parent().parent().find('td:nth-child(5)').text(),10),
                    procode: parseInt($(e).parent().parent().find('td:nth-child(2)').text(),10)
                    },
                success: function(data)
                {
                    console.log(data);

                    


                },

                error: function()
                {

                }
            });


        product_total_cost = parseInt($(e).parent().parent().find('td:last').text(),10);
        
        total -= product_total_cost;

        $('#total').val(total);

        $(e).parent().parent().remove();

    }

    $(function(){
        $("#total, #pay").on("keydown keyup",total);

        function total()
        {
            var sum = (Number($("#total").val()) - Number ($("#pay").val()));

            $('#due').val(sum);    
        }
    });

    function AddInvoice()
    {
        var table_data = [];

        $('#productlist tbody tr').each(function(row,tr)
        {
            var sub = {
                        'procode': $(tr).find('td:eq(1)').text(),
                        'pname': $(tr).find('td:eq(2)').text(),
                        'price': $(tr).find('td:eq(3)').text(),
                        'qty': $(tr).find('td:eq(4)').text(),
                        'total_cost': $(tr).find('td:eq(5)').text(),
            };
            table_data.push(sub);
        });



        $.ajax({
            type: "POST",
            url: "../php/product/add_purchase.php",
            dataType: 'JSON',
            data: {vendor: $('#vendor').val(),total: $('#total').val(), pay: $('#pay').val(), due: $('#due').val(), pstatus: $('#pstatus').val(), data: table_data},

            success: function(data)
            {
                var msg;

                if(isNew)
                {
                    msg = "purchase Completed"
                }

                $.alert({
                    title: 'Success',
                    content: msg,
                    type: 'Green',
                    autoClose: 'ok|2000'
                });


                last_id = data.last_id

                window.location = "print.php? last_id=" + last_id;

            },
            error: function (xhr, status, error){

                console.log(xhr.responseText);
            }
        });



    }
    
</script>

</body>

</html>