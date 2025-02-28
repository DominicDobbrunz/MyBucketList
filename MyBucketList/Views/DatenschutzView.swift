//
//  DatenschutzView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 24.02.25.
//


import SwiftUI

struct DatenschutzView: View {
    @StateObject private var settingVM = SettingViewModel()
    @Environment(\.dismiss) var dismiss
    @State private var agreedToPolicy = false
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    // Titel
                    Text("Datenschutzrichtlinien")
                        .font(.title)
                        .bold()
                    
                    // Einführung
                    Text("Willkommen zu unserer Datenschutzrichtlinie. Der Schutz Ihrer persönlichen Daten ist uns sehr wichtig. Bitte lesen Sie die folgenden Informationen sorgfältig durch.")
                        .font(.body)
                        .foregroundColor(.black)
                    
                    Divider()
                    
                    // Abschnitt 1 - Datensammlung
                    Text("1️⃣ Welche Daten sammeln wir?")
                        .font(.headline)
                    Text("Wir erfassen folgende Daten, wenn Sie unsere App nutzen:")
                    BulletPoint(text: "Name, E-Mail-Adresse, Telefonnummer")
                    BulletPoint(text: "Standortdaten (falls aktiviert)")
                    BulletPoint(text: "Nutzungsstatistiken zur Verbesserung der App")
                    
                    Divider()
                    
                    // Abschnitt 2 - Verwendung der Daten
                    Text("2️⃣ Wie nutzen wir Ihre Daten?")
                        .font(.headline)
                    Text("Wir verwenden Ihre Daten für:")
                    BulletPoint(text: "Personalisierung der App-Erfahrung")
                    BulletPoint(text: "Kundensupport und Fehlerbehebung")
                    BulletPoint(text: "Marketing- und Analysezwecke")
                    
                    Divider()
                    
                    // Abschnitt 3 - Ihre Rechte
                    Text("3️⃣ Ihre Rechte")
                        .font(.headline)
                    Text("Sie haben das Recht auf:")
                    BulletPoint(text: "Auskunft über Ihre gespeicherten Daten")
                    BulletPoint(text: "Löschung oder Berichtigung Ihrer Daten")
                    BulletPoint(text: "Widerruf der Zustimmung zur Datennutzung")
                    
                    Divider()
                    
                    // Zustimmung
                    Toggle("Ich akzeptiere die Datenschutzrichtlinien", isOn: $agreedToPolicy)
                        .padding()
                    
                    Button(action: {
                        if agreedToPolicy {
                            showAlert = true
                        }
                    }) {
                        Text("Speichern")
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(agreedToPolicy ? Color.grey1 : Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                    .disabled(!agreedToPolicy)
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Datenschutz")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Erfolgreich!"), message: Text("Ihre Zustimmung wurde gespeichert."), dismissButton: .default(Text("OK")))
                
            }
            .scrollContentBackground(.hidden)
            .background(MeshGradientView())
        }
        
    }
}

#Preview {
    DatenschutzView()
}
