#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    int n;
    if (argc < 2) {
        printf("Combien de termes voulez-vous ? : ");
        scanf("%d", &n);
    } else {
        n = atoi(argv[1]);
    }

    int t[2] = {0, 1};
    for (size_t i = 1; i <= n; i++)
    {
        printf("%d ", t[1]);
        int next_term = t[0] + t[1];
        t[0] = t[1];
        t[1] = next_term;
    }
    puts("");
}