//
//  PreviewStateHelper.swift
//  HomeLink
//
//  Created by Pedro Andriotti on 10/09/24.
//

import SwiftUI

struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State var value: Value
    let content: (Binding<Value>) -> Content
    
    init(_ initialValue: Value, content: @escaping (Binding<Value>) -> Content) {
        _value = State(wrappedValue: initialValue)
        self.content = content
    }
    
    var body: some View {
        content($value)
    }
}
