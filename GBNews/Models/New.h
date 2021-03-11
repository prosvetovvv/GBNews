//
//  New.h
//  GBNews
//
//  Created by Vitaly Prosvetov on 10.03.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface New : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *theDescription;
@property (nonatomic, strong) NSDate *datePublished;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
