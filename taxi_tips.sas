libname taxi "";

data tax / view=tax;
   label tip_pct = "Tip Percent";
   set taxi.ny_taxi_data_2015_01;
   where 0 < fare_amount <= 100 & 0 <= tip_amount <= 100;
   total_bill = total_amount - tip_amount ;
   tip_pct = tip_amount  / total_bill;
   keep fare_amount tip_amount tip_pct total_bill;
run;

title "Tip as Percentage of Total Fare";
proc means data=tax P40 P50 P75 P90 P95 P99;
   var tip_pct;
run;