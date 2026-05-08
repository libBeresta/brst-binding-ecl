# brst-binding-ecl

Языковая привязка библиотеки libBeresta для языка Embeddable Common Lisp.

[`libBeresta`][libBeresta] &ndash; свободная, открытая,
кросс-платформенная библиотека для генерации PDF-файлов.


Этот репозиторий &ndash; член семейства `brst-binding-<lang>` языковых
привязок библиотеки `libBeresta`, предназначенный для [Embeddable
Common Lisp][ecl].  Языковые привязки генерируются автоматически
из&nbps;каноничных определений, представленных в&nbsp;виде S-выражений
в&nbsp;[`gen/data/*.lsp`][gen-data], обновляемых вместе с&nbsp;библиотекой.

## Статус: v1.0.0 &ndash; пре-релиз
- API библиотеки генерируется автоматически из `gen/data/*.lsp`
- реализована только статическая сборка
- сборка проверялась только на Linux
- выпускается совместно с основной библиотекой

## Обязательные составляющие

По соглашению, принятому в библиотеке `libBeresta`, каждая языковая
привязка должна обязательно содержать два файла:
- [README.md](README.md) &ndash; описание языковой привязки
- [CMakeLists.txt](CMakeLists.txt) &ndash; точка входа для генерации
  файлов языковой привязки, проверки её работоспособности и сборки
  отчуждаемого архива.
  
Все остальное содержимое (включая этот файл) определяется
особенностями работы с проектами в [ECL][ecl].

## Быстрый старт

### Установка
Клонируйте репозитории библиотеки и языковой привязки:

```sh
git clone https://github.com/libBeresta/libBeresta.git
git clone https://github.com/libBeresta/brst-binding-ecl.git
```

Постройте библиотеку `libBeresta`:

```sh
cd libBeresta
cmake -S . -B build -DLIBBRST_SHARED_LIB=OFF
cmake --build build
```

### Сборка примера

Вернитесь в папку языковой привязки и создайте файл `test.lisp` со следующим содержимым:

```lisp
(ext:install-c-compiler)
(setf c:*user-cc-flags* "-I../libBeresta/include -I../libBeresta/build/include -fPIC")
(setf c:*user-linker-libs* " -L../libBeresta/build/src/ -lbrst -fPIC -lz")

;; Если uiop доступен, следующая строка корректна.
(pushnew (uiop/os:getcwd) asdf:*central-registry*)

;; В противном случае замените на 
;; (pushnew "<путь до текущей папки>" asdf:*central-registry*)

(asdf:load-system 'cl-beresta)

(load "demos/minimal")

(si:exit 0)
```

Запустите с помощью ECL (версии не ниже 24):

```sh
ecl --load test.lisp
```

### Текст примера
В примере используется содержимое файла `demos/minimal.lisp`:

```lisp
(in-package #:cl-beresta)

(with-pdf-document (pdf "minimal.pdf")
  (let ((page (doc-page-add pdf)))
    (page-setsize page
                  page-size-a4
                  page-orientation-landscape)))
```

## Пересборка библиотеки

Библиотека использует сборочную систему CMake и ECL не ниже версии 24.

Сборка выполняется следующим образом:

```sh
cmake -S . -B build -DLIBBRST_SHARED_LIB=OFF
cmake --build build
```

Если у вас в системе несколько копий ECL, можно выбрать конкретную, указав опцию сборки `ECL_BINARY`.

```sh
cmake -S . -B build -DLIBBRST_SHARED_LIB=OFF -DECL_BINARY=/путь/до/ecl/bin/ecl
cmake --build build
```

Затем выполняется сборка файлов привязки :

```sh
cmake --build build --target binding
```

Минимальное тестирование (smoke-test):

```sh
cmake --build build --target check
```

Сборка архива выполняется командой:
```sh
cmake --build build --target bundle
```

## Лицензия

[Лицензия МИТ](LICENSE) &ndash; также, как и libBeresta.

## Благодарности
- [libHaru][libHaru] &ndash; оригинальная библиотека генерации PDF, на
  основе которой выполнена libBeresta и эта привязка.
- [Kenta Ishizaki](https://github.com/55728) &ndash; умение работать в
  Open Source и подходы к исходным текстам и документам.

[libBeresta]: https://github.com/libBeresta/libBeresta
[libHaru]: https://github.com/libharu/libharu
[gen-data]: https://github.com/libBeresta/libBeresta/tree/master/gen/data
[ecl]: https://ecl.common-lisp.dev/
