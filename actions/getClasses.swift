/**
  *
  * main() will be run when you invoke this action
  *
  * @param Cloud Functions actions accept a single parameter, which must be Codable.
  *
  * @return The completion function, which takes as output a Codable and Error?.
  *
  */

import VisualRecognitionV3
import LanguageTranslatorV2


struct Input: Codable {
    let imageUrl: String?
}
struct Output: Codable {
    let classes: String
}

let apiKey = "GET_API_KEY_FROM_PARAMS"
let version = "2018-08-16"
let visualRecognition = VisualRecognition(version: version, apiKey: apiKey)
func main(param: Input, completion: @escaping (Output?, Error?) -> Void) -> Void {
    let imageUrl = param.imageUrl
    let failure = { (error: Error) in print("err",error) }
    var tags = ""
    visualRecognition.classify(url: imageUrl, failure: failure) { classifiedImages in
        let image = classifiedImages.images.first
        let classifier = image?.classifiers.first
        let classes = classifier?.classes
        for theclass in classes! {
            print(theclass.className)
            tags = tags + theclass.className + ", "
        }
        let result = Output(classes: tags)
        completion(result, nil)
    }
}
