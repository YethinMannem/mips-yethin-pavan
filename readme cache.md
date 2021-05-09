==================== mips simulator with pipelining,forwarding and cache =======================
we implemented a 2 level cache
inputs
user need to input cache size,block size and assosciativity for both level caches
(cache->sets->blocks->data)
blocks will have dirty bit,tag,data elements
cache is mainly used to access the data fast as it will be close to the cpu
==design cache==
First we design these 2 caches based on their cache size,block size and assosciativity
number of sets in a cache = cache size/(block size * assosciativity)
number of blocks in set = assosciativity (i.e if assosciativity is 2 we will have 2 blocks in a set)
number of elements(data) = block size
each set will have a index to differentiate,block will have tag and data element will have offset
== initialising cache==
At start we initialized the tag of all blocks as "NULL" and data as -1000000
== dividing address ==
when we have instructions that need to access the memory such as lw and sw we use it.
we considered address as a string we need to divide it into 3 parts tag,index and offset
we require log2(block size) bits to represent offset
and log2(number of sets in cache) bits to represent index
the remaining bits will be for the tag
that is when we have lw or sw instructions we first check the caches and then go to the main memory
=== checking process ==
we first divide the address to tag,index and offset based on the cache
then we first use index to go to a particular set
then tag to search the blocks in that set
then use offset bits go take or change the particular data element
== cases ==

== found in level 1 cache (hit in level1 cache) ==
if instruction is lw we take the required data element
if instruction is sw we change that particular data element and make dirty bit 1

== not found in level1 , found in level2(i.e, hit in level2 cache) ==
if lw we take the data element , if sw we change that element and make dirty bit 1
we have to keep this in level1 also
2 cases 
 == if there is empty place in level1 ==
 then we can put the tag and data elements into that block
 == if there is no empty place ==
 we have to apply lru policy here
 first we have to find out the least recently used block based on the lru value
 then we can have that blocks address
 here before changing the values here chek whether the same address block is present in level2 cache 
 if it exits update the block in level2(i.e data if changed,dirty bit and lru) 
 then replace the block in level1 cache

== not found in level1 and level2 (miss in both caches) ==
to keep in level1 2 cases
1. if there is empty space we can fill that with respective tag and data elements
  == here we have 2 cases with level2==
  1. if there is an empty space in level2 cache we can fill it
  2. else
    apply lru policy to know which block to be changed
    check whether same address block is there in level1
    if there change its lru dirty and data element values and the check it in the level1 same process
2. if there is no empty space in level1 
   apply lru policy to replace and again same process as above to check 2 cases

hit rate = no of hits/no of lwsw instructions

    
 
=== limitations ==
we used caches with same block size
for different block size difference comes when relaced block to be checked in other cache this case we have to check all the address of data in the other cache

== input ==
cache size,block size,latency,assosciativity for 2 level caches
 
 
