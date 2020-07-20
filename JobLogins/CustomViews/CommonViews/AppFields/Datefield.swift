//
//  Datefield.swift
//  JobLogins
//
//  Created by Praks on 7/18/20.
//

import SwiftUI

struct Datefield: View {
    @State var showDatePicker: Bool = false
    @State var selectedDate = Date()

    @ObservedObject var field: FormElement


    var body: some View {
        ZStack() {
            Rectangle()
                .fill(Color.white, style: FillStyle())
                .onTapGesture { withAnimation {
                    self.dismissKeyboard()
                    self.showDatePicker = true
                }
            }
            datePickerBody
        }
    }

    private var datePickerBody: some View {
        VStack(alignment: .leading, spacing: 0) {
            Appfield(field).title
            ZStack(alignment: .leading) {
                if field.value.isEmpty { Appfield(field).placeHolder }
                Appfield(field).valueAndBorderUneditable
            }
            Appfield(field).errorMessage
            if showDatePicker { datePicker.transition(.moveAndScale) }
        }.padding(.bottom, 8)
    }
    
    private var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -150, to: Date())!
        let max = Calendar.current.date(byAdding: .year, value: -18, to: Date())!
        return min...max
    }

    private var datePicker: some View {
        VStack() {
            DatePicker("", selection: $selectedDate, in: dateClosedRange, displayedComponents: .date)
                .labelsHidden()
                .datePickerStyle(WheelDatePickerStyle())
            doneAndCancel
        }
    }
    
    private var doneAndCancel: some View {
        HStack(spacing: 0) {
            Button(action: {
                withAnimation { self.showDatePicker = false }
            }, label: {
                    Text("Cancel").accentColor(.black)
                }).frame(maxWidth: .infinity)
            Button(action: {
                let dateFormat = DateFormatter()
                dateFormat.dateStyle = .medium
                field.value = dateFormat.string(from: selectedDate)
                withAnimation { self.showDatePicker = false }
            }, label: {
                    Text("Done").fontWeight(.semibold).accentColor(.black)
                }).frame(maxWidth: .infinity)
        }
    }
}

struct Datefield_Previews: PreviewProvider {
    static var previews: some View {
        Datefield(field: FormElement(title: "Date", value: "", validate: [ValidateRule(rule: Regex.mustContain, error: "Must Contain")]))
    }
}

