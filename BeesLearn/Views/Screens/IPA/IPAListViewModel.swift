//
//  IPAListViewModel.swift
//  BeesLearn
//
//  Created by HoangDus on 2/11/25.
//

import Foundation
import AVFoundation

final class IPAListViewModel: ObservableObject{
    private let synthesizer = AVSpeechSynthesizer()
    private let voice = AVSpeechSynthesisVoice(language: "en-GB")
    
    var vowels = [
        IPA(symbol: "i:", exampleWord: "sleep", audio1Url: "", audio2Url: ""),
        IPA(symbol: "ɪ", exampleWord: "slip", audio1Url: "", audio2Url: ""),
        IPA(symbol: "ʊ", exampleWord: "good", audio1Url: "", audio2Url: ""),
        IPA(symbol: "u:", exampleWord: "food", audio1Url: "", audio2Url: ""),
        IPA(symbol: "e", exampleWord: "ten", audio1Url: "", audio2Url: ""),
        IPA(symbol: "ə", exampleWord: "better", audio1Url: "", audio2Url: ""),
        IPA(symbol: "ɜ:", exampleWord: "word", audio1Url: "", audio2Url: ""),
        IPA(symbol: "ɔ:", exampleWord: "more", audio1Url: "", audio2Url: ""),
        IPA(symbol: "æ", exampleWord: "tap", audio1Url: "", audio2Url: ""),
        IPA(symbol: "ʌ", exampleWord: "cup", audio1Url: "", audio2Url: ""),
        IPA(symbol: "ɑ:", exampleWord: "bar", audio1Url: "", audio2Url: ""),
        IPA(symbol: "ɒ", exampleWord: "gone", audio1Url: "", audio2Url: ""),
        IPA(symbol: "ɪə", exampleWord: "hear", audio1Url: "", audio2Url: ""),
        IPA(symbol: "eɪ", exampleWord: "game", audio1Url: "", audio2Url: ""),
        IPA(symbol: "ʊə", exampleWord: "pure", audio1Url: "", audio2Url: ""),
        IPA(symbol: "ɔɪ", exampleWord: "toy", audio1Url: "", audio2Url: ""),
        IPA(symbol: "əʊ", exampleWord: "no", audio1Url: "", audio2Url: ""),
        IPA(symbol: "eə", exampleWord: "where", audio1Url: "", audio2Url: ""),
        IPA(symbol: "aɪ", exampleWord: "mine", audio1Url: "", audio2Url: ""),
        IPA(symbol: "aʊ", exampleWord: "how", audio1Url: "", audio2Url: "")
    ]
    
    var consonants = [
        IPA(symbol: "p", exampleWord: "pen", audio1Url: "", audio2Url: ""),
        IPA(symbol: "f", exampleWord: "fig", audio1Url: "", audio2Url: ""),
        IPA(symbol: "t", exampleWord: "tip", audio1Url: "", audio2Url: ""),
        IPA(symbol: "θ", exampleWord: "thought", audio1Url: "", audio2Url: ""),
        IPA(symbol: "ʧ", exampleWord: "chip", audio1Url: "", audio2Url: ""),
        IPA(symbol: "s", exampleWord: "save", audio1Url: "", audio2Url: ""),
        IPA(symbol: "ʃ", exampleWord: "sure", audio1Url: "", audio2Url: ""),
        IPA(symbol: "k", exampleWord: "cat", audio1Url: "", audio2Url: ""),
        IPA(symbol: "b", exampleWord: "bit", audio1Url: "", audio2Url: ""),
        IPA(symbol: "v", exampleWord: "vase", audio1Url: "", audio2Url: ""),
        IPA(symbol: "d", exampleWord: "done", audio1Url: "", audio2Url: ""),
        IPA(symbol: "ð", exampleWord: "those", audio1Url: "", audio2Url: ""),
        IPA(symbol: "ʤ", exampleWord: "jam", audio1Url: "", audio2Url: ""),
        IPA(symbol: "z", exampleWord: "zoo", audio1Url: "", audio2Url: ""),
        IPA(symbol: "ʒ", exampleWord: "vision", audio1Url: "", audio2Url: ""),
        IPA(symbol: "g", exampleWord: "goal", audio1Url: "", audio2Url: ""),
        IPA(symbol: "h", exampleWord: "him", audio1Url: "", audio2Url: ""),
        IPA(symbol: "m", exampleWord: "may", audio1Url: "", audio2Url: ""),
        IPA(symbol: "n", exampleWord: "not", audio1Url: "", audio2Url: ""),
        IPA(symbol: "ŋ", exampleWord: "sing", audio1Url: "", audio2Url: ""),
        IPA(symbol: "r", exampleWord: "reach", audio1Url: "", audio2Url: ""),
        IPA(symbol: "l", exampleWord: "lie", audio1Url: "", audio2Url: ""),
        IPA(symbol: "w", exampleWord: "will", audio1Url: "", audio2Url: ""),
        IPA(symbol: "j", exampleWord: "yet", audio1Url: "", audio2Url: "")
    ]
    
    func playAudio(word: String){
        if(synthesizer.isSpeaking){
            return
        }
        let utterance = AVSpeechUtterance(string: word)
        utterance.rate = 0.3
        utterance.pitchMultiplier = 0.8
        utterance.volume = 1
        utterance.voice = voice
        synthesizer.speak(utterance)
    }
}
