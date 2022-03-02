<?php
$input = "1,2,3,4,5,6,7";
$input_conver=explode(',', $input);
$sum=0;
foreach($input_conver as $val)
{
    $sum+=$val;
}
echo " The SUM of converted string to array is = " .$sum;
?>
