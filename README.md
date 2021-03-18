# mips-yethin-pavan

Here we tried to create a mips simulator using cpp language
in main function we read the file(asm file)
then by storing it in the vector of strings named rogram
in run function
  :set all the values to zero
  :we chech for .data and .text
  :for data segmentwe store the values in memory
  we also store the line numberand label name in a vector of struct type
  :then we call for the read instruction based on the line number
in read instruction function
  :we seperate the operation from the line
  :then check whether the operation is valid or not
  then based on the type of operation we go to valid registers and execute operation functions
in valid registers function
  :we check the validity of registers
  :and store the corresponding registers number in the 3 size array of integers
in execute operation function
  :the register values are updated here
  
  we used 32 registers
  it works for add sub mul div addi ori lw sw beq bne j la 
  add r1,r2,r3   r1=r2+r3
  sub r1,r2,r3   r1=r2-r3
  mul r1,r2,r3    r1=r2*r3      r denotes registers,v denotes constants,labels
  div r1,r2,r3    r1=r2/r3 
  addi r1,r2,v    r1=r2+v
  lw r1,v(r2)    r1=valof r2+v/4 value
  lw r2,r3(r4)
  sw r1,v(r2)    val of r2+v/4=r1
  j   label      jump to label
  beq r1,r2,label     if r1==r2 jump to label
  bne r1,r2,label      if r1!=r2 jump to label
  if it sees the stop command it exits from the code and displays the contents of registers
  
  sample code is shown in for.s and coo1.sfile 
  code should start with .data followed by datasegment if needed then on .text then main:
  //////////////////////////////////////////////////////////////////////////////
  contributions:
  discussed among us how to implement functions and in solving errors
  implemented
  cs19b017pavan sahith:- run(),read_instruction()
  cs19b027yethin:-valid register,execute present operation
        
  
  
  
  
  
  
