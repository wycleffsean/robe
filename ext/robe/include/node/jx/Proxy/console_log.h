// Copyright & License details are available under JXCORE_LICENSE file

#ifndef SRC_JX_PROXY_H_
#define SRC_JX_PROXY_H_
#include <string>
#include <stdlib.h>

#if defined(__ANDROID__) && defined(JXCORE_EMBEDDED)
#ifndef JXCORE_ALOG_TAG
#define JXCORE_ALOG_TAG "jxcore-log"
#endif
#include <android/log.h>
#define log_console(...) \
  __android_log_print(ANDROID_LOG_INFO, JXCORE_ALOG_TAG, __VA_ARGS__)
#define flush_console(...) \
  __android_log_print(ANDROID_LOG_INFO, JXCORE_ALOG_TAG, __VA_ARGS__)
#define error_console(...) \
  __android_log_print(ANDROID_LOG_ERROR, JXCORE_ALOG_TAG, __VA_ARGS__)
#define warn_console(...) \
  __android_log_print(ANDROID_LOG_WARN, JXCORE_ALOG_TAG, __VA_ARGS__)
#elif defined(WINONECORE)
#include <windows.h>
static inline void DebuggerOutput_(const char* ctstr, ...) {
  char *str = (char*) malloc(65536 * sizeof(char));
  if (str == NULL) {
    if (IsDebuggerPresent()) {
      OutputDebugStringA("jxcore :: Unable to log (Out of memory)");
    } else {
      printf("jxcore :: Unable to log (Out of memory)\n");
    }
    return;
  }
  va_list ap;
  va_start(ap, ctstr);
  const unsigned pos = vsnprintf(str, 65536, ctstr, ap);
  va_end(ap);
  str[pos] = '\0';

  if (IsDebuggerPresent()) {
    OutputDebugStringA(str);
    free(str);
  }
  else {
    CHAR Buffer[256];
    DWORD length = GetTempPathA(256, Buffer);
    if (length == 0) {
      printf("jxcore :: Could not get the temp folder\n");
      free(str);
      return;
    }
    memcpy(Buffer + length, "\\jxcore-windows.log", sizeof(CHAR) * 19);
    Buffer[length + 19] = CHAR(0);

    HANDLE hFile = CreateFile(Buffer,
      FILE_APPEND_DATA,         // open for writing
      FILE_SHARE_READ,          // allow multiple readers
      NULL,                     // no security
      OPEN_ALWAYS,              // open or create
      FILE_ATTRIBUTE_NORMAL,    // normal file
      NULL);

    if (hFile == INVALID_HANDLE_VALUE) {
      printf("jxcore :: Could not open jxcore-windows.log file\n");
      free(str);
      return;
    }

    DWORD  dwBytesWritten;
    unsigned size_left = pos;
    char *tmp = str;
    while (size_left > 0) {
      WriteFile(hFile, str, size_left, &dwBytesWritten, NULL);
      size_left -= dwBytesWritten;
      str += dwBytesWritten;
    }

    free(tmp);

    CloseHandle(hFile);
  }
}
#define log_console(...) DebuggerOutput_(__VA_ARGS__)
#define warn_console(...) DebuggerOutput_(__VA_ARGS__)
#define error_console(...) DebuggerOutput_(__VA_ARGS__)
#define flush_console(...) DebuggerOutput_(__VA_ARGS__)
#else
#define log_console(...) fprintf(stdout, __VA_ARGS__)
#define flush_console(...)        \
  do {                            \
    fprintf(stdout, __VA_ARGS__); \
    fflush(stdout);               \
  } while (0)
#define error_console(...) fprintf(stderr, __VA_ARGS__)
#define warn_console(...) fprintf(stderr, __VA_ARGS__)
#endif
#endif
