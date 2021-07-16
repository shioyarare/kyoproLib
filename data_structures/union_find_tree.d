/*
 * Union Find Tree 
 * O(α(n))
 * tested by AtCoder Beginner Contest 097 D - Equals
 */

import std;

class UnionFind 
{
	int[] par;
	int[] rank;

	this(int n) 
	{
		par.length = n;
		rank.length = n;
		foreach(i; 0..n) par[i] = i;
	}

	int find(int x) 
	{
		if (par[x] == x) 
			return x;
		else 
			return par[x] = find(par[x]);
	}

	void unite(int x, int y) 
	{
		x = find(x);
		y = find(y);
		if(x==y) 
			return;
		if(rank[x] < rank[y])
			par[x] = y;
		else {
			par[y] = x;
			if (rank[x] == rank[y]) rank[x]++;
		}
	}

	bool same(int x, int y) 
	{
		return find(x) == find(y);
	}
}
