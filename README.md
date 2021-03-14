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
  
  
  
  //////////////////////////////////////////////////////////////////////////////
  contributions:
        
  
  
  
  
  
  
