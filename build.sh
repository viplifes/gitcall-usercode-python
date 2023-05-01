#!/bin/sh

# keep this line, it's marker for output parser
OUTPUT="----START:vendor.sh----"

doInstall() {
    if [ "$1" == "" ]; then
        OUTPUT="${OUTPUT}runner dir is not set\n"
        return 1
    fi

    if [ ! -d "$1" ]; then
        OUTPUT="${OUTPUT}runner dir does not exist\n"
        return 1
    fi

    cd "$1"

    if [ -f "requirements.txt" ]; then
        RESULT=$(pip install -r requirements.txt 2>&1)
        RCODE=$?

        if [ ${RCODE} -gt 0 ]; then
            OUTPUT="${OUTPUT}${RESULT}\n"

            return $RCODE
        fi
    fi

    if [ "$2" == "" ]; then
        OUTPUT="${OUTPUT}usercode dir is not set\n"
        return 1
    fi

    if [ ! -d "$2" ]; then
        OUTPUT="${OUTPUT}usercode dir does not exist\n"
        return 1
    fi

    cd "$2"

    apk --no-cache add py3-scikit-learn
    export PYTHONPATH=/usr/lib/python3.8/site-packages

    return 0
}

doInstall $1 $2

RESULT=$?

# keep this line, it's marker for output parser
OUTPUT="${OUTPUT}----END:vendor.sh----"

echo $OUTPUT

exit $RESULT
