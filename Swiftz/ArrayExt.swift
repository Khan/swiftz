//
//  ArrayExt.swift
//  Swiftz
//
//  Created by Maxwell Swadling on 3/06/2014.
//  Copyright (c) 2014 Maxwell Swadling. All rights reserved.
//

/// MARK: Array extensions

/// Maps a function over a list of Optionals, applying the function of the optional is Some,
/// discarding the value if it is None and returning a list of non Optional values
public func mapFlatten<A>(xs : [A?]) -> [A] {
	return xs.flatMap(identity)
}

extension Array {
	/// Returns the first element in a list matching a given predicate.  If no such element exists, this
	/// function returns nil.
	public func find(f : (Element -> Bool)) -> Element? {
		for x in self {
			if f(x) {
				return .Some(x)
			}
		}
		return .None
	}

	/// Maps a predicate over a list.  For the result to be true, the predicate must be satisfied at
	/// least once by an element of the list.
	public func any(f : (Element -> Bool)) -> Bool {
		return self.map(f).or
	}

	/// Maps a predicate over a list.  For the result to be true, the predicate must be satisfied by
	/// all elemenets of the list.
	public func all(f : (Element -> Bool)) -> Bool {
		return self.map(f).and
	}
}

extension Array where Element : BooleanType {
	/// Returns the conjunction of a list of Booleans.
	public var and : Bool {
		return self.reduce(true) { $0.boolValue && $1.boolValue }
	}

	/// Returns the dijunction of a list of Booleans.
	public var or : Bool {
		return self.reduce(false) { $0.boolValue || $1.boolValue }
	}
}
