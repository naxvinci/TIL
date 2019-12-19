# CLI

> 커맨드 라인 인터페이스

## 터미널 명령어들

### 기본 명령어들

- `ls` : 폴더 내부의 파일 & 폴더를 나열
- `pwd`  : 현재 폴더 경로 출력
- `mkdir`[폴더명] : 폴더 생성
- `cd`[폴더명] : change directory 내가 있는 폴더를 변경
- `tab`: 자동완성
- `cd ..` : 상위 폴더로 이동
- `.`: 현재폴더
- `ls -a` : 숨김 폴더까지 보기
- `touch` [파일명]: 파일 만들기
- `rm` [파일명]: 파일 삭제
- `mv [이동할 파일 혹은 폴더] [이동할 곳]` : 폴더 혹은 파일 이동

### git 관련 명령어

- `git status` : git의 상태 묻기
- `rm -r .git` : 깃폴더 삭제
- commit 늪에 빠진 경우 : esc 연타 후 콜론`:` 을 쓰고 `q`(quit)



### git에 파일을 등록하는 과정의 명령어

- `git init` : 깃 시작. 이 때 폴더가 마스터로 설정 .git이라는 숨김파일을 생성해냄
- `git add`[파일명]  : 파일 추가... 버전 관리가 가능하도록 
- `git commit -m "커밋 네임"` : 커밋 등록
- `git log` :  깃 로그 확인
-  `git log --oneline` : 한줄로 로그를 보여주기
- `git push origin master` : 깃 허브에 파일을 푸시
- `git pull origin master` : 깃 허브에서 파일을 풀
- `git init&&git add` : 동시 명령. 오타나면 망하니 주의



### 원격저장소 관련 명령어

- `git remote add[저장소이름][주소]`  : 원격저장소의 주소를 알려주기
- `git remote rename [원래이름] [바꿀이름]`: 
- `git remote -v `
- `git clone [레포지토리 주소] `: 복제



### git checkout

- `git checkout`[commit 앞 5자리 코드] : 과거를 보러 가고 싶다!
- `git checkout master` : 현 상태로 돌아오기



### git branch 관련 명령어

- `$ git switch -c [만들어서 이동할 브랜치 명]`