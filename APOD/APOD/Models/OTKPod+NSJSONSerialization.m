//
//  OTKPod+NSJSONSerialization.m
//  APOD
//
//  Created by Tobi Kuyoro on 22/05/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

#import "OTKPod+NSJSONSerialization.h"

@implementation OTKPod (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *dateString = dictionary[@"date"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"ddMMyyyy"];

    NSDate *date = [dateFormatter dateFromString:dateString];
    NSString *explanation = dictionary[@"explanation"];
    NSString *urlString = dictionary[@"url"];
    NSURL *imageURL = [NSURL URLWithString:urlString];
    NSString *title = dictionary[@"title"];

    OTKPod *pictureOD = [[OTKPod alloc] initWithDate:date
                                         explanation:explanation
                                            imageURL:imageURL
                                               title:title];
    return pictureOD;
}

@end
