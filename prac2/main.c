#include <stdio.h>
// array to store binary number
int binaryNum[8];
int bN[8];
  
int main()
{
void decToBinary(int n)
{

    // counter for binary array
    int i = 0;
    int j = 0;
    while (n > 0) {
        // storing remainder in binary array
        binaryNum[i] = n % 2;
        n = n / 2;
        i++;
    }
    // printing binary array in reverse order
    for (int j = 0; j < 8; j++)
    {
        printf("%d", binaryNum[j]);
        bN [j] = binaryNum[i];
        i = i - 1 ;
    }
}
decToBinary(4);
// display array
for(int x=0; x<8; x++) 
{
  printf("%d ", bN[x]);
}

return 0;
}