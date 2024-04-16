//
//  ContentView.swift
//  SavingFilesWithSwiftUI
//
//  Created by Sandra Gomez on 4/16/24.
//

import SwiftUI

struct ContentView: View {
// State variable that hold text to save in a file
    @State private var showText = ""
    
    //function that will store the contents of the showText variable in a file called "file.txt
    func writeFile() {
        // creates a FileManager
        let fm = FileManager.default
        // defines its location in the documets directory
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        // gives the file an arbitrary name of "file.txt
        let url = urls.last?.appendingPathComponent("file.txt")
        // do catch block stores the contents of the showText variable into the file.
        do {
            try showText.write(to: url!, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print ("File writing error")
        }
    }
    
    // function retrieves data from the "file.txt" file like this:
    func readFile() {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.txt")
        do {
            let fileContent = try String(contentsOf: url!, encoding: String.Encoding.utf8)
            showText = fileContent
        } catch {
            print("File reading error")
        }
    }
    var body: some View {
        VStack {
            TextEditor(text:$showText)
            HStack {
                // button calls writeFile function
                Button (action: writeFile) {
                    Text("Write File")
                }
                Spacer()
                
                // button calls readFile function
                Button(action: readFile) {
                    Text("Read File")
                }
            }
        }   .padding()
    }
}
#Preview {
    ContentView()
}
