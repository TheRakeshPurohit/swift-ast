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

public class TryOperatorExpression : ASTNode, ASTExpression {
  public enum Kind {
    case `try`(ASTExpression)
    case forced(ASTExpression)
    case optional(ASTExpression)
  }

  public private(set) var kind: Kind

  public init(kind: Kind) {
    self.kind = kind
  }

  // MARK: - Node Mutations

  public func reset(with newKind: Kind) {
    kind = newKind
  }

  // MARK: - ASTTextRepresentable

  override public var textDescription: String {
    let tryText: String
    let exprText: String
    switch kind {
    case .try(let expr):
      tryText = "try"
      exprText = expr.textDescription
    case .forced(let expr):
      tryText = "try!"
      exprText = expr.textDescription
    case .optional(let expr):
      tryText = "try?"
      exprText = expr.textDescription
    }
    return "\(tryText) \(exprText)"
  }
}
