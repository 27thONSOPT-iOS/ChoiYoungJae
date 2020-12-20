# 4주차 과제:fire::fire::fire: 



## 01. Tabbar 생성과 Animation 적용하기  

## - 구동 화면 

![4Week_Assignment_Capture](/ReadMe/ReadMeAsset/4Week_Simulater.gif) 

### 1) Tabbar 생성하기  
Tabbar 생성하는건 세미나 때 배운대로만 하면 되기 때문에 설명 생략! :)

### 2) 키보드의 등장여부에 따라 애니메이션 적용하기  
이전에 만들어두었던 뷰에서 코드로 애니메이션을 적용시켜보았다.  
우리가 코드를 작성해야 하는 부분은 크게 세가지로 볼 수 있다.  
1. 키보드가 올라올 때, 사진과 텍스트 필드가 같이 위로 움직이게 만들기.  
2. 키보드가 내려올 때, 사진과 텍스트 필드를 제자리로 돌려놓기.  
3. 키보드의 Enter를 입력하면 2.와 같은 역할을 하도록 해주기.  

1번과 2번은 애니메이션으로, 3번은 delegate 메소드를 사용해서 해결해 줄 거다!!  

#### 키보드의 움직임에 따라 애니메이션 적용시키기  
나는 Notification Center를 사용해서 애니메이션을 적용시켜줬다.  
우선 코드를 먼저 보자!  
나는 뷰컨트롤러의 extension에 해당 함수를 선언해주었다.  

```swift
    // 텍스트 필드에 애니메이션 주는 함수
    func move() {
        loginPartTextField.delegate = self
       
    // 키보드가 나타날 때!
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardUp(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    
    // 키보드가 사라질 때!
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardDown(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
```
으악! ㅇ ㅣ게뭐야??!  
NotificationCenter는 엄청 다양하게 사용할 수 있는데, 우선 내가 이해한 느낌으로 설명해보겠읍니다.. ㅠㅠ  
NotificationCenter는 Netflix 같은거라고 생각하면 된다.  
이게 무슨말이냐???  
우리가 넷플릭스를 볼 때 특정 영화, 예를 들어 짱구는 못말려 극장판을 선택한 상황이라면 도라에몽이나 코난이 아니라 반드시 짱구는 못말려가 재생된다!  
NotificationCenter도 마찬가지다.  
위의 코드를  다시 봐보자!  

```swift
  // 키보드가 나타날 때!
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardUp(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
```
해당 코드에서 UIResponder.keyboardWillShowNotification는 내가 보고싶은 '짱구는 못말려'고,  #selector(keyBoardUp(_:)는 넷플릭스가 재생시켜주는 '짱구는 못말려 영상' 이라고 생각하면 된다.ㅋㅋㅋ  
여기서 UIResponder.keyboardWillShowNotification는 키보드가 나타날때 "키보드 나타난다!"라고 알려주는 delegate 메소드이다.  
#selector(keyBoardUp(_:))는 키보드가 나타났을 때 해야할 특정 업무 이름이다.   
이거는 메소드는 아니고 우리가 저 업무 이름으로 코드를 짜주어야한다!  

다시 말해서, 이 코드는 키보드가 나타날 때, keyBoardUp(_:)를 실행하도록하는 NotificationCenter를 선언하는 것!!  

이제 우리는 앞서 말했던 특정 업무들에 대한 코드를 작성해주어야한다.  
이 코드들 또한 해당 extension에 작성해주었다.  

```swift
    @objc func keyBoardUp(_ sender: Notification) {
        
        let move = CGAffineTransform(translationX: 0, y: -100)

        UIView.animate(withDuration: 0.5, animations: {
            self.loginImg.transform = move
            self.loginPartName.transform = move
            self.loginPartTextField.transform = move
        })
        
    }
    @objc func keyBoardDown(_ sender: Notification) {
        
        UIView.animate(withDuration: 0.5, animations: {
            self.loginImg.transform = .identity
            self.loginPartName.transform = .identity
            self.loginPartTextField.transform = .identity
        })
        
        }
}
```
정확한 이유는 모르겠지만, NotificationCenter를 사용할 때는 objc 키워드를 사용해준다.  
아마 NotificationCenter는 objc 모듈을 사용해야만 하는 것 같은데... 쨋든  
나는 keyboardUp과 keyboardDown이라는 함수를 만들어 주었다.  
전자의 경우는, 키보드가 나타났을 때 사용할 함수로 ImageView, Label, Textfield의 y값 위치를 -100만큼 이동시켜준다.  
후자의 경우에는, .identity를 사용하여 원래 자리로 돌아오게 만들어주는 함수다.  

여기까지 코드를 다 작성했다면, 특정상황에서 어떤일을 해야할지를 알려주는 NotificationCenter를 선언해주고, 그 어떤일이 무엇인지를 설명하는 함수까지 다 작성한 것이다.  
이제 실행시켜보면 깔끔하게 원하는대로의 애니메이션이 적용됨을 알 수 있다.

#### Return 버튼을 눌렀을 때 키보드가 내려가도록 만들어주기!

```swift
//  return을 누르면 키보드가 내려가도록 함
extension soptWorkingLoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
```
사실 이건 되게 간단하다!  
UITextFieldDelegate를 사용하여 위의 코드를 입력해주면 끝!  

## 02.  (도전과제 🤮)  

## - 구동 화면 

![4Week_Assignment_Capture2](/ReadMe/ReadMeAsset/4Week_Simulater2.gif) 

### 컬렉션 뷰에 애니메이션 추가하기
도전과제는 스크롤시에 헤더 뷰가 사라지고, 멈추면 다시 나타나도록 하는 것이다.   
나는 UIScrollViewDelegate에서 메소드를 사용해주었다  

```swift
extension SoptWorkingScrollCollectionVC : UIScrollViewDelegate {
// 스크롤이 아래로 내려간 시점에 헤더뷰를 사라지게 한다.
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            UIView.animate(withDuration: 0.2, animations: {
                self.soptWorkingView.transform = CGAffineTransform(translationX: 0, y: -88)
            })
        }
// 화면이 맨 위에 있을 경우에는 헤더뷰가 나타나도록 해준다.
        else {
            UIView.animate(withDuration: 0.2, animations: {
                self.soptWorkingView.transform = CGAffineTransform(translationX: 0, y: 0)
            })
    }
}
// 가속이 멈출 때 헤더뷰가 도로 나타나도록 한다
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 0.6, animations: {
            self.soptWorkingView.transform = CGAffineTransform(translationX: 0, y: 0)
        })
    }
}
```
scrollViewDidScroll은 스크롤이 시작되고 난 시점에서 특정 코드를 수행하도록 하고 scrollViewDidEndDecelerating은 가속이 멈추어진 시점에서 특정 코드를 수행하도록 만들어주는 메소드이다.  
스크롤이 된 이후 'scrollView.contentOffset.y > 0' 즉 화면이 아래로 스크롤 된 상황이면 헤더뷰가 사라지도록하고, 화면이 맨 위로 올라왔을때엔 다시 헤더뷰가 나타나도록 분기처리를 해주었다.  

이대로만 한다면 도전과제도 손쉽게 완료!