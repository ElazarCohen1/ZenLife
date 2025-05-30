#ifndef __SPENDING_H__
#define __SPENDING_H__
#include <stdio.h>
#include "categorie.h"

typedef struct {
    int day; // between 1 and 31
    int month; // between 1 and 12
    int annee; // between 2000 and 2025
}Date;

/**
 * @brief 
 * @note it can be a spending or an income
 * 
 */
typedef struct _spending{
    char description[256]; // the description of the spending 
    Date date; 
    float price; 
    Categorie Categorie; 
}Spending,Income;


/**
 * @brief initialize a spending
 * 
 * @param s 
 * @param description 
 * @param date 
 * @param price 
 * @param Categorie 
 */
Spending* init_spending(const char* description, Date date, float price, Categorie Categorie);


/**
 * @brief Get the income from a file 
 * 
 * @param i 
 */
void get_income_from_file(FILE* file ,Income* i);


#endif
