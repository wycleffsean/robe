#include <stdbool.h>
#include "include/node/public/jx.h"
#include "ruby.h"

/* TODO
 * JX_InitializeOnce(home_folder);
 * JX_InitializeNewEngine();
 * JX_DefineMainFile("...cat webpack.js..");
 * JX_StartEngine();
 * while (JX_LoopOnce() != 0) Sleep(1);
 * JXValue result;
 * JX_Evaluate("console.log('yo');", &result);
 * JX_Free(&result);
 * while (JX_LoopOnce() != 0) Sleep(1);
 * JX_StopEngine();
*/

VALUE mRobe;
VALUE cEngine;

void engine_free(JXResult data)
{
  JX_Free(&data);
  JX_Loop(); // loop IO events
  JX_StopEngine();
}

VALUE engine_alloc(VALUE self)
{
  //int* data = malloc(sizeof(JXResult));
  //return Data_Wrap_Struct(self, NULL, engine_free, data);
  return Qnil;
}

VALUE engine_m_initialize(VALUE self, VALUE val)
{
  char* path = StringValueCStr(val);
  JX_InitializeOnce(path);
  JX_InitializeNewEngine();
  JX_DefineMainFile("");
  JX_StartEngine();
  JX_Loop(); // loop IO events

  //Data_Get_Struct(self, *JXResult, data);
  //*data = NUM2INT(val);
  return self;
}

VALUE engine_m_evaluate(VALUE self, VALUE val)
{
  char* contents = StringValueCStr(val);

  JXResult data;
  JX_Evaluate(contents, "robe_script", &data);
  return Qnil;
}

void Init_robe()
{
  mRobe = rb_define_module("Robe");
  cEngine = rb_define_class_under(mRobe, "Engine", rb_cObject);

  //rb_define_alloc_func(cEngine, engine_alloc);
  rb_define_method(cEngine, "initialize", engine_m_initialize, 1);
}
