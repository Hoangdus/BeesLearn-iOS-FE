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
    private var audioPlayer: AVAudioPlayer? = nil
    
    var vowels = [
        IPA(symbol: "/i:/", exampleWord: "sleep", audio1Url: "", audio2Url: "i"),
        IPA(symbol: "/ɪ/", exampleWord: "slip", audio1Url: "", audio2Url: "ɪ"),
        IPA(symbol: "/ʊ/", exampleWord: "good", audio1Url: "", audio2Url: "ʊ"),
        IPA(symbol: "/u:/", exampleWord: "food", audio1Url: "", audio2Url: "u"),
        IPA(symbol: "/e/", exampleWord: "ten", audio1Url: "", audio2Url: "e"),
        IPA(symbol: "/ə/", exampleWord: "better", audio1Url: "", audio2Url: "ə"),
        IPA(symbol: "/ɜ:/", exampleWord: "word", audio1Url: "", audio2Url: "ɜ"),
        IPA(symbol: "/ɔ:/", exampleWord: "more", audio1Url: "", audio2Url: "ɔ"),
        IPA(symbol: "/æ/", exampleWord: "tap", audio1Url: "", audio2Url: "æ"),
        IPA(symbol: "/ʌ/", exampleWord: "cup", audio1Url: "", audio2Url: "ʌ"),
        IPA(symbol: "/ɑ:/", exampleWord: "bar", audio1Url: "", audio2Url: "ɑ"),
        IPA(symbol: "/ɒ/", exampleWord: "gone", audio1Url: "", audio2Url: "ɒ"),
        IPA(symbol: "/ɪə/", exampleWord: "hear", audio1Url: "", audio2Url: "ɪə"),
        IPA(symbol: "/eɪ/", exampleWord: "game", audio1Url: "", audio2Url: "eɪ"),
        IPA(symbol: "/ʊə/", exampleWord: "pure", audio1Url: "", audio2Url: "ʊə"),
        IPA(symbol: "/ɔɪ/", exampleWord: "toy", audio1Url: "", audio2Url: "ɔɪ"),
        IPA(symbol: "/əʊ/", exampleWord: "no", audio1Url: "", audio2Url: "əʊ"),
        IPA(symbol: "/eə/", exampleWord: "where", audio1Url: "", audio2Url: "eə"),
        IPA(symbol: "/aɪ/", exampleWord: "mine", audio1Url: "", audio2Url: "aɪ"),
        IPA(symbol: "/aʊ/", exampleWord: "how", audio1Url: "", audio2Url: "aʊ")
    ]
    
    var consonants = [
        IPA(symbol: "/p/", exampleWord: "pen", audio1Url: "", audio2Url: "p"),
        IPA(symbol: "/f/", exampleWord: "fig", audio1Url: "", audio2Url: "f"),
        IPA(symbol: "/t/", exampleWord: "tip", audio1Url: "", audio2Url: "t"),
        IPA(symbol: "/θ/", exampleWord: "thought", audio1Url: "", audio2Url: "θ"),
        IPA(symbol: "/ʧ/", exampleWord: "chip", audio1Url: "", audio2Url: "t∫"),
        IPA(symbol: "/s/", exampleWord: "save", audio1Url: "", audio2Url: "s"),
        IPA(symbol: "/ʃ/", exampleWord: "sure", audio1Url: "", audio2Url: "∫"),
        IPA(symbol: "/k/", exampleWord: "cat", audio1Url: "", audio2Url: "k"),
        IPA(symbol: "/b/", exampleWord: "bit", audio1Url: "", audio2Url: "b"),
        IPA(symbol: "/v/", exampleWord: "vase", audio1Url: "", audio2Url: "v"),
        IPA(symbol: "/d/", exampleWord: "done", audio1Url: "", audio2Url: "d"),
        IPA(symbol: "/ð/", exampleWord: "those", audio1Url: "", audio2Url: "ð"),
        IPA(symbol: "/ʤ/", exampleWord: "jam", audio1Url: "", audio2Url: "dʒ"),
        IPA(symbol: "/z/", exampleWord: "zoo", audio1Url: "", audio2Url: "z"),
        IPA(symbol: "/ʒ/", exampleWord: "vision", audio1Url: "", audio2Url: "ʒ"),
        IPA(symbol: "/g/", exampleWord: "goal", audio1Url: "", audio2Url: "g"),
        IPA(symbol: "/h/", exampleWord: "him", audio1Url: "", audio2Url: "h"),
        IPA(symbol: "/m/", exampleWord: "may", audio1Url: "", audio2Url: "m"),
        IPA(symbol: "/n/", exampleWord: "not", audio1Url: "", audio2Url: "n"),
        IPA(symbol: "/ŋ/", exampleWord: "sing", audio1Url: "", audio2Url: "ŋ"),
        IPA(symbol: "/r/", exampleWord: "reach", audio1Url: "", audio2Url: "r"),
        IPA(symbol: "/l/", exampleWord: "lie", audio1Url: "", audio2Url: "l"),
        IPA(symbol: "/w/", exampleWord: "will", audio1Url: "", audio2Url: "w"),
        IPA(symbol: "/j/", exampleWord: "yet", audio1Url: "", audio2Url: "j")
    ]
    
    func playAudio(iPA: IPA){
        if(synthesizer.isSpeaking){
            return
        }
        
        guard let url = Bundle.main.url(forResource: iPA.audio2Url, withExtension: "mp3") else {
            print("Sound file not found")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
        
        let utterance = AVSpeechUtterance(string: iPA.exampleWord)
        utterance.rate = 0.3
        utterance.pitchMultiplier = 0.8
        utterance.volume = 1
        utterance.voice = voice
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9, execute: {
            self.synthesizer.speak(utterance)
        })
    }
}
