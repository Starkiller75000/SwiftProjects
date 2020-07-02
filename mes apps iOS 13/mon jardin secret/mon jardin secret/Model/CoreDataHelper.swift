//
//  CoreDataHelper.swift
//  mon jardin secret
//
//  Created by Benoît Bouton on 29/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit
import CoreData

class CoreDataHelper {
    private var _appDel = UIApplication.shared.delegate as! AppDelegate
    var context: NSManagedObjectContext {
        return _appDel.persistentContainer.viewContext
    }
    var simpleCompletion: ((_ err: String?) -> Void)?
    
    func getAlbums(_ completion: ((_ albums: [Album], _ errString: String?) -> ())?) {
        let request: NSFetchRequest<Album> = Album.fetchRequest()
        let sort: NSSortDescriptor  = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [sort]
        do {
            let albums = try context.fetch(request)
            completion?(albums, nil)
        } catch {
            completion?([], error.localizedDescription)
        }
    }
    
    func allElementsFrom(album: Album, completion: (([Element]) -> ())?) {
        let elements = album.elements?.allObjects as? [Element]
        let sorted = elements?.sorted(by: {$0.date! > $1.date!})
        completion?((sorted) ?? [])
    }
    
    func save() {
        do {
            try context.save()
            simpleCompletion?(nil)
        } catch {
            simpleCompletion?(error.localizedDescription)
        }
    }
    
    func addAlbum(_ name: String?, _ completion: ((_ err: String?) -> Void)?) {
        self.simpleCompletion = completion
        if let n = name, name != "" {
            let newAlbum = Album(context: context)
            newAlbum.name = n
            newAlbum.date = Date()
            context.insert(newAlbum)
            save()
        } else {
            completion?("Aucun texte entré")
        }
    }
    
    func addElement(_ name: String?, _ desc: String?, _ image: UIImage?, _ album: Album, _ completion: ((_ err: String?) -> Void)?) {
        self.simpleCompletion = completion
        let newElement = Element(context: context)
        newElement.album = album
        newElement.date = Date()
        newElement.image = image
        newElement.desc = desc
        newElement.name = name
        context.insert(newElement)
        save()
    }
    
    func deleteAlbum(_ album: Album, _ completion: ((_ err: String?) -> Void)?) {
        self.simpleCompletion = completion
        if let elements = album.elements?.allObjects as? [Element] {
            elements.forEach { (e) in
                context.delete(e)
            }
        }
        context.delete(album)
        save()
    }
    
    func deleteElement(_ element: Element, _ completion: ((_ err: String?) -> Void)?) {
        self.simpleCompletion = completion
        context.delete(element)
        save()
    }
}
