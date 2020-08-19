<?php
session_start();
if($_SESSION["logedUser"]==null)
{
 header( "refresh:0;url=index.php" );
}

$_SESSION["selectedD"]="0";
$_SESSION["reLoad"]=false;

date_default_timezone_set('Asia/Kolkata'); 

$HourNow=date("H");
if($HourNow>=0&&$HourNow<2)
{
    $currentSlot="A";
    
}
elseif ($HourNow>=2&&$HourNow<4) {
   $currentSlot="B";
}
elseif ($HourNow>=4&&$HourNow<6) {
   $currentSlot="C";
}
elseif ($HourNow>=6&&$HourNow<8) {
   $currentSlot="D";
}
elseif ($HourNow>=8&&$HourNow<=10) {
   $currentSlot="E";
}
elseif ($HourNow>=10&&$HourNow<12) {
   $currentSlot="F";
}
elseif ($HourNow>=12&&$HourNow<14) {
   $currentSlot="G";
}
elseif ($HourNow>=14&&$HourNow<16) {
   $currentSlot="H";
}
elseif ($HourNow>=16&&$HourNow<18) {
   $currentSlot="I";
}
elseif ($HourNow>=18&&$HourNow<20) {
   $currentSlot="J";
}
elseif ($HourNow>=20&&$HourNow<22) {
   $currentSlot="K";
}
elseif ($HourNow>=22&&$HourNow<=23) {
   $currentSlot="L";
}


$TodayDate=date("Y-m-d");


?>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Femto Details-Nokia</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS
        ============================================ -->
        <link rel="stylesheet" href="bootstrap.min.css">

    <!-- normalize CSS
        ============================================ -->
        <link rel="stylesheet" href="bootstrap-table.css">

         <!-- jquery
            ============================================ -->
            <script src="jquery-1.11.3.min.js"></script>
    <!-- bootstrap JS
        ============================================ -->
        <script src="bootstrap.min.js"></script>
        
		
		<!-- favicon
        ============================================ -->
        <link rel="shortcut icon" type="image/x-icon" href="images/nokia_icon.png">
    <!-- Google Fonts
        ============================================ -->
        <link href="https://fonts.googleapis.com/css?family=Play:400,700" rel="stylesheet">
    
    <!-- data table JS
        ============================================ -->
        <script src="bootstrap-table.js"></script>
        <script src="tableExport.js"></script>
        <script src="data-table-active.js"></script>
        <script src="bootstrap-table-editable.js"></script>
        <script src="bootstrap-editable.js"></script>
        <script src="bootstrap-table-resizable.js"></script>
        <script src="colResizable-1.5.source.js"></script>
        <script src="bootstrap-table-export.js"></script>
        


    </head>

    <body>
        <form method="post">
            <nav class="navbar navbar-default">
              <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#"><img class="main-logo" src="images/nokialogo.png" height="30px" alt="" /></a>
                </div>
                <ul class="nav navbar-nav">
                  <li class="active"><a href="femtoSelection.php">Home</a></li>
                  <li><a href="mybookings.php">My Bookings</a></li>
                  <li><a href="index.php">Logout</a></li>
              </ul>
          </div>
      </nav>
      <div class="left-sidebar-pro">
      </div>
      <div class="data-table-area mg-tb-15">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="sparkline13-list">
                        <div class="sparkline13-hd">
                            <div class="main-sparkline13-hd">
                                <h1>Select<span class="table-project-n"> Your</span> Femto</h1>
                            </div>
                        </div>
                        <div class="sparkline13-graph">
                            <div class="datatable-dashv1-list custom-datatable-overright">

                                <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
                                data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
                                <thead>
                                    <tr>
                                        <th data-field="state" data-checkbox="true"></th>
                                        <th data-field="sl">Sl</th>
                                        <th data-field="ip" data-editable="false">Femto IP</th>
                                        <th data-field="type" data-editable="false">Femto Type</th>
                                        <th data-field="mac" data-editable="false">MAC</th>
                                        <th data-field="fsn" data-editable="false">FSN</th>
                                        <th data-field="vendor" data-editable="false">Vendor</th>
                                        <th data-field="varient" data-editable="false">Varient</th>
                                        <th data-field="currentUser" data-editable="false">Current User</th>
                                        <th data-field="">Action</th>
                                    </tr>
                                </thead>
                                <tbody>


                                 <?php
                                 $u="KI";
                                 include('connection.php');
                                 if (!$con or !mysqli_select_db($con,'femtoaccess')) 
                                 {
                                 }
                                 else
                                 {

                                    $sql = "SELECT * FROM femtodetails ORDER BY FSN";
                                    $result = $con->query($sql);

                                    if ($result->num_rows > 0)
                                    {
                                        $sl=1;

                                        while($row = $result->fetch_assoc())
                                        {

                                            echo "<tr>";
                                            echo "<td></td>";
                                            echo "<td>".$sl."</td>";
                                            echo "<td>".$row["femtoIP"]."</td>";
                                            echo "<td>".$row["femtoType"]."</td>";
                                            echo "<td>".$row["MAC"]."</td>";
                                            echo "<td>".$row["FSN"]."</td>";
                                            echo "<td>".$row["vendor"]."</td>";
                                            echo "<td>".$row["varient"]."</td>";


                                            $sql2 = "SELECT userID FROM femtobookings WHERE bookingdate='$TodayDate' AND femtoFSN='$row[FSN]' AND slot LIKE '%$currentSlot%'";

                                            $result2 = $con->query($sql2);

                                            if ($result2->num_rows > 0)
                                            {

                                                while($row2 = $result2->fetch_assoc())
                                                {
                                                    $value=$row2["userID"];
                                                }
                                            }
                                            else
                                            {
                                                $value="Available Now";
                                            }




                                              //$d=date("d/m/Y");
                                            echo "<td>".$value."</td>";

                                            echo "<td><a class='btn btn-lg' href='sessionAdder.php?femtoIP=".$row['femtoIP']." &femtoFSN=".$row['FSN']."&style='margin-right:16px'> Book </a></td>";
                                            echo "</tr>";
                                            $sl++;


                                        }

                                    }
                                    else
                                    {
                                        echo "0 results";
                                    }



                                }


                                ?>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<!-- Static Table End -->

</div>



</form>
</body>

</html>


