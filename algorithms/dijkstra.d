/*
 * Dijkstra's algorithm
 * O( |E| log |V| )
 * tested by AtCoder Biginner Contest 035
 */
import std;

alias PQueue(T, alias less = "a<b") = BinaryHeap!(Array!T, less);
struct Edge{ uint to;long cost; }
struct P{ long dist; uint vt; }
class Dijkstra {
	uint V;
	Edge[][] G;
	long[] d;

	this(uint n) {
		V = n;
		G.length = V;
		d.length = V;
	}

	void insert_edge(uint s, uint t, long cost) {
		G[s] ~= Edge(t, cost);
	}

	void run(uint s) {
		d[0..$] = 100_000_000_000;
		d[s] = 0;
		PQueue!(P, "a.dist>b.dist") que;
		que.insert( P(0, s) );

		while(!que.empty()) {
			P p = que.removeAny;
			uint v = p.vt;
			if(d[v]<p.dist) continue;
			foreach(e; G[v]) {
				if(d[e.to]>d[v]+e.cost) {
					d[e.to] = d[v] + e.cost;
					que.insert( P(d[e.to], e.to) );
				}
			}
		}
	}
}
