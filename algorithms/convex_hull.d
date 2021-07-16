/*
 * Convex Hull (Graham Scan)
 * O(n log n)
 */

import std;
// utils
alias Tuple!(long, long) Vec2;
Vec2 sub(Vec2 p, Vec2 q){ return Vec2(p[0]-q[0], p[1]-q[1]); }
long det(Vec2 p, Vec2 q){ return p[0]*q[1]-p[1]*q[0]; }

Vec2[] convex_hull(Vec2[] ps)
{
	int n = ps.length.to!int;
	Vec2[] qs;

	// downward convex
	foreach(i; 0..n){
		while(qs.length>1){
			Vec2 curr = sub(qs[$-1], qs[$-2]);
			Vec2 next = sub(ps[i], qs[$-1]);
			if(det(curr, next)>0) break;
			qs = qs[0..$-1];
		}
		qs ~= ps[i];
	}

	// upward convex
	int t = qs.length.to!int;
	foreach_reverse(i; 0..n-1){

		while(qs.length>t){
			Vec2 curr = sub(qs[$-1], qs[$-2]);
			Vec2 next = sub(ps[i], qs[$-1]);
			if(det(curr, next)>0)break;
			qs = qs[0..$-1];
		}
		qs ~= ps[i];
	}
	return qs;
}