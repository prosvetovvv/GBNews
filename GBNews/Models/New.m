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
        //NSLog(@"%@", [dictionary valueForKey:@"title"]);
        _title = [dictionary valueForKey:@"title"];
        if (!_title) _title = @"!!!!";
        
        //_title = [dictionary objectForKey:@"title"] ?: @"!!!!!!!";
        //NSLog(@"%@", [dictionary valueForKey:@"description"]);
        
        _theDescription = [dictionary valueForKey:@"description"];
        if (!_theDescription) _theDescription = @"!!!!!";
        //_theDescription = [dictionary objectForKey:@"description"] ?: @"!!!!!!!";
        
        //NSLog(@"%@", [dictionary valueForKey:@"publishedAt"]);
        _datePublished = [self dateFromString:[dictionary valueForKey:@"publishedAt"]];
        //_datePublished = [self dateFromString:[dictionary objectForKey:@"publishedAt"]] ?: @"!!!!!!!";
    }
    
    return self;
}

- (NSDate *)dateFromString:(NSString *)dateString
{
    //if (!dateString) { return  nil; }
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    if (!dateString) return [NSDate date];
    
    NSString *correctStringDate = [dateString stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    correctStringDate = [correctStringDate stringByReplacingOccurrencesOfString:@"Z" withString:@" "];
    
    return [dateFormatter dateFromString:correctStringDate];
}

@end
