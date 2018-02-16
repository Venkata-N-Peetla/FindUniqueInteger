//
//  ViewController.m
//  FindUniqueInteger
//
//  Created by Venkata Narasimham Peetla on 2/15/18.
//  Copyright © 2018 PEETLA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Complexity: O(n) time and O(n) space.
NSNumber *FindUniqueDeliveryId(NSArray<NSNumber *> *deliveryIds) {
    NSMutableDictionary<NSNumber*, NSNumber*> *idsToOccurrences = [NSMutableDictionary new];
    NSNumber *uniqueId;
    NSNumber *deliveryValue;

    for (NSNumber *deliveryId in deliveryIds) {
        //deliveryValue will be nil, if the key doesn't exist in dictionary.
        deliveryValue = idsToOccurrences[deliveryId];

        if (deliveryValue) {
            deliveryValue = @(deliveryValue.integerValue + 1);
        }
        else {
            deliveryValue = @(1);
        }

        idsToOccurrences[deliveryId] = deliveryValue;
    }

    for (NSNumber *key in idsToOccurrences) {
        if (idsToOccurrences[key].integerValue == 1) {
            uniqueId = key;
        }
    }

    return uniqueId;
}

//Complexity: O(n) time, and O(1) space.
NSNumber *PVFindUniqueDeliveryId(NSArray<NSNumber *> *deliveryIds) {

    NSInteger uniqueDeliveryId = 0;

    for (NSNumber *currentId in deliveryIds) {
        uniqueDeliveryId ^= currentId.integerValue;
    }

    return @(uniqueDeliveryId);
}

@end
