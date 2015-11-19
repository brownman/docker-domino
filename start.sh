#!/bin/bash
chown -R notes:notes /local/notesdata
su notes -c "export PATH=$PATH:/local/notesdata;/opt/ibm/domino/bin/server < /local/notesdata/notes.input"
