//
//  ErrorDialog.swift
//  fitness-tracker
//
//  Created by Đình Khoa Nguyễn on 26/11/24.
//

import Foundation
import SwiftUI

struct ErrorDialog: View {
  @Binding var message: String?
  
  var body: some View {
    EmptyView()
      .alert(item: Binding(
        get: { message.map { ErrorWrapper(message: $0) } },
        set: { message = $0?.message }
      )) {
        wrapper in
        Alert(
          title: Text("Error"),
          message: Text(wrapper.message),
          dismissButton: .default(Text("OK"))
        )
      }
  }
  
  private struct ErrorWrapper: Identifiable {
    let message: String
    var id: String { message }
  }
}

