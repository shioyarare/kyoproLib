/*
 * Dijkstra's algorithm
 * O( |E| log |V| )
 * tested by AtCoder Biginner Contest 035 [failed]
 */
import std;

alias PQueue(T, alias less = "a<b") = BinaryHeap!(Array!T, less);
struct Edge{ long to, cost; }
struct P{ long dist, vt; }
class Dijkstra {
	long V;
	Edge[][] G;
	long[] d;

	this(long n) {
		V = n;
		G.length = V;
		d.length = V;
	}

	void insert_edge(long s, long t, long cost) {
		G[s] ~= Edge(t, cost);
	}

	void run(long s) {
		d[0..$] = long.max;
		d[s] = 0;
		PQueue!(P, "a.dist>b.dist") que;
		que.removeAny;
		que.insert( P(0, s) );

		while(!que.empty()) {
			P p = que.removeAny;
			long v = p.vt;
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

void main() {
	long N, M, T;
	inelm(N, M, T);
	long[] A = inarr!long();

	auto st = new Dijkstra(N);
	auto gl = new Dijkstra(N);

	foreach(i; 0..M) {
		long a, b, c;
		inelm(a, b, c);
		st.insert_edge(a-1, b-1, c);
		gl.insert_edge(b-1, a-1, c);
	}

	
	st.run(0);
	gl.run(0);

	long ans;
	foreach(i; 0..N) {
		if(0>T-st.d[i] - gl.d[i]) continue;
		long money = A[i]*(T-st.d[i]-gl.d[i]);
		ans = max(ans, money);
	}
	ans.writeln;
}
void inelm(L...)(ref L A) { auto l = readln.split;
	foreach(i, T; L) A[i]=l[i].to!T; }

T[] inarr(T=int)(){ return readln.split.to!(T[]); }
