///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////cs19b026   cs19b017
pipelining implementation
at start the user need to enter whether he need data forwarding or not
without dataforwarding
here we have 5 stages

if(instruction fetch)
idrf(instruction decode register fetch)
execute(instruction execute)
mem (memory accessing)
write back(updating register based on operation)

if:-  here the pcis incremented and we take the particular instruction from the program
idrf:-  As from the above we get the instructionhere we get to know the type of instruction , thre registers involved in it, the type of operation,and its dependency with the before registers
exe:- Hre as from the above stage we get the type of operation we execute the operation on the registers
mem :- in case if the instrction is lw sw which we need toacces the memory 
wb:- At this stage we update the registers

Dependency cases:
this we have done it in is_there_hazard section
AS here the dataforwarding is not enabled
For the first instruction as we dont have previous ones we dont have any stalls
if it is second instruction:-
if the source registers of thisinstruction depends on the above instruction we get 3 stalls as the registers get updated after wb stage
ifit is third instruction:-
check for the immmediate above instruction for dependency(3 stalls) if ther is none 
then go to the above one and check for dependency(2 stallsif prs_src's != prev_src's)else we have 0 stalls
else 
similarly we checkupto above 3 instructions
If it is branch instruction we get extra 2 stalls as the correct destination isknown after the execution stage of instruction in this implementattion

with data forwarding
if it is first instruction no stalls
if it is second instruction:-  check dependency with the above instruction if dependent:- if it is lw or sw (as we get the required value after mem stage) so to do mem_wb to dec_exec we need towait 1 stall from after we will not hve stalls

lw error in sim.cpp corrected here 
