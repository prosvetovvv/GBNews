//
//  NewCell.m
//  GBNews
//
//  Created by Vitaly Prosvetov on 11.03.2021.
//

#import "NewCell.h"
#import "APIService.h"

@interface NewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UIImageView *photoImageView;

@end

@implementation NewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.contentView.layer.shadowColor = [[[UIColor blackColor] colorWithAlphaComponent:0.2] CGColor];
        self.contentView.layer.shadowOffset = CGSizeMake(1.0, 1.0);
        self.contentView.layer.shadowRadius = 10.0;
        self.contentView.layer.shadowOpacity = 1.0;
        self.contentView.layer.cornerRadius = 6.0;
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        _titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _titleLabel.font = [UIFont systemFontOfSize: 20.0 weight:UIFontWeightBold];
        //_titleLabel.adjustsFontSizeToFitWidth = YES;
        //_titleLabel.minimumScaleFactor = 0.9;
        _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _titleLabel.numberOfLines = 3;
        //_titleLabel.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:_titleLabel];
        
        _dateLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _dateLabel.font = [UIFont systemFontOfSize:12.0 weight:UIFontWeightThin];
        //_dateLabel.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_dateLabel];
        
        _descriptionLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _descriptionLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
        _descriptionLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _descriptionLabel.numberOfLines = 6;
        //_descriptionLabel.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:_descriptionLabel];
        
        _photoImageView = [[UIImageView alloc] initWithImage:[UIImage systemImageNamed:@"photo"]];
        //_photoImageView.contentMode = UIViewContentModeScaleAspectFill;
        _photoImageView.contentMode = UIViewContentModeScaleToFill;
        //_photoImageView.contentMode = UIViewContentModeScaleAspectFit;
        _photoImageView.tintColor = [UIColor grayColor];
        [self.contentView addSubview:_photoImageView];
        
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.contentView.frame = CGRectMake(10.0, 10.0, [UIScreen mainScreen].bounds.size.width - 20.0, self.frame.size.height - 20.0);
    
    self.titleLabel.frame = CGRectMake(10.0, 10.0, self.contentView.frame.size.width - 20.0, 80.0);
    [self.titleLabel sizeToFit];
    
    self.dateLabel.frame = CGRectMake(10.0, CGRectGetMaxY(self.titleLabel.frame) + 5.0, self.contentView.frame.size.width - 20.0, 20.0);
    
    self.descriptionLabel.frame = CGRectMake(10.0, CGRectGetMaxY(self.dateLabel.frame) + 10.0, self.contentView.frame.size.width - 20.0, 100.0);
    [self.descriptionLabel sizeToFit];
    
    self.photoImageView.frame = CGRectMake(10.0, CGRectGetMaxY(self.descriptionLabel.frame) + 25.0, self.contentView.frame.size.width - 20.0, 200.0);
}

- (void)setWith:(New *)theNew {
    self.titleLabel.text = theNew.title;
    self.descriptionLabel.text = theNew.theDescription;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"dd MMMM yyyy hh:mm";
    self.dateLabel.text = [dateFormatter stringFromDate:theNew.datePublished];
    
    if (theNew.urlPhoto) {
        [[APIService sharedInstance] downloadPhotoFrom:theNew.urlPhoto to:self.photoImageView];
    }
    
    [self layoutIfNeeded];
}

@end
