//
//  APIService.m
//  GBNews
//
//  Created by Vitaly Prosvetov on 10.03.2021.
//

#import "APIService.h"

#define TOKEN @"cdbf2e5a51c941a7a0651e330a581e5e"
#define API_URL_FOR_RUSSIA @"https://newsapi.org/v2/top-headlines?country=ru&apiKey=cdbf2e5a51c941a7a0651e330a581e5e"

@implementation APIService

+ (instancetype)sharedInstance
{
    static APIService *instance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [[APIService alloc] init];
    });
    
    return instance;
}

- (void)loadNews:(void (^)(NSArray *news))completion {
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:API_URL_FOR_RUSSIA] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^{
            NSDictionary *response = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            if (response) {
                NSArray *articles = [response valueForKey:@"articles"];
                NSMutableArray *news = [NSMutableArray new];
                
                for (NSDictionary *article in articles) {
                    
                    New *new = [[New alloc] initWithDictionary:article];
                    if (new) {
                        [news addObject:new];
                    }
                }
                completion(news);
            }
        });
    }] resume];
}

- (void)downloadPhotoFrom:(NSString *)urlString to:(UIImageView *)imageView {
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            dispatch_async(dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^{
                if (data) {
                    UIImage *image = [[UIImage alloc] initWithData:data];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        imageView.image = image;
                    });
                }
            });
        }] resume];
}

@end
