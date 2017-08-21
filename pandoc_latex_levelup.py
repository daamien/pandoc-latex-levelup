#!/usr/bin/python3

"""
Pandoc filter to level up all headers 
"""

import panflute as pf

def prepare(doc):
    doc.enable=doc.get_metadata('levelup.enable', default='True')
    doc.unnumber_h1=doc.get_metadata('levelup.unnumber_h1',default="True")

def action(elem, doc):
    # kill switch
    # this is useful when if you're using the filter in a script
    # and you want to disable the filter on certain files
    if not doc.enable :
        return elem

    #
    # header1 are unnumbered by default
    # ALL others are leveled up
    #
    if type(elem) == pf.Header:
        if elem.level == 1 :
            if doc.unnumber_h1:
                elem.classes=['unnumbered']
        else:
            elem.level-=1

def finalize(doc):
    pass

def main(doc=None):
    return pf.run_filter(action,
                         prepare=prepare,
                         finalize=finalize,
                         doc=doc) 


if __name__ == "__main__":
    main()

