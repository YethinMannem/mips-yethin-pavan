.data
array:  .word  10,20
.text
main:     
addi     $s1,$s1,5
for:
beq     $s1,$s3,lab1
addi    $s1,$s1,-1
j    for
lab1:
addi    $s6,$s1,10