LOCAL_PATH := $(call my-dir)


include $(CLEAR_VARS)

SRCPATH := lib

LOCAL_CFLAGS	:= -D_FILE_OFFSET_BITS=64 -DFUSE_USE_VERSION=26
LOCAL_MODULE_TAGS := optional

LOCAL_MODULE    := libfuse_exfat
LOCAL_SRC_FILES := $(SRCPATH)/cuse_lowlevel.c 
LOCAL_SRC_FILES += $(SRCPATH)/fuse.c 
LOCAL_SRC_FILES += $(SRCPATH)/fuse_kern_chan.c 
LOCAL_SRC_FILES += $(SRCPATH)/fuse_loop.c 
LOCAL_SRC_FILES += $(SRCPATH)/fuse_loop_mt.c 
LOCAL_SRC_FILES += $(SRCPATH)/fuse_lowlevel.c 
LOCAL_SRC_FILES += $(SRCPATH)/fuse_mt.c 
LOCAL_SRC_FILES += $(SRCPATH)/fuse_opt.c 
LOCAL_SRC_FILES += $(SRCPATH)/fuse_session.c 
LOCAL_SRC_FILES += $(SRCPATH)/fuse_signals.c 
LOCAL_SRC_FILES += $(SRCPATH)/helper.c 
LOCAL_SRC_FILES += $(SRCPATH)/mount.c 
LOCAL_SRC_FILES += $(SRCPATH)/mount_util.c 
LOCAL_SRC_FILES += $(SRCPATH)/ulockmgr.c

LOCAL_SHARED_LIBRARIES := libdl
LOCAL_PRELINK_MODULE := false
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
include $(BUILD_SHARED_LIBRARY)


include $(CLEAR_VARS)

SRCPATH := libexfat

LOCAL_CFLAGS	:= -D_FILE_OFFSET_BITS=64 -DFUSE_USE_VERSION=26  -D__GLIBC__=1
LOCAL_MODULE_TAGS := optional

LOCAL_MODULE    := libexfat
LOCAL_SRC_FILES := $(SRCPATH)/cluster.c 
LOCAL_SRC_FILES += $(SRCPATH)/io.c 
LOCAL_SRC_FILES += $(SRCPATH)/log.c 
LOCAL_SRC_FILES += $(SRCPATH)/lookup.c 
LOCAL_SRC_FILES += $(SRCPATH)/mount.c 
LOCAL_SRC_FILES += $(SRCPATH)/node.c 
LOCAL_SRC_FILES += $(SRCPATH)/utf.c 
LOCAL_SRC_FILES += $(SRCPATH)/utils.c 

LOCAL_SHARED_LIBRARIES := libdl libfuse_exfat
LOCAL_PRELINK_MODULE := false
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_CFLAGS    := -D_FILE_OFFSET_BITS=64 -D__GLIBC__=1
LOCAL_C_INCLUDES := $(LOCAL_PATH)/libexfat
LOCAL_MODULE    := dumpexfat 
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := dump/main.c
LOCAL_SHARED_LIBRARIES := libexfat
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_CFLAGS    := -D_FILE_OFFSET_BITS=64 -D__GLIBC__=1
LOCAL_C_INCLUDES := $(LOCAL_PATH)/libexfat
LOCAL_MODULE    := fsck.exfat 
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := fsck/main.c
LOCAL_SHARED_LIBRARIES := libexfat
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_CFLAGS    := -D_FILE_OFFSET_BITS=64 -D__GLIBC__=1
LOCAL_C_INCLUDES := $(LOCAL_PATH)/libexfat
LOCAL_MODULE    := exfat.label 
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := label/main.c
LOCAL_SHARED_LIBRARIES := libexfat
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_CFLAGS    := -D_FILE_OFFSET_BITS=64 -D__GLIBC__=1
LOCAL_C_INCLUDES := $(LOCAL_PATH)/libexfat
LOCAL_MODULE    := mkfs.exfat 
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := mkfs/main.c mkfs/cbm.c mkfs/fat.c mkfs/rootdir.c mkfs/uct.c mkfs/vbr.c
LOCAL_SHARED_LIBRARIES := libexfat
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_CFLAGS    := -D_FILE_OFFSET_BITS=64 -DFUSE_USE_VERSION=26 -D__GLIBC__=1
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include $(LOCAL_PATH)/libexfat
LOCAL_MODULE    := mount.exfat 
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := fuse/main.c
LOCAL_SHARED_LIBRARIES := libfuse_exfat libexfat
include $(BUILD_EXECUTABLE)
