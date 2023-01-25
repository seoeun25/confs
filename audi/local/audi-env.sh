#!/bin/bash

# export JAVA_HOME=
# export AUDI_JAVA_OPTS=      		    # Additional jvm options. for example, "-Dprop1=val1 -Dprop2=value2"
# export AUDI_MEM            		    # metatron jvm mem options Default "-Xms2048m -Xmx2048m"

export AUDI_ENV_MODE=local              # ENV mode, profile mode, default local
export AUDI_EXTRA_PROFILE=druid-dev         # Extra profile, comma seperated
# export AUDI_LOG_DIR        		    # Where log files are stored.  PWD by default.
# export AUDI_PID_DIR        		    # The pid files are stored. ${AUDI_HOME}/run by default.
# export AUDI_IDENT_STRING   		    # A string representing this instance of metatron. $USER by default.
# export AUDI_NICENESS       		    # The scheduling priority for daemons. Defaults to 0.
# export $AUDI_CLASSPATH_OVERRIDES  # additional classpath

export AUDI_DB_TYPE=mysql              # h2 or mysql. h2 by default
# export AUDI_H2_DATA_DIR           # h2 db data directory
# export AUDI_INDEX_DIR             # lucene index directory



