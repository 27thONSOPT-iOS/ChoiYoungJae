# 1주차 과제

## 구동 화면
![1Week_Assignment_Capture](/ReadMe/ReadMeAsset/1Week_Simulater.gif) 

## 01. Present, Push, Pop 사용하기 
![1Week_Assignment1](/ReadMe/ReadMeAsset/1Week_Assignment1.png)

### 1) 이미지를 삽입하는 방법?
![1Week_Assignment2](/ReadMe/ReadMeAsset/1Week_Assignment2.png)
Assets.xcassets 에 들어가서 원하는 사진을 Drag & Drop 해준다!
이후 해당 뷰컨에서 아래와 같은 코드를 입력하면 사진을 ImageView에 삽입 가능!

```Swift
        // 이미지 삽입
        firstViewImg.image = UIImage(named: "IMG_8167")
```

### 2) 뷰 세팅 해주기 (Navigation Title, 라벨 내용, 버튼 내용, 색, 바탕색 등)
#### a. Navigation Title을 설정해주는 코드
```Swift
        self.navigationItem.title = "Login"
```

나중에 배울 Tab bar와 Navigation bar를 같이 쓰는 경우에는 문제가 생길수도 있다고 한다.  
자세한 정보는 https://zeddios.tistory.com/181 참고.

#### b. 라벨 서식 설정하기 
우리는 라벨의 내용을 입력해주고, 그걸 bold 처리해주어야한다!  
이 때 사용하는 코드는  
```Swift
				loginPartNameLabel.text = "파트"
        loginPartNameLabel.font = UIFont.boldSystemFont(ofSize: 15)
```

#### c. UiButton 서식 설정하기
우리가 버튼에서 설정을 해주어야 할 부분은 버튼의 타이틀 내용과 배경색, 폰트 색과 볼드처리이다.

```Swift
      // 버튼의 이름 및 다양한 서식 설정! 
        loginButton.setTitle("로그인", for: .normal)
        self.loginButton.backgroundColor = UIColor.black
        loginButton.setTitleColor(.systemYellow, for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
```


### 3) 화면 전환시 주의할 점!
화면 전환은 세미나 때 배운 그대로 하면 쉽게 할 수 있는데  
FirstViewController에서 LoginVC로 넘어갈 때 주의해야할 점이 있다!  
LoginVC는 네비게이션 바를 삽입한 상태이기 때문에   
FirstVC에서 LoginVC로 Push 할 때는  LoginVC가 아닌 NavigationController의 StoryBoard ID를 사용해주어야한다!!  

![1Week_Assignment3](/ReadMe/ReadMeAsset/1Week_Assignment3.png)



## 02. 도전 과제! : Data 값 전달하기


```Swift

```

