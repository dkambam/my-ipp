### Overview
A simple CUDA demo


### key-points
+ ```__global__``` decl-specifier
+ ```cudaMalloc```
+ ```cudaMemcpy```
+ launch kernel operator
```kernel_name <<< n_blocks, block_size >>>```
+ ```cudaFree```


### issues
+ data_t coupled to printf in printArray
