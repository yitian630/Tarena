//
//  RecordButton.m
//  TLBS
//
//  Created by tarena on 14-4-8.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "RecordButton.h"

@implementation RecordButton

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self addTarget:self action:@selector(beginAction) forControlEvents:UIControlEventTouchDown];
        [self addTarget:self action:@selector(endAction) forControlEvents:UIControlEventTouchUpInside];
        //初始化录制
        [self initRecord];
        
       
    }
    return self;
}
- (void)initRecord{
    //录制caf格式的路径
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/temp.caf"];
    NSURL *recordedFileURL = [[NSURL alloc] initFileURLWithPath:path] ;
    
    //录音设置
    NSMutableDictionary *settings = [[NSMutableDictionary alloc] init];
    //录音格式 无法使用
    [settings setValue :[NSNumber numberWithInt:kAudioFormatLinearPCM] forKey: AVFormatIDKey];
    //采样率
    [settings setValue :[NSNumber numberWithFloat:11025.0] forKey: AVSampleRateKey];//44100.0
    //通道数
    [settings setValue :[NSNumber numberWithInt:2] forKey: AVNumberOfChannelsKey];
    //音频质量,采样质量
    [settings setValue:[NSNumber numberWithInt:AVAudioQualityMin] forKey:AVEncoderAudioQualityKey];
    
    
    //创建录音对象
    self.recorder = [[AVAudioRecorder alloc] initWithURL:recordedFileURL settings:settings error:nil];
    [self.recorder prepareToRecord];
    

    
}
-(void)beginAction{
      [self.recorder record];
}

-(void)endAction{
    [self.recorder stop];
    
    //转换格式
    [self convertCafToMp3];
    //发送音频 把歌曲转成data 再转成base64就可以发送了
     NSString *mp3FilePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/recode.mp3"];
    NSData *audioData = [NSData dataWithContentsOfFile:mp3FilePath];
    
    self.player = [[AVAudioPlayer alloc]initWithData:audioData error:Nil];
    [self.player play];
   
    
  
}

//把caf格式转换成MP3格式 目的：压缩文件
-(void)convertCafToMp3{
    NSString *cafFilePath =  [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/temp.caf"];
    NSString *mp3FilePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/recode.mp3"];
    @try {
        int read, write;
        
        FILE *pcm = fopen([cafFilePath cStringUsingEncoding:1], "rb");  //source 被转换的音频文件位置
        fseek(pcm, 4*1024, SEEK_CUR);                                   //skip file header
        FILE *mp3 = fopen([mp3FilePath cStringUsingEncoding:1], "wb");  //output 输出生成的Mp3文件位置
        
        const int PCM_SIZE = 8192;
        const int MP3_SIZE = 8192;
        short int pcm_buffer[PCM_SIZE*2];
        unsigned char mp3_buffer[MP3_SIZE];
        
        lame_t lame = lame_init();
        lame_set_in_samplerate(lame, 11025.0);
        lame_set_VBR(lame, vbr_default);
        lame_init_params(lame);
        
        do {
            read = fread(pcm_buffer, 2*sizeof(short int), PCM_SIZE, pcm);
            if (read == 0)
                write = lame_encode_flush(lame, mp3_buffer, MP3_SIZE);
            else
                write = lame_encode_buffer_interleaved(lame, pcm_buffer, read, mp3_buffer, MP3_SIZE);
            
            fwrite(mp3_buffer, write, 1, mp3);
            
        } while (read != 0);
        
        lame_close(lame);
        fclose(mp3);
        fclose(pcm);
    }
    @catch (NSException *exception) {
        NSLog(@"%@",[exception description]);
    }
}

@end
