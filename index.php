<?php

class Stats

{

    public static function databse()
    {
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "risenet";
        return $conn = mysqli_connect($servername, $username, $password, $dbname);
    }

    public static function dateFormat($date)
    {
        return $date = date("Y-m-d", strtotime($date));
    }

    public static function debug($data)
    {
        echo '<pre>' . json_encode($data, JSON_PRETTY_PRINT) . '</pre>';
    }


    public static function table($planes, $female, $male)
    {
        echo "<table border = 1>";

        echo  "<td>Plane</td><td>Female Avg Age</td><td>Male Avg Age</td>";
        foreach ($planes as $plane) {
            echo "<tr>";
            echo "<td>" . $plane['name'] . "</td>";
            echo "<td>";
            $p = 0;
            foreach ($female as $f) {
                if ($f['name'] == $plane['name'])
                {
                    echo $f['Female Avg Age'];
                    $p++;
                    break;
                }
            }
            if($p==0) echo "-1";
            echo "</td>";
            $p=0;
            echo "<td>";
            $p = 0;
            foreach ($male as $m) {
                if ($m['name'] == $plane['name'])
                {
                    echo $m['Male Avg Age'];
                    $p++;
                    break;
                }
            }
            if($p==0) echo "-1";
            echo "</td>";
            echo "<tr>";
        }
    }

    public static function show_statistics($pytanie)
    {
        $pytanie = strrev($pytanie);
        $warunki = explode(";", $pytanie);

        $age = $warunki[0];
        $znak = substr($warunki[1], 4, 1);
        $date = substr($warunki[1], 5, strlen($warunki[1]));
        $date = self::dateFormat($date);


        $planesQuery = "SELECT * FROM planes WHERE flight_date" . $znak . $date;
        $femaleQuery = "SELECT planes.name, AVG(passengers.age) AS \"Female Avg Age\"  FROM passengers JOIN planes ON passengers.plane_id = planes.id WHERE " . $age . " AND planes.flight_date " . $znak . $date . " AND passengers.sex = \"f\" GROUP BY planes.id";
        $maleQuery = "SELECT planes.name, AVG(passengers.age) AS \"Male Avg Age\"  FROM passengers JOIN planes ON passengers.plane_id = planes.id WHERE " . $age . " AND planes.flight_date " . $znak . $date . " AND passengers.sex = \"m\" GROUP BY planes.id";

        $connect = self::databse();

        $planes = mysqli_query($connect, $planesQuery);
        $female = mysqli_query($connect, $femaleQuery);
        $male = mysqli_query($connect, $maleQuery);

        self::table($planes, $female, $male);

    }

}


Stats::show_statistics("1102.III.1>etad;53<ega");
