//
//  TransactionModel.h
//  desafio-stone
//
//  Created by Lucas M Soares on 09/05/16.
//  Copyright © 2016 Lucas M Soares. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceProtocol.h"
#import "PurchaseProtocol.h"

@protocol PurchaseDelegate;

@interface PurchaseModel : UIViewController <ServiceProtocolDelegate>

@property (nonatomic, weak) id<PurchaseDelegate> delegate;
@property double productPrice;
@property NSString *productName;
@property NSString *userName;
@property NSString *cardNumber;
@property NSString *cardFlag;
@property int cardYear;
@property int cardMonth;
@property int cardCVV;
@property NSString *timestamp;

- (void)makePurchase;

@end
