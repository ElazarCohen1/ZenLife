#include "../include/budget.h"
#include "../include/option.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int main(int argc, char** argv){
    Budget budget;
    init_budget(&budget); // Initialize budget with a total of 0
    int run = 1;
    while(run){
        print_option();
        Option op = get_option();
        switch(op){
            case SPENDING:
                break;
            case INCOME:
                break;
            case TRADE:
                break;
            case BALANCE:
                break;
            case QUIT:
                run = 0;
                break:   
        }
    }
}
