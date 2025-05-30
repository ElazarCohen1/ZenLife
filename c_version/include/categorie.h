#ifndef __CATEGORIE_H__
#define __CATEGORIE_H__

typedef enum {
    GROCERIES,        // Courses alimentaires
    RENT,             // Loyer ou hypothèque
    UTILITIES,        // Électricité, eau, gaz, etc.
    TRANSPORTATION,   // Essence, transport en commun, etc.
    ENTERTAINMENT,    // Loisirs, cinéma, sorties, etc.
    HEALTHCARE,       // Médecins, pharmacie, assurance santé
    EDUCATION,        // Frais de scolarité, livres, matériel
    INSURANCE,        // Assurance auto, habitation, etc.
    SAVINGS,          // Épargne
    DEBT,             // Remboursement de dettes
    PERSONAL_CARE,    // Coiffeur, hygiène, soins personnels
    DINING_OUT,       // Restaurants, cafés
    SUBSCRIPTIONS,    // Abonnements (Netflix, Spotify, etc.)
    GIFTS_DONATIONS,  // Cadeaux, dons
    CLOTHING,         // Vêtements
    HOUSEHOLD,        // Produits ménagers, entretien maison
    OTHER             // Autres dépenses non catégorisées
} Categorie;


/**
 * @brief Convert a Categorie enum to a string
 * 
 * @param category 
 * @return const char* 
 */
const char* categorie_to_string(Categorie category);

/**
 * @brief Convert a string to a Categorie enum
 * 
 * @param str 
 * @return Categorie 
 */
Categorie string_to_categorie(const char* str);



#endif 
