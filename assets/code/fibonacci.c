#include <stdio.h>

int main(void)
{
    int n;
    printf("Combien de termes voulez-vous ? : ");
    scanf("%d", &n);

    int t[2] = {0, 1};
    for (size_t i = 1; i <= n; i++)
    {
        printf("%d, ", t1);
        int next_term = t[0] + t[1];
        t[1] = t[0];
        t[1] = next_term;
    }
    printf("\n");
}