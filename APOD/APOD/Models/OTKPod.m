//
//  OTKPod.m
//  APOD
//
//  Created by Tobi Kuyoro on 21/05/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

#import "OTKPod.h"

@implementation OTKPod

- (instancetype)initWithDate:(NSDate *)date
                 explanation:(NSString *)explanation
                    imageURL:(NSURL *)imageURL
                       title:(NSString *)title {
    self = [super init];
    if (self) {
        _date = date;
        _explanation = [explanation copy];
        _imageURL = imageURL;
        _title = [title copy];
    }

    return self;
}

@end
