/*
   Copyright 2016-2017 Ryuichi Intellectual Property and the Yanagiba project contributors

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/

public class TupleExpression : ASTNode, PrimaryExpression {
  public struct Element {
    public let identifier: Identifier?
    public let expression: ASTExpression

    public init(identifier: Identifier?, expression: ASTExpression) {
      self.identifier = identifier
      self.expression = expression
    }

    public init(expression: ASTExpression) {
      self.init(identifier: nil, expression: expression)
    }
  }

  public private(set) var elementList: [Element]

  public init(elementList: [Element] = []) {
    self.elementList = elementList
  }

  // MARK: - Node Mutations

  public func replaceElement(at index: Int, with element: Element) {
    guard index >= 0 && index < elementList.count else { return }
    elementList[index] = element
  }

  // MARK: - ASTTextRepresentable

  override public var textDescription: String {
    if elementList.isEmpty {
      return "()"
    }

    let listText: [String] = elementList.map { element in
      var idText = ""
      if let id = element.identifier {
        idText = "\(id): "
      }
      return "\(idText)\(element.expression.textDescription)"
    }
    return "(\(listText.joined(separator: ", ")))"
  }
}
