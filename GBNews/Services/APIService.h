//
//  APIService.h
//  GBNews
//
//  Created by Vitaly Prosvetov on 10.03.2021.
//

#import <Foundation/Foundation.h>
#import "New.h"

NS_ASSUME_NONNULL_BEGIN

@interface APIService : NSObject

+ (instancetype)sharedInstance;
- (void)loadNews:(void (^)(NSArray *news))completion;

@end

NS_ASSUME_NONNULL_END
