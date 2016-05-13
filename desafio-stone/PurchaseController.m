//
//  TransactionController.m
//  desafio-stone
//
//  Created by Lucas M Soares on 09/05/16.
//  Copyright © 2016 Lucas M Soares. All rights reserved.
//

#import "PurchaseController.h"
#import "PurchaseProtocol.h"
#import "PurchaseModel.h"
#import "Extensions.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <SIAlertView/SIAlertView.h>

@interface PurchaseController () <PurchaseDelegate, UITextFieldDelegate>

@end

@implementation PurchaseController {

    PurchaseModel *purchase;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self selfStyles];
    [self setAttributes];
}

- (void)selfStyles {

    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    
    UIImage *arrow = [[UIImage alloc] imageWithSize:[UIImage imageNamed:@"arrow_down"] scaledToSize:CGSizeMake(40, 40)];
    
    toolbar.items = [NSArray arrayWithObjects:
                     [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                     [[UIBarButtonItem alloc]initWithImage:arrow style:UIBarButtonItemStyleDone target:self action:@selector(ResignTF)], nil];
    
    toolbar.backgroundColor = [UIColor darkGrayColor];

    self.userCardFlag.inputAccessoryView = toolbar;
    self.userCardNumber.inputAccessoryView = toolbar;
    self.userCardYear.inputAccessoryView = toolbar;
    self.userCardMonth.inputAccessoryView = toolbar;
    self.userCardCVV.inputAccessoryView = toolbar;
}

- (void)setAttributes {
    
    self.productName.text = self.pokemon.name;
    self.productPrice.text = [NSString stringWithFormat:@"R$ %.00lf,00",self.pokemon.price];
    
    [self.productImage sd_setImageWithURL:[NSURL URLWithString:_pokemon.imageURL] placeholderImage:[UIImage imageNamed:@"pokemon_img"]];
}

- (void)ResignTF {
    
    for (id tf in self.scrollView.subviews) {
        if ([tf isKindOfClass:[UITextField class]]) {
            [tf resignFirstResponder];
        }
    }
}

- (bool)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return NO;
}

- (IBAction)buyPokemon:(id)sender {
    
    BOOL found = FALSE;
    
    for (id tf in self.scrollView.subviews) {
        
        UITextField *tf_ = tf;
        
        if ([tf isKindOfClass:[UITextField class]] && tf_.text.length == 0) {
            
            found = YES;
        }
    }
    
    if (!found) {
     
        [self.view addLoading];
        
        purchase = [[PurchaseModel alloc] init];
        purchase.delegate = self;
        
        purchase.productName = self.pokemon.name;
        purchase.productPrice = self.pokemon.price;
        purchase.userName = self.userName.text; //@"Lucas M Soares";
        purchase.cardFlag = self.userCardFlag.text; //@"MasterCard";
        purchase.cardNumber = self.userCardNumber.text; //@"1234-5678-7654-3210";
        purchase.cardYear = [self.userCardYear.text intValue]; //2020;
        purchase.cardMonth = [self.userCardMonth.text intValue]; //10;
        purchase.cardCVV = [self.userCardCVV.text intValue]; //123;
        
        [purchase makePurchase];
    }
    else {
    
        SIAlertView *alertView = [[SIAlertView alloc] initWithTitle:@"Poke Commerce" andMessage:@"Para efetuar uma compra você precisa preencher todos os campos"];
        
        [alertView addButtonWithTitle:@"Ok" type:SIAlertViewButtonTypeDestructive handler:^(SIAlertView *alert) {
        }];
        
        alertView.transitionStyle = SIAlertViewTransitionStyleBounce;
        
        [alertView show];
    }
}

#pragma mark - PurchaseDelegate methods

- (void)purchaseResponse:(id)response {
    
    [self.view removeLoading];
    
    SIAlertView *alertView = [[SIAlertView alloc] initWithTitle:@"Poke Commerce" andMessage:@"Sua compra foi concluída, obrigado!"];
    
    [alertView addButtonWithTitle:@"Ok" type:SIAlertViewButtonTypeDestructive handler:^(SIAlertView *alert) {
    }];
    
    alertView.transitionStyle = SIAlertViewTransitionStyleBounce;
    
    [alertView show];
}

- (void)purchaseResponseFail:(id)response {
    
    [self.view removeLoading];
    
    SIAlertView *alertView = [[SIAlertView alloc] initWithTitle:@"Poke Commerce" andMessage:@"Sua compra não pôde ser finalizada, verifique sua conexão de internet e tente novamente"];
    
    [alertView addButtonWithTitle:@"Ok" type:SIAlertViewButtonTypeDestructive handler:^(SIAlertView *alert) {
    }];
    
    alertView.transitionStyle = SIAlertViewTransitionStyleBounce;
    
    [alertView show];
}

@end
