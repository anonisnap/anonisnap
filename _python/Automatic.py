import os

# Files
template_file = "TEMPLATE.md"
readme_file = "README.MD"

# Git Commands
git_commit = "git commit README.md -m \"Updated README\n  ~ Python\""
git_push = "git push"

# Signature Text
signature = "\n\n<br>\n\n```\nThis file was lastly modified by Python\n```"

# Buffer Variable
template_text = ""

# Open and Copy Template into variable
with open(template_file, 'r') as template_document:
    template_text = template_document.read()

# Add Signature
template_text += signature

# Overwrite README with template + signature
with open(readme_file, 'w') as readme_document:
    readme_document.write(template_text)
    pass

# Git commit and push
os.system(git_commit)
os.system(git_push)