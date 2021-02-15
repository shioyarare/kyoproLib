/*
 * Union Find Tree 
 * O(α(n))
 * tested by AtCoder Beginner Contest 097 D - Equals
 */

import std;

class UnionFind {
	int[] par;
	int[] rank;

	this(int n) {
		par.length = n;
		rank.length = n;
		foreach(i; 0..n) par[i] = i;
	}

	int find(int x) {
		if (par[x] == x) 
			return x;
		else 
			return par[x] = find(par[x]);
	}

	void unite(int x, int y) {
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

	bool same(int x, int y) {
		return find(x) == find(y);
	}
}
int N, M;
int[] P;
void main() {
	inelm(N, M);
	P = inarr();

	auto uft = new UnionFind(N);

	foreach(i; 0..M) {
		int x, y;
		inelm(x, y);
		uft.unite(x-1, y-1);
	}

	int ans;
	foreach(i; 0..N) {
		if(uft.same(i, P[i]-1))
			ans++;
	}
	ans.writeln();
}

void inelm(L...)(ref L A) { auto l = readln.split;
	foreach(i, T; L) A[i]=l[i].to!T; }

T[] inarr(T=int)(){ return readln.split.to!(T[]); }
