//
//  PurchaseListCell.m
//  desafio-stone
//
//  Created by Lucas M Soares on 13/05/16.
//  Copyright © 2016 Lucas M Soares. All rights reserved.
//

#import "PurchaseListCell.h"

@implementation PurchaseListCell

- (void)init:(PurchaseModel *)purchase {
    
    self.purchase = purchase;
    
    self.name.text = self.purchase.productName;
    self.price.text = [NSString stringWithFormat:@"R$ %.00lf,00",self.purchase.productPrice];
    self.timestamp.text = self.purchase.timestamp;
}

@end
