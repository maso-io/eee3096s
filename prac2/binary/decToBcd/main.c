#include <stdio.h>  
#include <stdint.h>

uint8_t decToBcd_2(int val);
int decToBcd(int val);

int main()
{
    printf("Binary number = %lld\n", decToBcd(9));
    printf("Binary number = %u\n", decToBcd_2(9));
}

int decToBcd(int val)
{
    /* Convert normal decimal numbers to binary coded decimal*/
	//TO DO:
	//TASK 3
	long long decimal, tempDecimal, binary;
	//YOUR CODE HERE
	int rem, place = 1;
	binary = 0; 
	/* 
	 * Reads input decimal number from user 
	 */    
	decimal = val;
	tempDecimal = decimal;  

	/* 
	 * Converts the decimal number to binary number 
	 */  
	while(tempDecimal!=0)  
	{  
		rem = tempDecimal % 2;  

		binary = (rem * place) + binary;  

		tempDecimal /= 2;  
		place *= 10;  
	}
	return binary;
}

// Convert normal decimal numbers to binary coded decimal
uint8_t decToBcd_2(int val)
{
  return (uint8_t)( (val/10*16) + (val%10) );
}