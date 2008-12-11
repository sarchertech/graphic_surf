var field1 = new LiveValidation( 'contact_name', {onlyOnSubmit: true } );
field1.add( Validate.Presence );
var field2 = new LiveValidation( 'contact_email', {onlyOnSubmit: true } );
field2.add( Validate.Email );
var field3 = new LiveValidation( 'contact_phone', {onlyOnSubmit: true } );
field3.add( Validate.Numericality );