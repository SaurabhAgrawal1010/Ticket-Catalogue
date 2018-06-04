#include <stdio.h>
#include <string.h>

int main()
{
    FILE *fp1, *fp2, *fp3, *fp4, *fp5, *fp6;
    fp1 = fopen("daily_d1.txt", "r");
    fp2 = fopen("daily_d1c.txt", "w");
    char ch;

    ch = getc(fp1);
    while(ch != EOF) {
        if(ch == '\n')
        {
            ch = ' ';
        }
        if(ch == ';') 
        {
            ch = '\n';
        } 
        putc(ch, fp2);
        ch = getc(fp1);
    }

    fclose(fp1); //close file.
    fclose(fp2); //close file.
    return 0;
}
