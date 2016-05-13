//
//  TransactionModel.m
//  desafio-stone
//
//  Created by Lucas M Soares on 09/05/16.
//  Copyright © 2016 Lucas M Soares. All rights reserved.
//

#import "PurchaseModel.h"
#import "Service.h"
#import "Constants.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@implementation PurchaseModel {
    
    Service *service;
    NSManagedObjectContext *context;
}

- (id)init {
    
    if ( self = [super init] ) {
        
        [self prepareModel];
    }
    return self;
}

- (void)prepareModel {
    
    service = [[Service alloc] init];
    service.delegate = self;
    
    AppDelegate *apd = [[UIApplication sharedApplication] delegate];
    context = [apd managedObjectContext];
}

- (void)makePurchase {

    NSDictionary *purchaseDict = @{ @"price" : [NSNumber numberWithDouble:self.productPrice],
                                    @"product" : self.productName,
                                    @"user": self.userName,
                                    @"card_flag": self.cardFlag,
                                    @"card_number": self.cardNumber,
                                    @"card_year": [NSNumber numberWithInt:self.cardYear],
                                    @"card_month": [NSNumber numberWithInt:self.cardMonth],
                                    @"cvv": [NSNumber numberWithInt:self.cardCVV] };
    
    [service requestService:Post parameters:purchaseDict URL:purchaseURL];
}

- (void)addPurchaseToDatabase {
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Purchase" inManagedObjectContext:context];
    
    NSManagedObject *newPurchase = [[NSManagedObject alloc] initWithEntity:entityDesc insertIntoManagedObjectContext:context];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString: [dateFormatter stringFromDate:[NSDate date]]];
    
    [newPurchase setValue:self.userName forKey:@"user_name"];
    [newPurchase setValue:self.productName forKey:@"product_name"];
    [newPurchase setValue:[NSNumber numberWithDouble:self.productPrice] forKey:@"product_price"];
    [newPurchase setValue:date forKey:@"timestamp"];
    
    NSError *error;
    [context save:&error];
}

#pragma mark - ServiceProtocolDelegate methods

- (void)requestResponseComplete:(id)response {
    
    if ([self.delegate respondsToSelector:@selector(purchaseResponse:)]) {
        
        [self addPurchaseToDatabase];
        
        [self.delegate purchaseResponse:self];
    }
}

- (void)requestResponseFail:(id)error {
    
    NSLog(@"REQUEST RESPONSE ERRO: %@", error);
    
    if ([self.delegate respondsToSelector:@selector(purchaseResponseFail:)]) {
        
        [self.delegate purchaseResponseFail:error];
    }
}

@end
