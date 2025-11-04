#include<stdio.h>

int main(void){
    char *s = "Alo Mundo";

    printf("%s\n", s);

    //Numero de caracteres na palavra
    int counter = 0;
    for(int i = 0; s[i] != 0; i++)
    {
        counter ++;
    }
    printf("A palavra tem: %i caracteres.\n", counter);

     //Numero de caracteres na palavra
    bool busca ;
    busca = false;
    for(int i = 0; s[i] != 0; i++)
    {
        for(int j = 0; s[i] != 32; j++)
        {
            busca = true;
            break;
        }
    }
    
    if(busca == true)
    {
        printf("Encontrou\n");
    }
    else
    printf("Não\n");

    
}
