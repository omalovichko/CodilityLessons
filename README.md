# Codility Lessons [![Build Status](https://travis-ci.org/omalovichko/CodilityLessons.svg?branch=develop)](https://travis-ci.org/omalovichko/CodilityLessons)
Codility lessons solutions solved in Swift 3.x

Correctness: 💯🔥%

Performance: 💯🔥%

Finished lessons:
------

__Lesson 1 - Iterations__
* BinaryGap: Find longest sequence of zeros in binary representation of an integer.

__Lesson 2 - Arrays__
* OddOccurrencesInArray: Find value that occurs in odd number of elements.
* CyclicRotation: Rotate an array to the right by a given number of steps.

__Lesson 3 - Time Complexity__
* PermMissingElem: Find the missing element in a given permutation.
* FrogJmp: Count minimal number of jumps from position X to Y.
* TapeEquilibrium: Minimize the value |(A[0] + ... + A[P-1]) - (A[P] + ... + A[N-1])|.

__Lesson 4 - Counting Elements__
* MissingInteger: Find the minimal positive integer not occurring in a given sequence.
* PermCheck: Check whether array A is a permutation.
* FrogRiverOne: Find the earliest time when a frog can jump to the other side of a river.
* MaxCounters: Calculate the values of counters after applying all alternating operations: increase counter by 1; set value of all counters to current maximum.

__Lesson 5 - Prefix Sums__
* CountDiv: Compute number of integers divisible by k in range [a..b].
* PassingCars: Count the number of passing cars on the road.
* GenomicRangeQuery: Find the minimal nucleotide from a range of sequence DNA.
* MinAvgTwoSlice: Find the minimal average of any slice containing at least two elements.

__Lesson 6 - Sorting__
* Distinct: Compute number of distinct values in an array.
* MaxProductOfThree: Maximize A[P] * A[Q] * A[R] for any triplet (P, Q, R).
* Triangle: Determine whether a triangle can be built from a given set of edges.
* NumberOfDiscIntersections: Compute the number of intersections in a sequence of discs.

__Lesson 7 - Stacks and Queues__
* Brackets: Determine whether a given string of parentheses is properly nested.
* Fish: N voracious fish are moving along a river. Calculate how many fish are alive.
* Nesting: Determine whether given string of parentheses is properly nested.
* StoneWall: Cover "Manhattan skyline" using the minimum number of rectangles.

__Lesson 8 - Leader__
* EquiLeader: Find the index S such that the leaders of the sequences A[0], A[1], ..., A[S] and A[S + 1], A[S + 2], ..., A[N - 1] are the same.
* Dominator: Find an index of an array such that its value occurs at more than half of indices in the array.

__Lesson 9 - Maximum slice problem__
* MaxDoubleSliceSum: Find the maximal sum of any double slice.
* MaxProfit: Given a log of stock prices compute the maximum possible earning.
* MaxSliceSum: Find a maximum sum of a compact subsequence of array elements.

__Lesson 10 - Prime and composite numbers__
* CountFactors: Count factors of given number n.
* MinPerimeterRectangle: Find the minimal perimeter of any rectangle whose area equals N.
* Peaks: Divide an array into the maximum number of same-sized blocks, each of which should contain an index P such that A[P - 1] < A[P] > A[P + 1].

__Lesson 11 - Sieve of Eratosthenes__

__Lesson 12 - Euclidean algorithm__

__Lesson 13 - Fibonacci numbers__

__Lesson 14 - Binary search algorithm__

__Lesson 15 - Caterpillar method__
* AbsDistinct: Compute number of distinct absolute values of sorted array elements.

__Lesson 16 - Greedy algorithms__
* MaxNonoverlappingSegments: Find a maximal set of non-overlapping segments.
* TieRopes: Tie adjacent ropes to achieve the maximum number of ropes of length >= K.

__Lesson 17 - Dynamic programming__
* NumberSolitaire: In a given array, find the subset of maximal sum in which the distance between consecutive elements is at most 6.

__Lesson 90 - Tasks from Indeed Prime 2015 challenge__
* LongestPassword: Given a string containing words, find the longest word that satisfies specific conditions.
* FloodDepth: Find the maximum depth of water in mountains after a huge rainfall.

__Lesson 91 - Tasks from Indeed Prime 2016 challenge__
* DwarfsRafting: Find out how many dwarfs can fit on a raft such that it's balanced when crossing a river.

__Lesson 92 - Tasks from Indeed Prime 2016 College Coders challenge__
* TennisTournament: Given the numbers of players and available courts, calculate the maximum number of parallel tennis games.
* SocksLaundering: From drawers containing both clean and dirty socks, choose socks to launder in order to obtain the maximum number of clean pairs of socks.

__Lesson 99 - Future training__
* SqlSum: Calculate sum of elements.
* StrSymmetryPoint: Find a symmetry point of a string, if any.
* TreeHeight: Compute the height of a binary tree.


Complexity optimisation are needed:
------

__Lesson 10 - Prime and composite numbers__

__Lesson 12 - Euclidean algorithm__
* ChocolatesByNumbers: There are N chocolates in a circle. Count the number of chocolates you will eat.

__Lesson 90 - Tasks from Indeed Prime 2015 challenge__
* SlalomSkiing: Given a sequence, find the longest subsequence that can be decomposed into at most three monotonic parts.

__Lesson 91 - Tasks from Indeed Prime 2016 challenge__
* RectangleBuilderGreaterArea: Count the distinct rectangle sizes, of area greater than or equal to X, that can be built out of a given set of segments.

__Lesson 99 - Future training__
* ArrayInversionCount: Compute number of inversion in an array.

<!-- Lessons in progress:
------

__Lesson 10 - Prime and composite numbers__
* Flags: Find the maximum number of flags that can be set on mountain peaks.

__Lesson 11 - Sieve of Eratosthenes__
* CountSemiprimes: Count the semiprime numbers in the given range [a..b]
* CountNonDivisible: Calculate the number of elements of an array that are not divisors of each element.

__Lesson 12 - Euclidean algorithm__
* CommonPrimeDivisors: Check whether two numbers have the same prime divisors.

__Lesson 13 - Fibonacci numbers__
* Ladder: Count the number of different ways of climbing to the top of a ladder.
* FibFrog: Count the minimum number of jumps required for a frog to get to the other side of a river.

__Lesson 14 - Binary search algorithm__
* NailingPlanks: Count the minimum number of nails that allow a series of planks to be nailed.
* MinMaxDivision: Divide array A into K blocks and minimize the largest sum of any block.

__Lesson 15 - Caterpillar method__
* CountTriangles: Count the number of triangles that can be built from a given set of edges.
* CountDistinctSlices: Count the number of distinct slices (containing only unique numbers).
* MinAbsSumOfTwo: Find the minimal absolute value of a sum of two elements.

__Lesson 17 - Dynamic programming__
* MinAbsSum: Given array of integers, find the lowest absolute sum of elements.

__Lesson 91 - Tasks from Indeed Prime 2016 challenge__
* HilbertMaze: Find the shortest path between two fields in a Hilbert maze.
* TreeProduct: Remove at most two edges from a tree graph to maximize the product of the components' sizes.

__Lesson 92 - Tasks from Indeed Prime 2016 College Coders challenge__
* ArrayRecovery: Recover a broken array using partial information in another array.
* DiamondsCount: Given points on a plane, count the number of sets of four points that form regular diamonds.

__Lesson 99 - Future training__
* PolygonConcavityIndex: Check whether a given polygon in a 2D plane is convex; if not, return the index of a vertex that doesn't belong to the convex hull. 
-->
