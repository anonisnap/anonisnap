@ECHO ON

:copy_template
TYPE TEMPLATE.md > README.md

SET codeblock=```
SET signature=This file was lastly modified by Batch


ECHO: >> README.md
ECHO: >> README.md

ECHO ^<br^> >> README.md

ECHO: >> README.md

ECHO %codeblock% >> README.md

ECHO: >> README.md

ECHO %signature% >> README.md

ECHO: >> README.md

ECHO %codeblock% >> README.md

:git_commit

git commit README.md -m "Updated README\n  ~ Python"
git push