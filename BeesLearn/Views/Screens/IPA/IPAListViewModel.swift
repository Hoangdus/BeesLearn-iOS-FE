//
//  IPAListViewModel.swift
//  BeesLearn
//
//  Created by HoangDus on 2/11/25.
//

import Foundation

final class IPAListViewModel: ObservableObject{
    var IPAs: [IPA] = [
        IPA(symbol: "", exampleWord: "", audio1Url: "", audio2Url: "")
    ]
    
    func playAudio(){
        
    }
}
