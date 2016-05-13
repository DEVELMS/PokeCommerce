//
//  TransactionController.h
//  desafio-stone
//
//  Created by Lucas M Soares on 09/05/16.
//  Copyright © 2016 Lucas M Soares. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PokemonModel.h"
#import <TPKeyboardAvoiding/TPKeyboardAvoidingScrollView.h>

@interface PurchaseController : UIViewController

@property PokemonModel *pokemon;

@property (weak, nonatomic) IBOutlet TPKeyboardAvoidingScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *productPrice;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *userCardFlag;
@property (weak, nonatomic) IBOutlet UITextField *userCardNumber;
@property (weak, nonatomic) IBOutlet UITextField *userCardYear;
@property (weak, nonatomic) IBOutlet UITextField *userCardMonth;
@property (weak, nonatomic) IBOutlet UITextField *userCardCVV;
@property (weak, nonatomic) IBOutlet UIButton *purchaseButton;

- (IBAction)buyPokemon:(id)sender;

@end
