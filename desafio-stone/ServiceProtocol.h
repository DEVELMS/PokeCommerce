//
//  teste.h
//  desafio-stone
//
//  Created by Lucas M Soares on 08/05/16.
//  Copyright © 2016 Lucas M Soares. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ServiceProtocolDelegate <NSObject>

typedef enum requestType {
    
    Get,
    Post
    
} requestType;

- (void)requestResponseComplete:(id)response;
- (void)requestResponseFail:(id)error;

@end
