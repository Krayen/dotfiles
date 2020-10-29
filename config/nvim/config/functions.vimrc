" Custom Scripts
nnoremap <leader>f :call CreateReactFunctionalComponent()<CR>
nnoremap <leader>r :call CreateReactNativeClassComponent()<CR>

func! CreateReactFunctionalComponent()
  " Store path to current folder
  let currentPath = expand("%:h")
  
  " Choose where the component will be created
  " TODO let user type location under src/, check if it exists - if not create
  " it and then create component there. finddir(folderName, "src")
  let path = input("\nCreate functional component in  (1)src/components, (2)current location, (3)src/pages? ", "2")
  if path == "1"
    let path = 'src/components/'
  elseif path == "2"
    let path = currentPath . "/"
  elseif path == "3"
    let path = 'src/pages/'
  else
    return 
  endif

  " Store user input for component name
  echo "\nYour component will be created in " . path
  let componentName = input("Component name? " )

  let fullPathAndName = path . componentName

  " create a new directory according to user input and index and styles files
  silent call mkdir(fullPathAndName)

  " create styles file and insert skeleton
  silent exe "e " . fullPathAndName . "/styles.scss"
  silent 0r ~/.dotfiles/templates/react-styles-skeleton.scss

  " create index file and insert skeleton, replace TEMP with the componentName
  silent exe "vne " . fullPathAndName . "/index.js"
  silent 0r ~/.dotfiles/templates/react-functional-skeleton.js
  silent %s/TEMP/\=componentName/g
  silent wall
  
  echo "\nComponent " . componentName . " created in " . path
endfunc

func! CreateReactNativeClassComponent()
  " Store path to current folder
  let currentPath = expand("%:h")
  
  " Choose where the component will be created
  " TODO let user type location under src/, check if it exists - if not create
  " it and then create component there. finddir(folderName, "src")
  let path = input("\nCreate class component in  (1)src/components, (2)current location, (3)src/screens? ", "2")
  if path == "1"
    let path = 'src/components/'
  elseif path == "2"
    let path = currentPath . "/"
  elseif path == "3"
    let path = 'src/screens/'
  else
    return 
  endif

  " Store user input for component name
  echo "\nYour component will be created in " . path
  let componentName = input("Component name? " )

  let fullPathAndName = path . componentName

  " create a new directory according to user input and index and styles files
  silent call mkdir(fullPathAndName)

  " create styles file and insert skeleton
  silent exe "e " . fullPathAndName . "/styles.js"
  silent 0r ~/.dotfiles/templates/react-native-styles.js

  " create index file and insert skeleton, replace TEMP with the componentName
  silent exe "vne " . fullPathAndName . "/index.js"
  silent 0r ~/.dotfiles/templates/react-native-skeleton.js
  silent %s/TEMP/\=componentName/g
  silent wall
  
  echo "\nComponent " . componentName . " created in " . path
endfunc

