/* Sieve of Eratosthenes
 * O(n log log n)
 */
import std;
const int max_n = 10_000_000;
int[] prime; // nまでの素数
auto is_prime = new bool[](max_n+1); // 篩

void sieve(int n)
{
	is_prime[2..$] = true;
	foreach(i; 2..n+1)
	{
		if(is_prime[i])
		{
			prime ~= i;
			for(int j=2*i; j<=n; j+=i) is_prime[j] = false;
		}
	}
}
