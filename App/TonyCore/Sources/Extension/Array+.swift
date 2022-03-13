//
//  Array+.swift
//  TonyCore
//
//  Created by Yuki Okudera on 2022/03/13.
//

import Foundation

extension Array {
  subscript(safe index: Index) -> Element? {
    return indices.contains(index) ? self[index] : nil
  }
}
