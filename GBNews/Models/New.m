//
//  New.m
//  GBNews
//
//  Created by Vitaly Prosvetov on 10.03.2021.
//

#import "New.h"

@implementation New

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(self) {
        if ([dictionary valueForKey:@"title"] == (id)[NSNull null]  || [dictionary valueForKey:@"description"] == (id)[NSNull null]  || [dictionary valueForKey:@"publishedAt"] == (id)[NSNull null] ) {
            return nil;
        }
        _title = [dictionary valueForKey:@"title"];
        _theDescription = [dictionary valueForKey:@"description"];
        _datePublished = [self dateFromString:[dictionary valueForKey:@"publishedAt"]];
        _urlPhoto = [dictionary valueForKey:@"urlToImage"];
    }
    
    return self;
}

- (NSDate *)dateFromString:(NSString *)dateString
{
    if (!dateString) { return  nil; }
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSString *correctStringDate = [dateString stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    correctStringDate = [correctStringDate stringByReplacingOccurrencesOfString:@"Z" withString:@" "];
    
    return [dateFormatter dateFromString:correctStringDate];
}

@end
