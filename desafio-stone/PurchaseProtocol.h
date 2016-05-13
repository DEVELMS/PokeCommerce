//
//  TransactionProtocol.h
//  desafio-stone
//
//  Created by Lucas Miranda Soares on 10/05/16.
//  Copyright © 2016 Lucas M Soares. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PurchaseDelegate <NSObject>

- (void)purchaseResponse:(id)response;
- (void)purchaseResponseFail:(id)response;

@end
