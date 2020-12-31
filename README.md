# dattrs

dattrs is a riff on Python's [attrs](https://pypi.org/project/attrs/).
It removes the need for writing boring boilerplate class constructors.

Use it like so:

```

/* You MUST import the entire dattrs module, 
   dont just import `define`.
*/
import dattrs;

class wibble
{
    mixin define!(["donkey"], string);
}

auto w = new wibble("hello");

writeln(w.donkey); //"hello"

```

You may also define default values for the attributes,
and optionally offer a no-parameter constructor.

```

class wibble
{
                              name       value  overload type
    mixin define_defaults!(["donkey"], ["hello"], true, string);
}

```
