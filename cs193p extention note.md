# Extension
**init in struct**
```swift
init(numberOfPairOfLabels: Int, createCardContent:(Int) -> CardContent){
    labels = Array<Label>()
    for pairIndex in 0..<numberOfPairOfLabels{
        var content: CardContent = creatCardContent(pairIndex)
        labels.append(...)
    }//pairIndex is an index element it is same as the for loop in java.
}
```
~~var content: CardContent~~ `let content = createCardContent(...)` the type of function `createCardContent` in the argument is declared as the `CardContent` type, so the variable declaration is unecessary to declared as `CardContent`

**sample of createCardContent function**
```swift
func makeCardContent(index: Int) -> String{
    return ...
}
```
**or use the closure(less codes)**
```swift
    Daily<String>(numberOfPairOfCards:..., createCardContent: {(index: Int) -> String in
        return "..."
    })
```
always, by using the **type inference**
> swift knows exactly what kind of function this is supposed to be.
>>**the type is declared in the viewModel and Model, and because the return statement is the only statement inside the function so we don't need it as well, and because it is the last argument to a function and it takes a function as the type so the closure above can be rewrite like this, without argument name and index name:**
`..) { pairIndex in "..."}` 

**Using static can keep the variable's "namespace" inside a class but it is essentially a global variable**
`static let emojis = [...]`
So the program will not crush due to the globalization of `emojis`. Its full name is `EmojiMemoryGame.emojis`.

when the `static` type is been used in a instance it must be wirtten in full name. like `EmojiMemoryGame.emojis`.

## Viewmodel
The tapGesture and user interaction should be placed in the model.
`ContentView` is used to give out the UI and draws the `model`. `var viewMdel: EmojiMemoryGame`.
**`let game = EmojiMemoryGame` the game is a constant because it points to the emoji memory game but the EmojiMemoryGame is a class instance in program, so it can be changed.**

**sampel codes:**
```swift
private var mdoel: MemoryGame<String> = createMemoryGame()

var cards: Array<MemoryGame<String>.Card>{
    model.cards
}
// here, the model is totally private, the cards provide an ensurance that programmer do not need to use viewModel.model.cards, which exposing our model.
//So maybe, maybe it is unecessary, and we can just type down
private(set) var model: MemoryGame<String> = createMemoryGame()
//and ignore the function below.
```

**Label view**
```swift
struct LabelView: View {
    let label: Daily<String>.Label//it is the label build in the model.

    var body: some View{
        ...
    }
}
```

We should make the label indentifiable.`...Label: Indentifiable{var id = "Don't care type"}`

Just same as the function showed in the lecture, we should have a `func choose(_ card: Card){}`
Using print to check whether the program work.
sample codes
```swift
func choose(_card: Card){
    let chosenIndex = index(of: card)
    var chosenCard = cards[chosenIndex]
    chosenCard.isFaceUp.toggle()//Obviously, the logic of "Daily" should be a navigation to the detailed page of the card.
}

func index(of card: Card) -> Int{
    return 0
 }
 ```
 **Use `\()` to convert a don't care into a String**
 **Codeing art...hhh:** `let chosenIndex = index(of: card)` `func index(of card: Card)` be readable!!!!
 
