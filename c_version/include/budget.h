#ifndef __BUDGET_H__
#define __BUDGET_H__
#include "spending.h"


typedef struct {
    Spending* spendings; // Array of spendings
    int size;            // Number of spendings
    float total;        // Total budget
} Budget;

/**
 * @brief initialize a budget with a given total
 * 
 * @param b 
 * @param total 
 */
void init_budget(Budget* b);


/**
 * @brief append a new spending/income to the budget
 * 
 * @param b 
 * @param new_spending 
 */
void append_spending(Budget* b, Spending new_spending);

/**
 * @brief calculate the total of all spendings in the budget
 * 
 * @param b 
 * @return float 
 */
float calculate_total(Budget* b);

/**
 * @brief calculate the total of all spendings in the budget by category
 * 
 * @param b 
 * @param category 
 * @return float 
 */
float calculate_total_by_category(Budget* b, Categorie category);



/**
 * @brief free the memory allocated for the budget
 * 
 * @param b 
 */
void free_budget(Budget* b);

/**
 * @brief print the budget
 * 
 * @param b 
 */
void print_budget(Budget* b);

/**
 * @brief print the budget by category
 * 
 * @param b 
 */
void print_budget_by_category(Budget* b);


/**
 * @brief save the budget to a file
 * 
 * @param b 
 * @param filename 
 */
void save_budget_to_file(Budget* b, const char* filename);

/**
 * @brief load the budget from a file
 * 
 * @param b 
 * @param filename 
 * @return int 0 if success, -1 if error
 */

int load_budget_from_file(Budget* b, const char* filename);

/**
 * @brief get the remaining budget
 * 
 * @param b 
 * @return float 
 */

float get_remaining_budget(Budget* b);





#endif 
