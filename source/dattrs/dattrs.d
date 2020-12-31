template dattrs_this_body(string[] names, ARGS...)
{
    static string dattrs_this_body()
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


mixin template dattrs(string[] names, ARGS...)
{
    mixin("this("~this_args!(names, ARGS)~"){"~dattrs_this_body!(names, ARGS)~"}");

    static foreach(int i, t; ARGS)
    {
        mixin(t," "~names[i]~";");
    }
}


unittest
{
    assert (w.donkey == property_value);
}