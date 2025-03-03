//
//  FlagViewModel.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 03.03.25.
//
import SwiftUI
import Observation

@MainActor
class FlagViewModel: ObservableObject {
    @Published var flagResponse: FlagResponse?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let api = FlagAPI()
    
    func loadFlagData(for ip: String) {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                let response = try await api.fetchFlag(for: ip)
                DispatchQueue.main.async {
                    self.flagResponse = response
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
            }
        }
    }
}
