sum=0 #Initialize to zero
num=6 #Total number of iterations ran for esxtop with -n option
for i in `cat temp` ;do
sum=`echo $sum + $i | bc`
done

echo  "Average of the host cpu is ` printf %.2f $( bc -l <<< $sum/$num) ` " | tee -a $OUT #Average the iterations
