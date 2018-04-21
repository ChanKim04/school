/* bakeshop.c for CS 232 at Calvin College
 * Professor: Dr. Victor Norman
 * Student: Chan Kim (ck45)
 * Date: 4/10/2018
 *********************************************/

#include <stdio.h>
#include <stdlib.h>
#include <semaphore.h>
#include <pthread.h>
#include <unistd.h>

int breads = 0;
int breadsCount = 0;
int customers = 0;
int customersCheck = 0;

sem_t Baker;
sem_t Customer;
sem_t Store;
sem_t CheckOut;
sem_t Receipt;

/************************************************
 * bakeBread() represent Baker's characteristics
 * PRE: Baker semaphore has been declared.
 * Return: Run until breadsCount becomes 10.
 ************************************************/

void *bakeBread()
{
    while (breadsCount < 10)
    {
        sem_wait(&Baker);
        breads++;
        breadsCount++;
        fprintf(stderr, "A loaf of bread is completed and available for sale\n");
        sem_post(&Baker);
        usleep(1000000);
    }
    fprintf(stderr, "All the baking is done\n");
}

/***********************************************************************
 * cashRegister() represents Baker's characteristics as a cash register
 * PRE: Baker and Receipt semaphores have been declared.
 * Return: Run until customers becomes 10, and while customersCheck > 0.
 ***********************************************************************/

void *cashRegister()
{
    while (customers < 10)
    {
        if (customersCheck > 0)
        {
            sem_wait(&Baker);
            
            sem_wait(&Receipt);
            fprintf(stderr, "The baker prints the customer a receipt\n");
            usleep(1000000);                 
            sem_post(&Receipt);

            fprintf(stderr, "The baker hands the customer a receipt\n");
            customers++;
            customersCheck--;
            sem_post(&Baker);
        }
 
    }
}

/*****************************************************************************
 * customer(id) represents customer characteristics.
 * PRE: Store, Customer, CheckOut, and CheckOut semaphores have been declared.
 *****************************************************************************/

void *customer(void *id)
{
    sem_wait(&Store);
    fprintf(stderr, "Customer %ld has entered the store\n", (long)id);

    sem_wait(&Customer);
    while (breads == 0)
    {
        usleep(1000000);
    }
    breads--;
    sem_post(&Customer);

    fprintf(stderr, "Customer %ld obtains a load of bread\n", (long)id);
    usleep(1000000);

    sem_wait(&CheckOut);
    fprintf(stderr, "Customer %ld has paid\n", (long)id);
    customersCheck++;
    usleep(1000000);
    
    sem_wait(&Receipt);
    sem_post(&Receipt);

    fprintf(stderr, "Customer %ld gets the receipt\n", (long)id);
    sem_post(&CheckOut);

    sem_wait(&Customer);

    fprintf(stderr, "Customer %ld leaves the store\n", (long)id); 
    sem_post(&Customer);
       
    sem_post(&Store);
}

/*******************************************
 * main() runs the program.
 *        Semaphores have been initialized.
 *        Threads have been created.
 *******************************************/

int main()
{
    sem_init(&Baker, 0, 1);
    sem_init(&Customer, 0, 1);
    sem_init(&Store, 0, 5);
    sem_init(&CheckOut,0, 1);
    sem_init (&Receipt, 0, 1);

    pthread_t bakeBreadTrd;
    pthread_t cashRegisterTrd;
    pthread_t customerTrd[5];

    pthread_create(&bakeBreadTrd, NULL, bakeBread, NULL);  
    pthread_create(&cashRegisterTrd, NULL, cashRegister, NULL);  
    for ( long i = 0; i < 10; i++)
    {
        pthread_create(&customerTrd[i], NULL, customer, (void *)i);
    }

    pthread_exit(NULL);
}