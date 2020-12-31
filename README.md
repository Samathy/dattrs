# dattrs

dattrs is a riff on Python's [attrs](https://pypi.org/project/attrs/).
It removes the need for writing boring boilerplate class constructors.

Use it like so:

```

import dattrs

class wibble
{
    mixin dattrs!(["donkey"], string);
}

auto w = new wibble("hello");

writeln(w.donkey); //"hello"

```
