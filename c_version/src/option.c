#include "../include/option.h"
#include <stdio.h>


void print_option(){
    printf("1) add a spending \n2) add an income \n3) print recent trade \n4) print actual balance\n5) quit\n");
}

Option get_option(){
    int choice;
    printf("make your choice : ");
    scanf("%d",&choice);
    switch(choice){
        case 1:
            return SPENDING;
        case 2:
            return INCOME;
        case 3:
            return TRADE;
        case 4: 
            return BALANCE;
        case 5:
            return QUIT;
    }

}



