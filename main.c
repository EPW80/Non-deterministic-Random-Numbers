// Author information
//   Author name : Erik Williams
//   Author email: epwilliams@csu.fullerton.edu
//   Author section: 240-9

#include "stdio.h"
extern char *executive();

int main() {
    printf("Welcome to Random Products, LLC.\n");
    printf("This software is maintained by Erik Williams\n\n");

    char *result = executive();

    printf("\nOh, %s. We hope you enjoyed your arrays. Do come again.\n", result);
    printf("A zero will be returned to the operating system.\n");

    return 0;
}