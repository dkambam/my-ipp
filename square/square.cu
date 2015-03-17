/*
Demo: CUDA program to compute the squares of the first N natural numners
*/

#include <stdio.h>
typedef float data_t;  // makes it easy to change type later

__global__ void square(data_t *d_in, data_t *d_out); 	// kernel function
														// note the use of __global__
void printArray( data_t a[], int num_elements );


int main(){
	const int num_elements = 64; 
	int block_size = sizeof(d_in) * num_elements;

	// set-up sample data to beb procesed 
	data_t h_in[num_elements];
	for ( int idx=0; idx < num_elements; idx++ )
		h_in[idx] = idx;

	// define device data pointers
	data_t *d_in = NULL;
	data_t *d_out = NULL;

	// allocate device memory
	cudaMalloc( (void **) &d_in, block_size );
	cudaMalloc( (void **) &d_out, block_size );

	// transfer data to device memory
	cudaMemcpy( d_in, h_in, block_size, cudaMemcpyHostToDevice );

	// launch kernel
	square <<< 1, num_elements >>> (d_in, d_out);

	// retrieve data from device memory
	data_t h_out[num_elements];
	cudaMemcpy( h_out, d_out, block_size, cudaMemcpyDeviceToHost );

	// free device memory
	cudaFree( d_in );
	cudaFree( d_out );

	// display results
	printArray( h_out, num_elements );
}


// kernel definition
__global__ void square(data_t *d_in, data_t *d_out){
	int t_idx = threadIdx.x; // get thread id 
	d_out[t_idx] = d_in[t_idx] * d_in[t_idx];
}

void printArray( data_t a[], int num_elements ){
	for( int idx = 0; idx < num_elements; idx++ )
		printf("%5.1f%c", a[idx], ((idx % 4) != 3) ? '\t' : '\n');
	printf("\n");
}
