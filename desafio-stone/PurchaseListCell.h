//
//  PurchaseListCell.h
//  desafio-stone
//
//  Created by Lucas M Soares on 13/05/16.
//  Copyright © 2016 Lucas M Soares. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PurchaseModel.h"

@interface PurchaseListCell : UITableViewCell

@property PurchaseModel *purchase;

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *timestamp;

- (void)init:(PurchaseModel *)purchase;

@end
