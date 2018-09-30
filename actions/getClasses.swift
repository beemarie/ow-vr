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

struct Input: Codable {
    let imageUrl: String
    let apiKey: String
    let version: String
}
struct Output: Codable {
    let classes: String
}


func main(param: Input, completion: @escaping (Output?, Error?) -> Void) -> Void {
    let apiKey = param.apiKey
    let version = param.version
    let visualRecognition = VisualRecognition(version: version, apiKey: apiKey)
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
