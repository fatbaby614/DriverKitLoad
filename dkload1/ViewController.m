//
//  ViewController.m
//  dkload1
//
//  Created by Huion on 2020/12/18.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)BtnLoadClick:(id)sender {
    OSSystemExtensionRequest * actReq =[OSSystemExtensionRequest activationRequestForExtension:@"com.tanhuang.dk1" queue:dispatch_get_main_queue()];
    actReq.delegate = self;
    [OSSystemExtensionManager.sharedManager submitRequest:actReq];
}

- (IBAction)BtnUnloadClick:(id)sender {
    OSSystemExtensionRequest * actReq = [OSSystemExtensionRequest deactivationRequestForExtension:@"com.tanhuang.dk1" queue:dispatch_get_main_queue()];
    actReq.delegate = self;
    [OSSystemExtensionManager.sharedManager submitRequest:actReq];
}

- (OSSystemExtensionReplacementAction)request:(OSSystemExtensionRequest *)request actionForReplacingExtension:(OSSystemExtensionProperties *)existing withExtension:(OSSystemExtensionProperties *)ext
{
    NSLog(@"sysex actionForReplacingExtension %@ %@",existing,ext);
    return OSSystemExtensionReplacementActionReplace;
}

-(void)requestNeedsUserApproval:(OSSystemExtensionRequest *)request
{
    NSLog(@"sysex needsUserApproval");
}

- (void)request:(OSSystemExtensionRequest *)request didFinishWithResult:(OSSystemExtensionRequestResult)result
{
    NSLog(@"sysex didFinishWithResult");
}

- (void)request:(nonnull OSSystemExtensionRequest *)request didFailWithError:(nonnull NSError *)error {
    NSLog(@"sysex didFailWithError %@",error);
}

- (BOOL)commitEditingAndReturnError:(NSError *__autoreleasing  _Nullable * _Nullable)error {
    NSLog(@"sysex commitEditingAndReturnError ");
    return FALSE;
}

- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    NSLog(@"sysex encodeWithCoder %@",coder);
}

@end
