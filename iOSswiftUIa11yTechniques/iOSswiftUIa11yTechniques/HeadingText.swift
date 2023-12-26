//
//  ExampleHeadingView.swift
//  iOSswiftUIa11yTechniques
//
//  Created by Gert-Jan Vercauteren on 2023/12/26.
//

import SwiftUI

struct HeadingText: View {
    let text: String
    let isTopLevel: Bool
    
    private var color: Color = .primary
    
    public init(_ text: String, isTopLevel: Bool = false) {
        self.text = text
        self.isTopLevel = isTopLevel
    }
    
    enum Style {
        case good, bad
    }
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.bold)
            .foregroundColor(isTopLevel ? color : .primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .accessibilityAddTraits(.isHeader)
        if isTopLevel {
            Divider()
                .frame(height: 2.0, alignment:.leading)
                .background(color)
                .padding(.bottom)
        }
    }
    
    public func style(_ style: Style) -> HeadingText {
        var view = self
        
        switch style {
        case .good:
            view.color = Color(.goodExample)
        case .bad:
            view.color = Color(.badExample)
        }
        
        return view
    }
}

#Preview {
    VStack {
        HeadingText("Good example", isTopLevel: true)
            .style(.good)
        HeadingText("Bad example", isTopLevel: true)
            .style(.bad)
        
        HeadingText("Good example")
            .style(.good)
        HeadingText("Bad example")
            .style(.bad)
    }
}
