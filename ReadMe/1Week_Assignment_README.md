# 1주차 과제

## 구동 화면
![1Week_Assignment_Capture](/ReadMe/ReadMeAsset/1Week_Simulater.gif) 

## 01. Present, Push, Pop 사용하기 
![1Week_Assignment1](/ReadMe/ReadMeAsset/1Week_Assignment1.png)

### 1) 이미지를 삽입하는 방법?
![1Week_Assignment2](/ReadMe/ReadMeAsset/1Week_Assignment2.png)
Assets.xcassets 에 들어가서 원하는 사진을 Drag & Drop 해준다!  
이후 해당 뷰컨에서 아래처럼 코드를 입력하면 사진을 ImageView에 삽입 가능!  
이미지 파일의 이름을 틀리면 안된다~  

```Swift
        // 이미지 삽입
        firstViewImg.image = UIImage(named: "IMG_8167")
```


​    
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
세미나에서 Data 값을 전달하는 코드를 그~대로 이번 과제에  적용하면 데이터 값이 넘어가질 않는다.  
으악 왜그러지??!? 난 똑같이 했는데 ㅠ   

### 1) presentingViewController  
우리는 세미나 때 아래와 같은 식의 코드를 사용했었다.  
```Swift
guard let firstVC = self.storyboard!.instantiateViewController(withIdentifier: "firstVC") as? ResultViewController else {return}
	 
	 // ... 중간 생략

dvc.modalPresentationStyle = .fullScreen
self.present(firstVC, animated: true, completion: nil)
```

instantiateViewController(withIdentifier: ) 메소드는  인자값으로 받은 아이디를 가지고 스토리 보드 내에서 view controller를 찾고,  
그것에 연결된 클래스를 읽어오는 메소드이다.   
하지만 이번 과제의 경우에는 instantiateViewController(withIdentifier: )를 사용하지 않는다.  


```Swift
 guard let firstVC = self.presentingViewController as? firstVC else {return}

```
나의 경우엔 위처럼 instantiateViewController 대신 presentedViewController를 사용했다.  

기존 뷰 컨트롤러에서 호출한 뷰 컨트롤러를 참조할 때엔 **presentedViewController**를 사용하고  
호출된 뷰 컨트롤러에서 기존 뷰 컨트롤러를 참조 할 경우엔 **presentingViewController**를 사용한다.  
이 두 경우 중 상황에 맞게 사용해주면 될 듯 하다.  

사실 저 경우에 왜 instantiateViewController 메소드가 아닌 presentedViewController나 presentingViewController를 사용하는지는 정확하게 모르겠다.  
그냥 상황에 맞게 사용해야한다는 것만 알뿐...  
아마 이보다 디테일한 내용들은 다른 멋진 OB 친구들한테 물어보는게 좋겠다. (민희, 예슬, 지훈, 지은한테 물어보세요)  


### 2) 생명주기 : viewWillAppear()

다른 뷰에서 데이터를 가져오는 함수 getData()를 만들었다.  
```Swift
private func getData(){
        // 옵셔널 바인딩
        if let part = self.part,
           let name = self.name {
        // 값 대입
            self.partLabel.text = part
            self.helloLabel.text = "\(name) 이 자식아 정신차리라고"
        }
    }
```
세미나 때는 위의 setData()와 같은 역할을 하는 setLabel()이라는 함수를 선언해주었고 이를 viewDidLoad()  안에서 호출을 해주었다.  
하지만 이번에 만든 함수 getData()를 세미나 때처럼 viewDidLoad()에서 호출해주면   
뷰에 나타나는 데이터 값에 변화가 전혀 없는 것을 볼 수 있다 ㅠ  

이는 iOS 생명주기 때문이다!!   
viewDidLoad()는 처음 뷰가 실행되는 그 순간에만 1회 호출된다.  
그렇기에 다른 뷰를 갔다 와서 변수의 값에 변화가 생기더라도 이미 호출된 내용은 바뀌지 않는다.  
그럼 우리는 주어진 데이터를 reload 해주어야한다.  
이걸 어떻게하느냐??   
아래의 코드처럼, **viewDidLoad()**가 아닌 **viewWillAppear()** 에서 호출해 주는 것!  

```Swift
    override func viewWillAppear(_ animated: Bool) {
        getData()
    }
```
viewWillAppear()는 viewDidLoad()와는 달리 처음 한번만 호출해 주는 것이 아니라 화면에 뷰가 띄워질때 마다 호출을 한다.  
그렇기에 화면이 불려올 때마다  값이 바뀐 데이터가 reload되어 보여질 수 있는 것이다!   

iOS의 생명주기에는 이 외에도 viewDidAppear, viewWillDisappear, viewDidDisappear 등이 있다.  
개발을 할 때 있어 생명주기는 정말 중요하다!  
https://zeddios.tistory.com/43 <-- 여기에 iOS 생명주기가 정말 잘 정리되어있으니 꼭 읽어보자!!  