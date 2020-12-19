//
//  ViewController.swift
//  dkload1_swift
//
//  Created by Huion on 2020/12/19.
//

import Cocoa
import SystemExtensions
import os.log


class ViewController: NSViewController,OSSystemExtensionRequestDelegate{
    func request(_ request: OSSystemExtensionRequest, actionForReplacingExtension existing: OSSystemExtensionProperties, withExtension ext: OSSystemExtensionProperties) -> OSSystemExtensionRequest.ReplacementAction {
        os_log("sysex actionForReplacingExtension %@ %@", existing, ext)
        
        return .replace
    }
    
    func requestNeedsUserApproval(_ request: OSSystemExtensionRequest) {
        
            os_log("sysex needsUserApproval")
    }
    
    func request(_ request: OSSystemExtensionRequest, didFinishWithResult result: OSSystemExtensionRequest.Result) {
        os_log("sysex didFinishWithResult %@", result.rawValue)
    }
    
    func request(_ request: OSSystemExtensionRequest, didFailWithError error: Error) {
        
            os_log("sysex didFailWithError %@", error.localizedDescription)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func BtnLoadClick(_ sender: Any) {
        let dispathQueue:DispatchQueue = .main
        let activationRequest = OSSystemExtensionRequest.activationRequest(forExtensionWithIdentifier: "com.tanhuang.dk1", queue: dispathQueue)
        activationRequest.delegate = self
        OSSystemExtensionManager.shared.submitRequest(activationRequest)
    }
    @IBAction func BtnUnloadClick(_ sender: Any) {
        let dispathQueue:DispatchQueue = .main
        let activationRequest = OSSystemExtensionRequest.deactivationRequest(forExtensionWithIdentifier: "com.tanhuang.dk1", queue: dispathQueue)
        activationRequest.delegate = self
        OSSystemExtensionManager.shared.submitRequest(activationRequest)
    }
    
}

