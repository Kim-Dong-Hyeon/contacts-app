# 포켓몬 프로필 + 연락처 앱 만들기

🧑🏻‍💻 **포켓몬 프로필 + 연락처 앱 만들기**

![Untitled](https://teamsparta.notion.site/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2F83c75a39-3aba-4ba4-a792-7aefe4b07895%2F9066b7ef-7833-408d-9fc0-16e8b9b3bf03%2FUntitled.png?table=block&id=02653b33-d939-467d-90f7-0873e1705d42&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=1420&userId=&cache=v2)

숙련 강의에서 배운 것들을 복습하며 연락처 앱을 개발해봅시다.

1. **`UIKit` 화면 구성 및 화면 전환**
    
    `UITableView`, `UILabel`, `UITextView`, `UIButton` 을 활용합니다.
    
    `친구 목록 페이지` → `연락처 추가 페이지`로 이동합니다.
    
2. **`URLSession` / `Alamofire` 복습**
    
    네트워크 통신을 이용해서 서버에서 랜덤 포켓몬 이미지를 불러옵니다.
    
    두 가지 방법으로 모두 개발해보면 좋은 연습이 됩니다.
    
    - 포켓몬 API: https://pokeapi.co/
    
3. **`ViewController 생명주기` 개념**
    
    친구 목록 페이지에 진입할때마다 목록이 `이름순으로 정렬`되도록 합니다.
    
4. **`CoreData` / `UserDefaults` 활용**
    
    연락처 데이터를 `기기 디스크에 저장`합니다.
    
    두 가지 방법으로 모두 개발해보면 좋은 연습이 됩니다.
    
- 이 과제는 `Lv.1 ~ Lv.8` 의 단계로 이루어져 있습니다.
    - `Lv.1 ~ Lv.5` : **반드시 구현 해보세요.**
    - `Lv.6 ~ Lv.8` : 실력 향상을 위해 연습해보세요.

오랜 시간이 걸려도 괜찮습니다. 여러가지 시행착오를 겪으며 성장하는 과제가 되었으면 좋겠습니다.

<br>

### 실행 모습

---

<img src="https://github.com/Kim-Dong-Hyeon/calculator-codebaseui-project/assets/23302057/15760841-0b9b-4b2d-b07a-1f0050026cee"/>

<br>

### 구현 단계 Level 1~8

---

1. 메인 화면(친구 목록 화면)의 기본적인 UI 구현. 
2. 연락처 추가/편집 화면 UI 구현.
3. 연락처 추가/편집 화면 네비게이션 바 (상단) 영역 구현.
4. 랜덤 이미지 생성 버튼 구현. 포켓몬 API 연결.
5. 적용 버튼을 누르면 연락처 데이터(이름/전화번호/프로필이미지)를 디스크에 실제 저장하도록 구현. 
저장된 연락처 데이터들을 메인화면 테이블 뷰의 DataSource 로 적용.
(데이터 Create)
6. 친구 목록 화면으로 돌아올때마다 “이름순”으로 정렬 되어 보이도록 구현.
7. UITableViewCell 을 클릭했을때도 연락처 추가/편집 페이지로 이동하도록 구현. 이때 네비게이션 바 영역의 타이틀은 그 연락처 이름이 노출되도록 설정. 그리고 저장되어있던 이미지,이름,전화번호가 노출되도록 설정.
8. 테이블 셀을 통해 들어온 페이지였을 경우 “적용” 버튼 클릭 시 데이터 Create 가 아닌 데이터 Update 가 되도록 구현.

<br>

### Level 1

---

<img src="https://teamsparta.notion.site/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2F83c75a39-3aba-4ba4-a792-7aefe4b07895%2Fae762645-c444-40c8-8b9d-a9e8635d995c%2FUntitled.png?table=block&id=791a8370-e8f2-4258-be7a-7661690b5515&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=860&userId=&cache=v2" alt="Level 1 구현 예시" width=33% align="left">

<br><br>

```text

🧑🏻‍💻 **Level 1 -** 왼쪽 캡처 모습과 같게 UI 를 구현합니다.

- `UILabel`, `UITableView`, `UIButton` 을 이용해서 기본적인 UI 를 구성합니다.
- `UITableViewCell` 에는 프로필 이미지를 보여줄 `UIImageView` 와 이름을 보여줄 `UILabel` 을 넣습니다. 전화번호를 표시할 `UILabel` 도 넣습니다.
- 프로필 이미지는 원모양이 되도록 합니다.
- “추가” 버튼을 우상단에 위치 시킵니다.
- Cell 의 높이는 80으로 지정합니다.
- 원의 테두리는 `layer.borderColor`, `layer.borderWidth` 개념을 사용하면 구현할 수 있습니다.
- 캡처된 화면은 임의의(더미) dataSource 를 끼워넣어 UI 를 확인한 모습입니다.

```
<br><br><br><br><br>

### Level 2~3

---

<img src="https://teamsparta.notion.site/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2F83c75a39-3aba-4ba4-a792-7aefe4b07895%2F11c3c37e-64e1-454e-bedf-3e9c34f327d9%2FUntitled.png?table=block&id=2e5a2887-df83-4c9a-b05c-b642f09e1111&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=860&userId=&cache=v2" alt="Level 2,3 구현 예시" width=33% align="left">

<br><br>

```text

🧑🏻‍💻 **Level2 -** 연락처 추가화면을 구현합니다.

- 메인화면에서 “추가”버튼을 누르면 이 페이지로 이동하도록 합니다. `UINavigationController.push` 사용
- 연락처를 편집하거나 새롭게 추가할 페이지를 개발합니다. (`PhoneBookViewController.swift`)
- 프로필 이미지: `UIImageView`
- 랜덤 이미지 생성 버튼: `UIButton`
- 이름: `UITextView`
- 전화번호: `UITextView`

**Level 3** - 상단 네비게이션 바 영역을 구현합니다.

- 상단에 “제목” 과 “적용” 버튼을 개발합니다.
- `UINavigationController` 의 상단에는 `UINavigationBar` 가 자동으로 생성됩니다.
- `UINavigationItem` , `UINavigationBar` 의 개념을 공부하면 개발할 수 있게 됩니다. 직접 공부하고 구현을 성공해봅시다.

```

<br><br>

### Level 4

---

<img src="https://teamsparta.notion.site/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2F83c75a39-3aba-4ba4-a792-7aefe4b07895%2F2f1c0aab-911e-4401-80f6-1529ce5372f7%2FUntitled.png?table=block&id=36cea6fb-ac2b-4ebe-ac48-1e4906e210d2&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=880&userId=&cache=v2" alt="Level 4 구현 예시" width=33% align="left">

<br><br>

```text

🧑🏻‍💻 **Level 4 - API 연결**

- `랜덤 이미지 생성` 버튼을 구현합니다.
- 버튼을 클릭할때마다 랜덤한 포켓몬 이미지를 불러옵니다.
- 포켓몬 API 를 생성해서 랜덤 포켓몬 이미지를 프로필로 지정해봅시다.
- https://pokeapi.co/

- **API 명세**
    - `GET` 메서드 사용
    - URL: `https://pokeapi.co/api/v2/pokemon/{1~1000사이의랜덤숫자입력}`

```

<br><br><br><br><br><br>

Json Response 형태 (더 많은 정보를 받을 수 있지만 이 정도만 받아봅시다.)

여기서 `front_default` 가 포켓몬의 정면 이미지 url 입니다.

```swift
{
  "id": 25,
  "name": "pikachu",
  "height": 4,
  "weight": 60,
  "sprites": {
    "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png"
  }
}
```

<br>

### Level 5

---

- 적용 버튼을 누르면 연락처 데이터(이름/전화번호/프로필이미지)를 디스크에 실제 저장하도록 구현합니다. (데이터 Create) (만약 가능하다면 `CoreData` 방식, `UserDefaults` 방식 모두 구현해보세요.)
- 디스크에 저장됨과 동시에, 메인화면으로 돌아오도록 구현합니다. `UINavigationController.popViewController`  이용.
- 메인화면으로 돌아왔을 때, 방금 저장한 연락처 데이터가 보여야합니다. View Lifecycle 을 잘 활용해보세요.
- 저장된 연락처 데이터들을 메인화면 테이블 뷰의 DataSource 로 적용.

<br>

### Level 6

---

- 연락처 추가를 마치고 메인화면으로 돌아왔을 때 항상 이름 순으로 정렬되게 해봅시다.
- 직접 검색을 통해 알아내고 구현해보세요 :)

<br>

### Level 7

---

- `UITableViewCell` 을 클릭했을 때도 `PhoneBookViewController` 페이지로 이동되게 합니다.
- [ ]  이때, 추가 버튼을 눌러서 갔던 `PhoneBookViewController` 와 별개의 새로운 ViewController 클래스를 선언해서 생성하지 말아주세요. 그대로 `PhoneBookViewController` 를 사용해서 띄웁니다. 이미 구현되어있는 뷰컨트롤러를 재활용하도록 합니다.
- [ ]  추가 버튼을 눌러서 이동했던 때와 다르게, 이미지, 이름, 전화번호가 입력된 상태로 화면이 띄워지게 해주세요. 이 요구사항의 의미가 헷갈린다면 영상을 참고해주세요.
- [ ]  추가 버튼을 눌러서 이동했던 때와 다르게, 상단 네비게이션 바의 title 이 연락처의 이름이 되도록합니다.

<br>

### Level 8

---

- UITableViewCell 을 클릭해서 이동해온 연락처 편집 페이지에서, 실제로 기기 디스크 데이터에 Update 가 일어나도록 구현합니다.
- “적용” 버튼을 클릭했을때, 새로운 전화번호 데이터를 추가(Create)하는 것이 아닌, 기존 데이터를 수정(Update) 하도록 합니다.
- 그리고 적용 버튼을 클릭하면 다시 메인화면으로 이동하고, 이때 수정된 내용이 반영되어 노출되어야 합니다.

<br>

### 🪜 Challenge - 디테일 키우기!

---

🧑🏻‍💻 Level 1~8 을 구현하고도 여유가 되시는 분들은 아래 심화과정을 고민해보세요 🤓

1. 포켓몬 덩치가 클 때, 이미지 원 영역을 벗어나는 경우가 있습니다. 이 때 원 밖을 벗어나지 않도록 구현해볼 수 있을까요? 원래라면 아래 포켓몬은 날개 부분이 살짝 밖으로 삐져나오게 됩니다.

    <img src="https://teamsparta.notion.site/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2F83c75a39-3aba-4ba4-a792-7aefe4b07895%2Fedcf7578-7064-4637-83a4-d8fd4ca11be4%2FUntitled.png?table=block&id=0e3577ce-5935-4d09-823e-ee4d46da841b&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=480&userId=&cache=v2" width=33%>

2. 연락처를 매우 많이 추가했을 경우(20개 이상), 테이블 뷰 스크롤을 쭉 내리다보면, 이미지가 겹쳐보이거나 텍스트가 제대로 노출되지 않는 문제를 마주칠 수 있습니다. 

    → 이 문제는 `prepareForReuse` 의 개념을 사용하면 해결할 수 있습니다.

    → 구현은 못하더라도 개념 공부를 추천드립니다.

3. 어떻게 구현하냐에 따라서 메인화면에서 우상단의 “추가” 버튼이 잘 클릭되지 않는 함정에 빠지는 분이 있을 수도 있습니다. 이 점을 유의해주세요.
