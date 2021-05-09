.data
list:  .word  3,0,1,2,8,6,4,7,3,7
.text
main: 
la  $s2,list
addi	$s1,$s1,3
for:
lw	$s7,$s4($s2)
beq     $s1,$s3,lab1
addi	$s3,$s3,1
addi	$s4,$s4,4
j	for
lab1:
addi    $s6,$s1,10
