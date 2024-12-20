<html>

<head>
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">

    <link rel="stylesheet" type="text/css" href="../components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../components/bootstrap/dist/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../components/jquery-confirm-master/css/jquery-confirm.css">
    <link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
</head>

<body>

<?php include ("../header.php") ?>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12">
            <form id="frmvendor">
                <div>
                    <h3>Vendor</h3>
                    </br>

                    <div class="row">
                        <div class="col-sm-6 col-sm-3">
                            <div class="form-group" align="left">
                                <label>Vendor Name</label>
                                <input type="text" id="vendorname" class="form-control" name="vendorname" placeholder="VendorName" required>

                            </div>
                        </div>
                        <div class="col-sm-6 col-sm-3">
                            <div class="form-group" align="left">
                                <label>Contact No</label>
                                <input type="text" id="contactno" class="form-control" name="contactno" placeholder="ContactNo" required>

                            </div>
                        </div>
                        <div class="col-sm-6 col-sm-3">
                            <div class="form-group" align="left">
                                <label>E-mail</label>
                                <input type="text" id="email" class="form-control" name="email" placeholder="Email" required>

                            </div>
                        </div>
                        <div class="col-sm-6 col-sm-3">
                            <div class="form-group" align="left">
                                <label>Address</label>
                                <input type="text" id="address" class="form-control" name="address" placeholder="Address" required>

                            </div>
                        </div>  
                        <div class="col-sm-6 col-sm-3">
                            <div class="form-group" align="left">
                                <label>Status</label>
                                    <select class="form-control" id="status" name="status">
                                        <option value="">Please Select</option>
                                        <option value="1">Active</option>
                                        <option value="2">DeActive</option>
                                    </select>
                            </div>
                        </div> 
                    </div>
                    <div align="right">
                            <button type="button" class="btn btn-info" id="save" onclick="AddVendor()">Add</button>
                            <button type="button" class="btn btn-warning" id="reset" onclick="">Reset</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="col-sm-12">
        <div class="col s12 m6 offset-m4">
            <div class="panel-body">
                <table id="tbl-vendor" class="table table-responsive table-bordered" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>  
                        </tr>
                    </thead>
                </table>
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


get_all();

//--------------------------------------------------------//
    var Isnew = true;
    var vendor_id = null;

    $('.frmvendor').on('click',function(){
        this.form.reset();
    });

    function AddVendor()
    {
        if($("#frmvendor").valid())
        {
            var _url = '';
            var _data = '';
            var _method;
        }else{

        }
            if (Isnew == true)
            {
                _url = '../php/vendor/add_vendor.php';
                _data = $("#frmvendor").serialize();
                _method = 'POST';
            }
            else
            {
                _url = '../php/vendor/update_vendor.php';
                _data = $("#frmvendor").serialize() + "&vendor_id=" + vendor_id;
                _method = 'POST';
            }

            $.ajax({
                type : "POST",
                data : _data,
                url : _url,
                dataType : 'JSON',

                success : function(data){
                   // get_all();
                    var msg;


                   if(Isnew)
                    {
                        msg = "Vendor Created";
                    }
                    else
                    {
                        msg = "Vendor Updated";
                  
                    }

                    $.alert({
                            title: 'Success!',
                            content: msg,
                            type: 'GREEN',
                            boxWidth: '400px',
                            theme: 'light',
                            useBootstrap: false,
                            autoClose: 'ok|2000'
                        });
                },
                 error: function (xhr, status, error){
                    alert(xhr);
                    console.log(xhr.responseText);

                    $.alert({
                        title: 'Fail!',
                        type: 'red',
                        autoClose: 'ok|2000'
                    });
                    $('#save').prop('disabled', false);
                    $('#save').html('');
                    $('#save').append('Save');
                }
            });
    }   

//-------------------------------------------------------------
    function get_all()
    {
        $('#tbl-vendor').dataTable().fnDestroy();
        $.ajax({
            url: "../php/vendor/all_vendor.php",
            type: "GET",
            dataType:"JSON",

            success:function(data){
                $('#tbl-vendor').dataTable({
                    "aaData":data,
                    "scrollX":true,

                    "aoColumns":[
                        {"sTitle": "Vendor Name", "mData":"vname"},
                        {"sTitle": "Contact No", "mData":"contactno"},
                        {"sTitle": "E-mail", "mData":"email"},
                        {"sTitle": "Address", "mData":"address"},
                        
                        {
                            "sTitle": "Status", "mData": "status", "render":function(mData, type, row, meta){
                                if(mData == 1){
                                    return '<span class="label label-info">Active</span>';
                                }
                                else if (mData == 2) {
                                    return '<span class="label label-warning">Deactive</span>';
                                }
                            }
                        },
                        {
                            "sTitle": "Edit",
                            "mData": "vendor_id",
                            "render":function(mData, type, row, meta){

                                return '<button class="btn btn-xs btn-success" onclick="get_vendor_details(' + mData + ')">Edit</button>'; 
                            }
                        },
                        {
                            "sTitle":"Delete",
                            "mData":"vendor_id",
                            "render":function(mData, type, row, meta){
                                return '<button class="btn btn-xs btn-primary" onclick="Removevendor(' + mData + ')">Delete</button>';
                            }
                        }
                    ]
                });
            },

            error:function(xhr){
                console.log('Request Status: ' + xhr.status);
                console.log('Status Text: ' + xhr.statusText);
                console.log(xhr.responseText);
                var text = $($.parseHTML(xhr.responseText)).filter('.trace-message').text();
            }
        });
    }
//------------------------------------------------------------------
    function get_vendor_details(id)
    {
        $.ajax({
            type : 'POST',
            url : '../php/vendor/edit_return.php',
            dataType : 'JSON',
            data : {vendor_id:id},

            success : function(data)
            {
                $("html, body").animate({scrollTop: 0}, "slow");
                Isnew = false
                vendor_id = data.vendor_id
                $('#vendorname').val(data.vname);
                $('#contactno').val(data.contactno);
                $('#email').val(data.email);
                $('#address').val(data.address);
                $('#status').val(data.status);

            //    $('#frmCategory').modal('show');
            },
            error: function (xhr, status, error){

                alert(xhr.responseText);
            }
        });
    }

//-------------------------------------------------------------------------
function Removevendor(id)
{
    $.confirm({
        theme : 'supervan',
        buttons: 
        {
            yes:function()
            {
                $.ajax({
                    type:'POST',
                    url: '../php/vendor/remove_vendor.php',
                    dataType: 'JSON',
                    data: {vendor_id:id},

                    success : function(data)
                    {
                        get_all();
                    },

                    error: function (xhr, status, error){

                        alert(xhr.responseText);

                    }
                });
            },

            no:function()
            {

            }
        }
    });

}
    
</script>

</body>

</html>