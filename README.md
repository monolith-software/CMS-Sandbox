Monolith CMS Development Sandbox
================================

@TODO
-----
 - Knp\Bundle\MenuBundle\Provider\BuilderAliasProvider:getBuilder - При одинаковом имени класса подхватывает класс из первого попавшегося бандла.
 - Возможность кастомизировать сущность User. 
 - Переделать загрузку файлов в МК через \Symfony\Component\HttpFoundation\File\File вместо UploadedFile
 
 
Conflicts with Symfony 4
------------------------
 - "egulias/listeners-debug-command-bundle": "*",
 - "sensio/distribution-bundle": "^5.0.19",
 - "kleegroup/google-recaptcha-bundle": "^1.0",
 - "sensio/generator-bundle": "^3.0",
 - "liuggio/excelbundle": "^2.1", 
 - "phpdocumentor/reflection-docblock": "*",

Git submodule hints
-------------------
 
Получение последней версии песочницы:
```
    git pull;git submodule update --init
``` 

Обновление подмодулей из удалённых репозиториев:
```
    git submodule update --remote
``` 

Решение проблемы с detached head, переключение всех подмодулей в master:
```
    git submodule foreach 'git checkout master'
``` 

Удаление подмодуля (например `src/SmartCore/Bundle/SimpleProfilerBundle`):
```
    git submodule deinit -f src/SmartCore/Bundle/SimpleProfilerBundle
    git rm -f src/SmartCore/Bundle/SimpleProfilerBundle
    rm -rf .git/modules/src/SmartCore/Bundle/SimpleProfilerBundle
``` 

