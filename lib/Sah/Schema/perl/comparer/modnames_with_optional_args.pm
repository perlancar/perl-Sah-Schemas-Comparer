package Sah::Schema::perl::comparer::modnames_with_optional_args;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [array => {
    summary => 'Array of Perl Comparer::* module names without the prefix, with optional args, e.g. ["Foo::bar", "Foo::baz=qux,quux"]',
    description => <<'_',

Array of Perl Comparer::* module names without the prefix and with optional args.
Each element is of `perl::comparer::modname_with_optional_args` schema, e.g.
`Foo::bar`, `Foo::baz=qux,quux`.

Contains coercion rule that expands wildcard, so you can specify:

    Foo::*

and it will be expanded to e.g.:

    ["Foo::bar", "Foo::baz"]

The wildcard syntax supports jokers (`?`, `*`, `**`), brackets (`[abc]`), and
braces (`{one,two}`). See <pm:Module::List::Wildcard> for more details.

_
    of => ["perl::comparer::modname_with_optional_args", {req=>1}],

    'x.perl.coerce_rules' => [
        ['From_str_or_array::expand_perl_modname_wildcard', {ns_prefix=>'Comparer'}],
    ],

    # provide a default completion which is from list of installed perl modules
    'x.element_completion' => ['perl_comparer_modname_with_optional_args'],

}];

1;
# ABSTRACT:
