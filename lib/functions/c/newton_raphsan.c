#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#define f(x) x *x *x - x - 1
#define g(x) 3 * x *x - 1 // f prime

int main()
{
	printf("Funciton = x^3 - x - 1\n");
	float a, b, fa, fb, x0, x1, f0, f1, g0, e;
	int step = 1, N;

up:
	printf("Enter value of a: ");
	scanf("%f", &a);
	printf("Enter the value of b: ");
	scanf("%f", &b);

	fa = f(a);
	fb = f(b);

	if (fa * fb >= 0.0)
	{
		printf("Incorrect Initial Guesses. Put value again correctly.\n");
		goto up;
	}

	printf("Enter tolerable error: ");
	scanf("%f", &e);
	printf("Enter maximum iteration: ");
	scanf("%d", &N);

	x0 = (a + b) / 2;
	printf("\n Step\t\tx0\t\tf(x0)\t\tx1\t\tf(x1)\n");
	printf("\n---------------------------------------------");
	do
	{
		f0 = f(x0); // f- is the function value
		g0 = g(x0); // g0 is the differentiation function value

		if (g0 == 0.0)
		{
			printf("\nMathematical Error.");
			exit(0);
		}

		x1 = x0 - f0 / g0; // main quation
		f1 = f(x1);

		if (f1 == 0.0)
		{
			printf("\nRoot is: %f\n", x1);
			printf(" %d\t\t%f\t%f\t%f\t%f\n", step, x0, f0, x1, f1);
			exit(0);
		}
		x0 = x1;
		printf(" %d\t\t%f\t%f\t%f\t%f\n", step, x0, f0, x1, f1);
		printf("\n---------------------------------------------");
		step = step + 1;
		if (step > N)
		{
			printf("\n Not Convergent.");
			exit(0);
		}
	} while (fabs(f1) > e);
	printf("\n Root is: %f\n", x1);
}