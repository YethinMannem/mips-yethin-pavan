# **MIPS Simulator with Pipelining, Forwarding, and Two-Level Cache**

## **Overview**
This project implements a **MIPS simulator** with the following features:
- **Five-stage Pipelining** (Instruction Fetch, Decode, Execute, Memory, Write-back)
- **Data Forwarding** for reducing stalls
- **Two-Level Cache (L1 & L2)** for optimized memory access
- **Configurable Cache Parameters** (Cache Size, Block Size, Associativity, Latency)

## **Inputs**
Users need to input the following parameters for both **L1 and L2 caches**:
- **Cache Size** (in bytes)
- **Block Size** (in bytes)
- **Associativity** (Direct-mapped, 2-way, 4-way, etc.)
- **Latency** (Access time in cycles)

---

## **Cache Design**
### **1. Structure of Cache**
Each cache consists of:
- **Sets** → Contain multiple blocks.
- **Blocks** → Contain:
  - **Tag** → Identifies memory block.
  - **Data** → Stores data elements.
  - **Dirty Bit** → Indicates if data is modified.
  - **LRU Counter** → Tracks least recently used block.

### **2. Cache Calculations**
- **Number of Sets** = `Cache Size / (Block Size × Associativity)`
- **Number of Blocks per Set** = `Associativity`
- **Number of Data Elements per Block** = `Block Size`
- **Index Bits** = `log2(Number of Sets)`
- **Offset Bits** = `log2(Block Size)`
- **Tag Bits** = `Remaining bits from memory address`

---

## **Cache Initialization**
- All blocks are initialized with:
  - **Tag = NULL**
  - **Data = -1000000 (invalid value)**
  - **Dirty Bit = 0**

---

## **Address Breakdown**
When executing **`lw` (load word)** and **`sw` (store word)** instructions, the memory address is split into three parts:
- **Tag** → Identifies the block in memory.
- **Index** → Selects the set in cache.
- **Offset** → Locates the specific data element within a block.

---

## **Cache Lookup Process**
### **Step 1: Extract Address Fields**
1. Use **Index** to locate a specific **Set**.
2. Use **Tag** to search within the blocks of that **Set**.
3. Use **Offset** to locate a specific data element inside a block.

---

## **Cache Hit & Miss Cases**
### **1. Found in L1 Cache (L1 Cache Hit)**
- **For `lw`**: Fetch the required data element.
- **For `sw`**: Update the data element and set the **dirty bit to 1**.

### **2. Not Found in L1, Found in L2 (L2 Cache Hit)**
- **For `lw`**: Fetch data from L2 and move it to L1.
- **For `sw`**: Update data in L2, set **dirty bit to 1**, and also move data to L1.
- **Handling L1 Replacement:**
  - If **empty space exists**, insert data into L1.
  - If **L1 is full**, apply **LRU (Least Recently Used) replacement**.
  - If the replaced block **exists in L2**, update **data, dirty bit, and LRU counter**.

### **3. Not Found in L1 and L2 (Miss in Both Caches)**
- **Handling L1 Miss:**
  1. If space is available, insert the block.
  2. If L1 is full, apply **LRU replacement**.
- **Handling L2 Miss:**
  1. If space is available, insert the block.
  2. If L2 is full, apply **LRU replacement**.
- **Check if the replaced block is in L1** and update it accordingly.

---

## **Hit Rate Calculation**
The **cache hit rate** is calculated using:
```
Hit Rate = (Number of Hits) / (Total lw/sw Instructions)
```

---

## **Limitations**
- **Caches must have the same block size** to avoid complexity in block transfers between L1 and L2.
- **Different block sizes** require additional logic to handle replacement scenarios where **partial blocks** must be checked.

---

## **Example Input Format**
User needs to enter:
```
Enter L1 Cache Size (in bytes): 4096
Enter L1 Block Size (in bytes): 64
Enter L1 Associativity: 2
Enter L2 Cache Size (in bytes): 16384
Enter L2 Block Size (in bytes): 64
Enter L2 Associativity: 4
```

---

## **Final Thoughts**
This **MIPS simulator** efficiently handles:
- **Pipelining with Forwarding** to reduce stalls.
- **Two-Level Caching** with **configurable** parameters.
- **LRU Policy** for cache block replacement.
- **Hit Rate Tracking** to evaluate performance.

Would you like an **example run-through** with **debugging information and execution flow diagrams?** 🚀

