# 3주차 과제:fire::fire::fire: 

## 구동 화면 

![3Week_Assignment_Capture](/ReadMe/ReadMeAsset/3Week_Simulater.gif) 

## 01. CollectionView 사용하기  

![3Week_Assignment1](/ReadMe/ReadMeAsset/3Week_Assignment1.png)  

이번 과제는 3주차 세미나 때 배운 것들을 활용하면 쉽게 끝낼 수 있다!

### 1) 오토레이아웃 잡기
#### CollectionView 
2주차 과제 때는 Stack View를 사용했기 때문에 스택뷰를 담고 있는 UIView의 오토레이아웃을 상하좌우 0으로 설정해버렸었다.   
물론 CollectionView도 똑같이 상하좌우 0으로 오토레이아웃을 잡아도 된다!  
DelegateDataFlow를 사용하여 코드로 원하는 위치와 크기를 잡아줄 수 있기 때문!  
하지만 애초에 CollectionView의 오토레이아웃을 맞춰둔다면 신경쓸게 적어지기 때문에 더 편하게 작업을 할 수 있다.  
나는 아래와 같이 오토레이아웃을 잡아주고 작업을 시작했다!  
![3Week_Assignment2](/ReadMe/ReadMeAsset/3Week_Assignment2.png)  

#### CollectionViewCell  
그렇다면 cell에서 표현되는 개체들은 어떻게 오토레이아웃을 잡아주지??  
별거 없다!   
Cell의 ContentView 안에서 우리가 하듯이 오토레이아웃을 잡아주면 된다! 

![3Week_Assignment3](/ReadMe/ReadMeAsset/3Week_Assignment3.png)  


#### 오토레이아웃 다 잡아줬는데 컬렉션 뷰가 왜 이상하게 나오지?? ㅠ  
![3Week_Assignment4](/ReadMe/ReadMeAsset/3Week_Assignment4.png)  
이것보세요  
컬렉션 뷰가 난장판이 되었네~  
분명히 오토레이아웃도 잘잡아주고 코드도 잘 짜준거 같은데 뭐가 문제일까??  

![3Week_Assignment5](/ReadMe/ReadMeAsset/3Week_Assignment5.png)  
Collection View의 Estimate Size를 None으로 설정해주지 않았을 가능성이 크다!  
이걸 none으로 해주어야 내가 원하는대로 셀이 배열이 될 수 있다!!  
쉽게 지나칠 수 있는 부분이니 꼭 확인해야한다!  

### 2) 다 했는데 왜 스크롤이 안되지??!  
#### 1. 스크롤 뷰 자체 문제
보통 시뮬레이터를 돌렸을 때 Scroll View가 스크롤이 안된다면, Scroll View의 bottom에 오토레이아웃을 안잡아준 경우가 많다.  
Scroll View가 제대로 작동을 안한다면 bottom에 오토레이아웃이 잘 잡혀있는지 제일 먼저 확인해보자!!

#### 2. 스크롤 중첩?!
기본적으로 Table View와 Collection View는 스크롤을 지원한다.  
우리는 이번 과제에서 Scroll View 안에 Collection View를 넣어준 것이니, 하나의 뷰에 스크롤을 지원하는 뷰가 두개나 있는 것이다.  
사용을 못하는 것은 아니지만, 사용자의 입장에서는 불편해지게된다.  

이를 해결하는 방법은 간단하다.   
둘 중 Collection View에서 사용자에 의한 조작을 막는 것!  
![3Week_Assignment6](/ReadMe/ReadMeAsset/3Week_Assignment6.png)  

엥?? CollectionView의 cell 갯수가 여러개인데 조작을 막아서 스크롤을 못하게하면 그걸 어떻게 다 보나요???  
이건 cell item 갯수를 다 표시할 수 있을만큼 CollectionView의 height까지 지정해주면 된다.  

즉, CollectionView를 스크롤 할 필요 없게 만들어준뒤 스크롤을 잠그고, Scroll View만 스크롤 함으로써 원하는 뷰를 만드는 것!  

### 3) 셀안의 개체 설정을 코드로 바꿔주기 
각 셀 안에있는 개체들은 각각 다른 설정들을 가지고 있다.  
라벨의 글씨 크기, 폰트.  뷰의 색깔 등등.  
이것들은 스토리보드에서 지정해 줄 수도 있지만, 코드로도 가능하다.  
```swift
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell { }
```
이건 각 indexPath 별 Cell을 지정해주는 메소드이다.  
우리는 이 메소드 안에서 각 Cell의 label값과 image 등을 지정해준다.  
이 메소드 안에서 아래와 같은 코드를 넣어주면 각 객체에 대한 설정을 해줄 수 있다.  

```swift
// View의 배경색을 지정해주는 코드. RGB값을 안다면 이런식으로 정확한 색을 지정해줄 수 있다.
soptWorkingCollectionViewCell.soptUserBarView.backgroundColor = #colorLiteral(red: 255/255, green: 213/255, blue: 0/255, alpha: 1)

// Label의 폰트와 색상, 크기를 지정해주는 코드들
soptWorkingCollectionViewCell.soptUserNameLabel.font = UIFont.boldSystemFont(ofSize: 12)
soptWorkingCollectionViewCell.soptUserNameLabel.textColor = .white
soptWorkingCollectionViewCell.soptUserContentLabel.font = UIFont.systemFont(ofSize: 11)
```


