//
//  TRUntils.m
//  Album
//
//  Created by tarena on 14-4-12.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRUntils.h"
#import "TRAlbum.h"

@implementation TRUntils
+(NSMutableArray*)createAlbumsByPath:(NSString*)path {
    NSMutableArray *albums = [@[]mutableCopy];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *fileNames = [fm contentsOfDirectoryAtPath:path error:nil];
    for (NSString *fileName in fileNames) {
        NSString *filePath = [path stringByAppendingPathComponent:fileName];
        BOOL isDirectory;
        if ([fm fileExistsAtPath:filePath isDirectory:&isDirectory]&&isDirectory) {
            TRAlbum *album = [[TRAlbum alloc]init];
            album.name = fileName;
            NSArray *imageNames = [fm contentsOfDirectoryAtPath:filePath error:nil];
            for (NSString *imageName in imageNames) {
                if ([imageName hasSuffix:@"jpg"]) {
                    NSString *imagePath = [filePath stringByAppendingPathComponent:imageName];
                    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
                    [album.images addObject:image];
                }
            }
            [albums addObject:album];
        }
    }
    
    
    return albums;
}
@end
