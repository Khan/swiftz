////
////  DictionaryExt.swift
////  Swiftz
////
////  Created by Maxwell Swadling on 5/06/2014.
////  Copyright (c) 2014 Maxwell Swadling. All rights reserved.
////
//
extension Dictionary {
	/// Creates a Dictionary from a list of Key-Value pairs.
	static func fromList(l : [(Key, Value)]) -> Dictionary<Key, Value> {
		var d = Dictionary<Key, Value>(minimumCapacity: l.count)
		l.forEach { (k, v) in
			d[k] = v
		}
		return d
	}

	/// Maps a function over all keys in the receiver.
	public func mapKeys<Key2 : Hashable>(f : Key -> Key2) -> Dictionary<Key2, Value> {
		var d = Dictionary<Key2, Value>()
		self.forEach { (k, v) in
			d[f(k)] = v
		}
		return d
	}
}
