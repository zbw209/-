#!/bin/sh

#  BlockScript.sh
#  StudyNotes
#
#  Created by zhoubiwen on 2020/5/8.
#  Copyright © 2020 zhou. All rights reserved.


echo "请输入需要编译为C++文件的文件名:"
read name

# -fobjc-arc -fobjc-runtime=macosx-10.7
#-isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk

xcrun -sdk iphonesimulator clang -x objective-c -fobjc-arc -fobjc-runtime=macosx-10.7 -rewrite-objc ${name}

#BlockViewController.m
