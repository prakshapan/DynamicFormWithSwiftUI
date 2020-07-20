//
//  Pickerfield.swift
//  JobLogins
//
//  Created by Praks on 7/19/20.
//

import SwiftUI

struct Pickerfield: View {
    @State var showPicker: Bool = false
    @State var selectedElement = ""
    @ObservedObject var field: FormElement

    var placeHolderColor = Color.gray.opacity(0.7)

    var body: some View {
        ZStack() {
            Rectangle()
                .fill(Color.white, style: FillStyle())
                .onTapGesture { withAnimation {
                    self.dismissKeyboard()
                    self.showPicker = true
                }
            }
            datePickerBody
        }.onAppear {
            if let firstValue = field.pickerValues.first {
                selectedElement = firstValue
            }
        }
    }

    private var datePickerBody: some View {
        VStack(alignment: .leading, spacing: 0) {
            Appfield.init(field).title
            ZStack(alignment: .leading) {
                if field.value.isEmpty { Appfield.init(field).placeHolder }
                Appfield.init(field).valueAndBorderUneditable
            }
            Appfield.init(field).errorMessage
            if showPicker { picker.transition(.opacity) }
        }.padding(.bottom, 8)
    }

    private var picker: some View {
        VStack() {
            Picker(selection: $selectedElement, label: Text(""),
                content: {
                    ForEach(field.pickerValues, id: \.self) { (string: String) in
                        Text(string)
                    }
                }).datePickerStyle(WheelDatePickerStyle())
                .frame(height: 130, alignment: .center)
                .frame(maxWidth: .infinity)
            doneAndCancel
        }
    }

    private var doneAndCancel: some View {
        HStack(spacing: 0) {
            Button(action: {
                withAnimation {
                    field.value = ""
                    showPicker = false
                }
            }, label: {
                    Text("Cancel").accentColor(.black)
                }).frame(maxWidth: .infinity)
            Button(action: {
                withAnimation {
                    field.value = selectedElement
                    showPicker = false
                }
            }, label: {
                    Text("Done").fontWeight(.semibold).accentColor(.black)
                }).frame(maxWidth: .infinity)
        }
    }
}

struct Pickerfield_Previews: PreviewProvider {
    static var previews: some View {
        Pickerfield(field: FormElement(title: "Date", value: "", validate: [ValidateRule(rule: Regex.mustContain, error: "Must Contain")]))
    }
}

