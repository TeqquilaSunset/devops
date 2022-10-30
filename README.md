# Описание
Этот репозиторий служит для хранения и работы с резюме в формате yaml.

## Требования
Чтобы успешно работать с данным репозиторием вам понадобиться:

- [yq v4](https://mikefarah.gitbook.io/yq/)
- [yaml-cv](https://github.com/haath/yaml-cv)
- [wkhtmltopdf](https://github.com/wkhtmltopdf/wkhtmltopdf)
- [Taskfile](https://taskfile.dev)
- [pre-commit](https://pre-commit.com)

Для корректной работы необходимо все из выше перечисленного

## Проверка корректности с pre-commit

Сначала нобходимо провести инцилизацию:
```shell
pre-commit install
```

Запуск и проверка всех фалов:
```shell
pre-commit run --all-fiels
```

## Сборка и использование

Вывод всех доступных команд:
```shell
task --list-all
```

Сборка (создание резюме в отдельной папке "build"):
```shell
task build
```

Конвертация в json:
```shell
task json
```

Поиск по уровню владения навыком (junior, middle, senior):
```shell
task skill_by_level -- <level>
```

### Структура резюме
Шаблон резюме в формате [yaml-cv](https://github.com/haath/yaml-cv)

Исходный код включает 2 компонента:

**Основная информация(без навыков):**
- [source/yamlbasic.yaml](src/yamlcv.yaml)

**Навыки:**
- [source/yamlskills.yaml](src/skills.yaml)
Навык должен обязательно включать `category` и `name`.
