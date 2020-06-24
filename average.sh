sum=0 #Initialize to zero
num=6 #Total number of iterations ran for esxtop with -n option
for i in `cat temp` ;do
sum=`echo $sum + $i | bc`
done

#Comment the lines below if hyper threading is disabled in the machine
echo  "Average of the host cpu PCPU Util is ` printf %.2f $( bc -l <<< $sum/$num) ` " | tee -a $OUT #Average the iterations
sum=0
for i in `cat temp1` ;do
sum=`echo $sum + $i | bc`
done
echo  "Average of the host cpu PCPU Used is ` printf %.2f $( bc -l <<< $sum/$num) ` " | tee -a $OUT #Average the iterations

