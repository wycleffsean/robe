// Copyright & License details are available under JXCORE_LICENSE file

#ifndef SRC_JX_PROXY_MOZILLA_MOZJS_ISOLATE_H_
#define SRC_JX_PROXY_MOZILLA_MOZJS_ISOLATE_H_
#ifndef __POSIX__
#define EXPORT_JS_API
#endif

#ifndef JXCORE_PUBLIC
#ifdef _WIN32
#define JXCORE_PUBLIC __declspec(dllexport)
#else
#define JXCORE_PUBLIC
#endif
#endif

#include "jsapi.h"
#include "jsfriendapi.h"
#include "../../console_log.h"

#define JS_OBJECT_SLOT_COUNT 3
#define JS_NATIFIED_OBJECT_SLOT_COUNT (JS_OBJECT_SLOT_COUNT + 1)
#define JS_NATIFIED_OBJECT_SLOT_INDEX JS_OBJECT_SLOT_COUNT
#define GC_SLOT_JS_CLASS (JS_OBJECT_SLOT_COUNT - 1)
#define GC_SLOT_GC_CALL (JS_OBJECT_SLOT_COUNT - 2)
#define JS_OBJECT_SLOT_MAX_INDEX (JS_OBJECT_SLOT_COUNT - 3)

namespace MozJS {
class ShellPrincipals : public JSPrincipals {
  uint32_t bits;

  static uint32_t getBits(JSPrincipals* p);

 public:
  explicit ShellPrincipals(uint32_t bits, int32_t refcount = 0) : bits(bits) {
    this->refcount = refcount;
  }

  static void destroy(JSPrincipals* principals);

  static bool subsumes(JSPrincipals* first, JSPrincipals* second);

  static JSSecurityCallbacks securityCallbacks;

  // Fully-trusted principals singleton.
  static ShellPrincipals fullyTrusted;
};

class Isolate {
  bool disposable_;
  int threadId_;
  JSContext* ctx_;

 public:
  JXCORE_PUBLIC Isolate();

  JXCORE_PUBLIC Isolate(JSContext* ctx, int threadId, bool disposable);

  JXCORE_PUBLIC static Isolate* New(int threadId = -1);

  JXCORE_PUBLIC static Isolate* GetCurrent();

  JXCORE_PUBLIC static Isolate* GetByThreadId(const int threadId);

  JXCORE_PUBLIC inline JSContext* GetRaw() { return ctx_; }

  JXCORE_PUBLIC void* GetData();

  JXCORE_PUBLIC void SetData(void* data);

  JXCORE_PUBLIC void Dispose();
};

int* getThreadIdsMemRef();
}  // namespace MozJS
#endif  // SRC_JX_PROXY_MOZILLA_MOZJS_ISOLATE_H_
