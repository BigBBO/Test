#include <iostream>
#include <unistd.h>

int main(void){

  while (1)
  {
    std::cout << "Hello World" << std::endl;
    sleep(2);
  }
  
    return 0;
}