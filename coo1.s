.data
list:  .word  3,0,1,2,6,2,4,7,3,7
.text
main:
la    $s3,list
addi    $s5,$s5,4
lw    $s4,16($s3)
addi	$s1,$s0,5
for:
add    $s2,$s2,$s1
beq    $s1,$s0,l1
addi    $s1,$s1,-1
j    for
stop
l1:
addi    $s6,$s2,20