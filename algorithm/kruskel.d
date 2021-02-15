/* 
 * Kruskal's algorithm
 * O( |E| log|V| )
 * tested by AOJ GRL_2_A [failed]
 */
import std;

int V, E;
alias Tuple!(int, "u", int, "v", int, "cost") Edge;
Edge[] es;

int kruskal() {
	es.sort();

}

void main() {
	auto ve = readln.chomp.split;
	V = ve[0].to!int;
	E = ve[1].to!int;
	foreach(i; 0..E) {
		auto tmp = readln.chomp.split;
		es ~= Edge( tmp[0].to!int, tmp[1].to!int, tmp[2].to!int );
	}

	kruskal.writeln();
}
