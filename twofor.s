.data
list:  .word  3,0,1,2,8,6,4,7,3,7
.text
main: 
la  $s2,list
lw	$s1,16($s2)
addi	$t9,$t9,20
lw	$s4,$t9($s2)
for2:
beq     $s1,$s3,for1
addi    $s3,$s3,1
addi	$s5,$s5,2
j	for2
for1:
beq     $s4,$t8,lab1
addi    $t8,$t8,1
addi	$s5,$s5,2
j	for1
lab1:
addi    $s6,$s1,10