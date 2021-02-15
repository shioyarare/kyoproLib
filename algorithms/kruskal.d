/* 
 * Kruskal's algorithm
 * O( |E| log|V| )
 * tested by AOJ GRL_2_A 
 */

import std.stdio;
import std.typecons;
import std.algorithm;
import std.array;
import std.conv;

int V, E;
alias Tuple!(int, "u", int, "v", int, "cost") Edge;
Edge[] es;


int kruskal() {
	es.sort!"a.cost<b.cost"();
	auto uft = new UnionFind(V);

	int ans;
	foreach(e; es) {
		if(!uft.same(e.u, e.v)) {
			uft.unite(e.u, e.v);
			ans += e.cost;
		}
	}
	return ans;
}

void main() {
	inelm(V, E);
	foreach(i; 0..E) {
		int s, t, w;
		inelm(s, t, w);
		es ~= Edge(s, t, w);
	}
	kruskal.writeln();
}

void inelm(L...)(ref L A) { auto l = readln.split;
	foreach(i, T; L) A[i]=l[i].to!T; }

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

