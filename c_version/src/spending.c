#include "../include/spending.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>


Spending* init_spending(const char* description, Date date, float price, Categorie Categorie){
    Spending* s = (Spending*)malloc(sizeof(Spending));
    if (description == NULL) {
        fprintf(stderr, "Error: Null pointer passed to init_spending.\n");
        return NULL;
    }
    
    strncpy(s->description, description, sizeof(s->description) - 1);
    s->description[sizeof(s->description) - 1] = '\0'; // Ensure null termination
    s->date = date;
    s->price = price;
    s->Categorie = Categorie;
    return s;
}


