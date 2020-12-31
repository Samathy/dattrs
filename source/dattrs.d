template this_body(string[] names, ARGS...)
{
    static string this_body()
    {
        string this_body;
        static foreach(int i, t; ARGS)
        {
            this_body = "this."~names[i]~" = "~names[i]~";";
        }
        return this_body;
    }
}

template this_args(string[]names, ARGS...)
{
    static string this_args()
    {
        string this_args;
        static foreach(int i, t; ARGS)
        {
            this_args ~= t.stringof~" "~names[i]~",";
        }
        return this_args;
    }
}


mixin template define(string[] names, ARGS...)
{
    mixin("this("~this_args!(names, ARGS)~"){"~this_body!(names, ARGS)~"}");

    static foreach(int i, t; ARGS)
    {
        mixin(t," "~names[i]~";");
    }
}

/** Add default values for attributes. Optionally define a no-argument this. */
mixin template define_defaults(string[] names, string[] defaults, bool overload, ARGS...)
{
    static if (overload)
    {
        mixin("this(){}");
    }

    mixin("this("~this_args!(names, ARGS)~"){"~this_body!(names, ARGS)~"}");

    static foreach(int i, t; ARGS)
    {
        //If the default value is a string, we need to add quote marks;
        static if ( is(t == string))
        {
            mixin(t," "~names[i]~" = \""~defaults[i]~"\";");
        }
        else
        {
            mixin(t," "~names[i]~" = "~defaults[i]~";");
        }
    }
}
