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
always, by using the type inference
> swift knows exactly what kind of function this is supposed to be.
>>**the type is declared in the viewModel and Model, and because the return statement is the only statement inside the function so we don't need it as well, and because it is the last argument to a function and it takes a function as the type so the closure above can be rewrite like this, without argument name and index name:**
`..) { pairIndex in "..."}` 

**Using static can keep the variable's "namespace" inside a class but it is essentially a global variable**
`static let emojis = [...]`
So the program will not crush due to the globalization of `emojis`. Its full name is `EmojiMemoryGame.emojis`.

when the `static` type is been used in a instance it must be wirtten in full name. like `EmojiMemoryGame.emojis`.