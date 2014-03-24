/* jshint undef:true */
/* global FieldKit, describe, context, before, it, expect, sinon */
/* global expectThatLeaving, buildField */

describe('FieldKit.ExpiryDateField', function() {
  var field;

  before(function() {
    field = buildField(FieldKit.ExpiryDateField);
  });

  it('interprets a single digit year as if it had zero prefixed', function() {
    // NOTE: this probably ought to result in '12/04|', but changing the caret
    // during the blur event makes Chrome unhappy.
    expectThatLeaving(field).willChange('12/4|').to('12/0|4');
  });

  it('leaves unparseable values alone on end edit', function() {
    expectThatLeaving(field).willNotChange('4|');
  });
});
