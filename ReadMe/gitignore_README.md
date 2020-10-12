# GitHub iOS 과제 프로젝트 준비하기 !!

## gitignore 생성하기  
.gitignore는 프로젝트 내에서 불필요하거나 충돌이 일어날 가능성이 있는 파일의 추적을 안하도록 막아주는 파일이다.  
혼자 사용시에는 크게 상관이 없을 수 있겠지만 협업을 할때 merge해주는 과정에서 충돌이 일어난다면 정말... 아찔해지기 때문에 꼭 .gitignore를 설정해주는게 좋다!  
내 경우엔 .DS_store가 정말 자잘한 짜증을 많이 일으켰었다. 으악  

그럼 어떻게 .gitignore를 설정하느냐??  
우선 터미널에서 github에 올릴 레포 경로로 이동한다!  

![gitignore1](/ReadMe/ReadMeAsset/gitignore1)  

ls -al을 입력해주면 현재 내가 위치한 경로의 파일들을 볼 수 있다.  
여기서 touch .gitignore를 입력해주면 .gitignore 파일이 만들어진다.  

![gitignore2](/ReadMe/ReadMeAsset/gitignore2)  

이후 다시 ls -al을 입력하면 .gitignore가 생성되어 있음을 확인할 수 있다.  
그럼 이제 http://gitignore.io 로 이동해보자  
여기는 gitignore에 입력할 내용을 만들어주는 홈페이지다.  

![gitignore3](/ReadMe/ReadMeAsset/gitignore3)  

내가 사용할 언어인  swift, 아요 개발에 사용할 툴 Xcode, 나중에 라이브러리를 사용할 테니 cocoapods까지 검색해서 입력해준다.  

![gitignore4](/ReadMe/ReadMeAsset/gitignore4)  

그럼 이런 친구들을 만날 수 있는데 전부 복사해준다.  
이후 터미널로 다시 돌아와 쓰기를 위한 vi 명령어를 사용한다.  
vi .gitignore 를 입력해서 아까 만들어준 파일에 쓰기모드로 들어간다.  

![gitignore5](/ReadMe/ReadMeAsset/gitignore5)  

거기에 복사한 내용들을 붙여넣기 해주고, :wq!를 눌러 저장하고 나오면 .gitignore 생성 완료!  

## .DS_Store 삭제하기
gitignore를 해준다면 .DS_Store를 추적하지 않고 push를 하기 때문에 상관은 없지만,  
나같이 그냥 .DS_Store가 꼴보기 싫은 사람들은 보이는 족족 .DS_Store를 지워줘도 된다!  
보통 파일은 finder에서 접근하면 생기는데 접근한 모든 폴더에 저 파일이 생긴다 ㅠ  
지워주고 싶다면 해당 경로에서 
```
rm .DS_Store 
```
를 해줘도 되지만 프로젝트 내 폴더 이곳저곳에 생성되어있다면 해당 git 레포 경로로 이동하여  
```
sudo find / -type f -name '\.DS_Store' -print -delete
```
위의 코드를 입력해주면 .DS_Store 파일이 전부 지워진다.
사




