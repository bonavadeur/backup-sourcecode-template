# Template for backup sourcecode from Opensource

## 1. Introduction

You cloned a repository from Github and want to modify it, but still remain checking diff from current work to last-original commit (from OpenSource).

This proposal uses 2 branches:
+ `master`: backup branch. For example, each day you create one commit (using Linux crontab), each commit is commited in `master`
+ `release`: 'coding branch', you will code in this branch, and it always has the most stable code. In this branch, Vscode will show diff between what you modified and the last-original commit from OpenSource

## 2. Solution

### init:  
```bash
git init
# change something
git add .
git commit -m "-----inito-----"
git checkout -b release
git remote add origin {remote_repo}
```

### backup (being on release)  
```bash
Date=`date`

git stash
git checkout master
stashHash=$(git log --oneline --all | head -n 1 | cut -d' ' -f1)
git checkout $stashHash --theirs .
git add .
git commit -m "$Date"
git checkout release
git stash pop
git push origin master
```

## 3. Épilogue  
I know this solution seem ultimate stupid, but I like it :)). I am applying it to Knative.  
I largely hope that anyone can tell me better or official ideas. Any ideas, please create an issue.  
