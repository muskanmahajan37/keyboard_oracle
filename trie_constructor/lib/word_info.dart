/*
Copyright 2020 Google LLC

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

// A helper class for Keyboard Oracle which is used to store the
// information needed for any word that is dealt with.
class WordInfo {
  static const String wordStartingSymbol = '@';
  // Words in brahmic scripts are made up of aksaras. An aksara can contain
  // multiple characters combined.
  List<String> aksaras;

  // The frequency of the word according to the dataset. The frequencies of
  // source words are static. When used elsewhere, such as when constructing
  // a suffix trie.txt, they can change.
  int frequency;

  WordInfo(this.aksaras, this.frequency);

  WordInfo.fromString(String input) {
    var wordEnd = input.indexOf('\t');
    frequency = int.parse(input.substring(wordEnd));
    aksaras = [wordStartingSymbol] +
        input.substring(0, wordEnd).trimRight().split(' ');
  }

  @override
  String toString() {
    return '$aksaras : $frequency';
  }
}
