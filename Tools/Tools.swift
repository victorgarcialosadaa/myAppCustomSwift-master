
import UIKit
class Tools{
    /*let vc = UIStoryboard?.instantiateViewController(withIdentifier:"myCell")as! ViewControllerWatch*/
    func parseCSVBreed(breeds: inout [dogBreed]) {
        
        //Obtengo el fichero y su tipo
        let path = Bundle.main.path(forResource: "dogsBreeds", ofType: "csv")!
        
        do{
            
            //Utilizo la librería para obtener la decodificación
            let csv = try CSV(contentsOfURL: path)
            
            //Recorro el fichero por filas y lo guardo en el array
            for row in csv.rows {
                breeds.append(dogBreed(id: row["id"]!,
                                       name: row["name"]!,
                                       country: row["country"]!, image: row["image"]! != "" ? row["image"]! : "nil"))
            }
            
        } catch let error as NSError {
            print("Error decodificando el CSV", error)
        }
        
    }
    
    func getImage(imagenURL:String, completion: @escaping (_ image: UIImage?) -> ()) {
        
        let imgURL = URL(string: imagenURL)!
        //var imagen:UIImage = UIImage()
        
        //Creates a default configuration object that uses the disk-persisted global cache, credential and cookie storage objects.
        //Creamos la sesion
        let session = URLSession(configuration: .default)
        
        //Obtengo la URL definiendola del tipo data, el cod de respuesta y el error
        session.dataTask(with: imgURL) { (data, response, error) in
            //Una vez descargada la imagen puedo tratarla
            //Comprobamos que no se haya producido ningun error
            if let e = error {
                print("Error downloading image: \(e)")
            } else {
                // Tratamos la respuesta de la URL
                //Comprobamos el tipo de respuesta obtenida
                if let res = response as? HTTPURLResponse {
                    print("Downloaded image with response code \(res.statusCode)") //200 todo OK
                    //Tratamos el data obtenido de la URL
                    if let imageData = data {
                        // Convertimos la imagen del tipo data a una UIImage para poder enviarla en el completion
                        completion(UIImage(data: imageData)!)
                    } else {
                        print("Couldn't get image: Image is nil") //No se ha podido obtener el recurso
                    }
                } else {
                    print("Couldn't get response code for some reason") //El servidor no esta accesible
                }
            }
            }.resume()
    }}
/*import UIKit
class Tools{
    
    func parseCSVBreed(breeds: inout [dogBreed]) {
        
        //Obtengo el fichero y su tipo
        let path = Bundle.main.path(forResource: "dogBreeds", ofType: "csv")!
        
        do{
            
            //Utilizo la librería para obtener la decodificación
            let csv = try CSV(contentsOfURL: path)
            
            
            //Recorro el fichero por filas y lo guardo en el array
            for row in csv.rows {
                breeds.append(dogBreed(id: row["id"]!,
                    name: row["name"]!,
                    country: row["country"]!,
                    image: row["image"]! != "" ? row["image"]! : "null"))
            }
            
        } catch let error as NSError {
            print("Error decodificando el CSV", error)
        }
        
    }
    
    func getImage(imagenURL:String, completion: @escaping (_ image: UIImage?) -> ()) {
        
        let imgURL = URL(string: imagenURL)!
        //var imagen:UIImage = UIImage()
        
        //Creates a default configuration object that uses the disk-persisted global cache, credential and cookie storage objects.
        //Creamos la sesion
        let session = URLSession(configuration: .default)
        
        //Obtengo la URL definiendola del tipo data, el cod de respuesta y el error
        session.dataTask(with: imgURL) { (data, response, error) in
            //Una vez descargada la imagen puedo tratarla
            //Comprobamos que no se haya producido ningun error
            if let e = error {
                print("Error downloading image: \(e)")
            } else {
                // Tratamos la respuesta de la URL
                //Comprobamos el tipo de respuesta obtenida
                if let res = response as? HTTPURLResponse {
                    print("Downloaded image with response code \(res.statusCode)") //200 todo OK
                    //Tratamos el data obtenido de la URL
                    if let imageData = data {
                        // Convertimos la imagen del tipo data a una UIImage para poder enviarla en el completion
                        completion(UIImage(data: imageData)!)
                    } else {
                        print("Couldn't get image: Image is nil") //No se ha podido obtener el recurso
                    }
                } else {
                    print("Couldn't get response code for some reason") //El servidor no esta accesible
                }
            }
            }.resume()
    }}
*/
