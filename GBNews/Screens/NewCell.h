//
//  NewCell.h
//  GBNews
//
//  Created by Vitaly Prosvetov on 11.03.2021.
//

#import <UIKit/UIKit.h>
#import "New.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewCell : UITableViewCell

- (void)setWith:(New *)theNew;

@end

NS_ASSUME_NONNULL_END
