//
//  PurchaseListModel.m
//  desafio-stone
//
//  Created by Lucas M Soares on 13/05/16.
//  Copyright © 2016 Lucas M Soares. All rights reserved.
//

#import "PurchaseListModel.h"
#import "AppDelegate.h"
#import "PurchaseModel.h"
#import <CoreData/CoreData.h>

@implementation PurchaseListModel {

    NSManagedObjectContext *context;
}

- (id)init {
    
    if ( self = [super init] ) {
        
        [self prepareModel];
    }
    return self;
}

- (void)prepareModel {
    
    AppDelegate *apd = [[UIApplication sharedApplication] delegate];
    context = [apd managedObjectContext];
}

- (NSArray *)getPurchases {
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Purchase"];
    [request setResultType:NSDictionaryResultType];
    
    NSError *error = nil;
    
    NSArray *result = [context executeFetchRequest:request error:&error];
    
    if (error == nil) {
        
        if (result.count > 0) {
            
            NSMutableArray *purchases = [[NSMutableArray alloc] init];
            
            for (int i = 0; i < result.count; i++) {
                
                PurchaseModel *purchase = [[PurchaseModel alloc] init];
                
                NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                [dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm:ss"];
                
                purchase.userName = result[i][@"user_name"];
                purchase.productName = result[i][@"product_name"];
                purchase.productPrice = [result[i][@"product_price"] doubleValue];
                purchase.timestamp = [dateFormatter stringFromDate:result[i][@"timestamp"]];
                
                [purchases addObject:purchase];
            }
            
            return purchases;
        }
        
        return nil;
    }
    else {
        
        NSLog(@"get purchases with error: %@", error);
        
        return nil;
    }
}

@end
