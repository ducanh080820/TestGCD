//
//  ViewController.swift
//  TestGCD
//
//  Created by Trần Đức Anh on 10/27/18.
//  Copyright © 2018 Trần Đức Anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        simpleQueue()
        
//        simpleConcurrentQueue()
        simpleDispatchWorkItem()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func simpleQueue() {
//        let serialQueue = DispatchQueue(label: "com.bigZero.serialQueue")
//
//        for i in 1...5 {
//            serialQueue.sync {                                        //Sync or Async
//                print("Task \(i): - \(Thread.current)")
//
//                sleep(1)
//            }
//        }
//        print("Complete! - \(Thread.current)")
//    }
//                                                                              //concurrent with Async
//    func simpleConcurrentQueue() {
//        let concurrentQueue = DispatchQueue(label: "com.bigZero.concurrentQueue", attributes: .concurrent)
//
//        for i in 1...10 {
//            concurrentQueue.async {
//                print("Task \(i) - \(Thread.current)")
//                sleep(1)
//            }
//        }
//        print("Complete! - \(Thread.current)")
//    }
//                                                                        //Racing data and Dispatch AsyncAfter
//    func simpleConcurrentQueue() {
//    let queue = DispatchQueue(label: "com.bigZero.queue", attributes: .concurrent)
//    var count = 0
//        for _ in 0...25000 {
//            queue.async {
//                count += 1
//                print(count)
//            }
//        }
//    }
//
//    func simpleAsyncAfter() {
//        let queue = DispatchQueue(label: "com.bigZero.queue")
//        queue.asyncAfter(deadline: .now() + 2) {
//            print("Simple asyncAfter")
//        }
//    }
//                                                                    //DispatchWorkItem
    func simpleDispatchWorkItem() {
        var count = 0
        let item = DispatchWorkItem {
            count += 1
            print(count)
        }
        for _ in 1...1000 {
            if count == 990 {
                item.cancel()
                print("DispatchWorkItem cancel")
                break
            } else {
                item.perform()
            }
        }
    }
    
}
