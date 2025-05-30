#ifndef __OPTION_H__
#define __OPTION_H__
// guide for the user to choose an option

typedef enum {
    SPENDING,
    INCOME,
    TRADE,
    BALANCE,
    QUIT
}Option;

/**
 * @brief print option for naviguate in the app
 * 
 */
void print_option();


/**
 * @brief ask what option the user choose 
 * 
 * @return Option 
 */
Option get_option();


/**
 * @brief redirect with a switch  
 * 
 * @param op 
 */
void manage_option(Option op);











#endif
