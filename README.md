# Module 3 [Реляційні СУБД. Мова SQL]

## Брифінг
Ти працюєш в компанії MegaSoft, яка розробляє програмне забезпечення на замовлення. Спрощена модель роботи виглядає наступним чином:

- у компанії є __працівники__. Про кожного працівника відома наступна інформація:
  - дата народження
  - рівень технічого розвитку (може бути одним з - Trainee, Junior, Middle, Senior)
  - заробітна плата в доларах в місяць
- __клієнти__ звертаються з __проєктом__. Спеціалісти з компанії оцінюють проєкт і заповнюють для цього проєкту наступні дані:
  - дата початку виконання проєкту
  - дата завершення виконання проєкту
  - далі на проєкт назначають працівників

Зв'язки між сутностями:

- один клієнт може замовити `0, `1 або більше проєктів. У проєкта завжди є лише один замовник.
- один працівник може працювати над `0`, `1` або більше проєктів. В той же час над одним проєктом може працювати `0`, `1` або більше працівників.

## Завдання №1 - спроєктувати БД
Створи файл `init_db.sql`, у якому змоделюй структуру бази даних для компанії MegaSoft згідно брифінгу. Мають бути наступні таблиці:

- `worker` - таблиця для працівників. У таблиці мають бути наступні поля:
  - `ID` - ідентифікатор працівника, ціле число, сурогатний первинний ключ
  - `NAME` - ім'я працівника, рядок. Обмеження - не має бути `NULL`, довжина має бути від `2` до `1000` символів включно
  - `BIRTHDAY` - дата народження. Рік у цій даті має бути більшим за `1900`
  - `LEVEL` - рівень технічного розвитку працівника. Має бути обмеження - це поле не може бути `NULL`, значення поля може бути одним з - `Trainee`, `Junior`, `Middle`, `Senior`
  - `SALARY` - заробітна плата працівника за __1 місяць__. Обмеження - ціле число, не менше `100` і не більше `100 000`
- client - таблиця для клієнтів. Мають бути наступні поля:
  - `ID` - ідентифікатор клієнта, ціле число, сурогатний первинний ключ
  - `NAME` - ім'я працівника, рядок. Обмеження - не має бути `NULL`, довжина має бути від `2` до `1000` символів включно
- `project` - таблиця для проєктів. Мають бути наступні поля:
  - `ID` - ідентифікатор проєкту, ціле число, сурогатний первинний ключ.
  - `CLIENT_ID` - ідентифікатор клієнта, що замовив цей проєкт
  - `START_DATE` - дата початку виконання проєкту
  - `FINISH_DATE` - дата кінця виконання проєкту
- `project_worker` - таблиця, що показує, які працівники над якими проєктами працюють. Поля таблиці:
  - `PROJECT_ID` - ідентифікатор проєкту. Зовнішній ключ для таблиці `project(id)`
  - `WORKER_ID` - ідентифікатор клієнту. Зовнішній ключ для таблиці `worker(id)`
  - первинний ключ для цієї таблиці - складений, пара (`PROJECT_ID`, `WORKER_ID`)

## Завдання №2 - наповнити БД
Створи файл `populate_db.sql`, у якому напиши SQL для заповнення таблиць. Після виконання SQL БД має бути приведена у наступний стан:

- додано щонайменше `10` працівників, мінімальна зарплата має бути менше за `1000`, максимальна - більше за `5 000`, мають бути всі технічні рівні (`Trainee`, `Junior`, `Middle`, `Senior`)
- додано щонайменше `5` клієнтів
- додано щонайменше `10` проєктів. Тривалість кожного проєкту (різниця `START_DATE` та `FINISH_DATE`) має бути від `1` до `100` місяців.
- назначені працівники на кожен проєкт. Над кожним проєктом має працювати від `1` до `5` працівників.

## Завдання №3 - знайти працівника з найбільшою заробітною платою
Створи файл `find_max_salary_worker.sql`. У ньому напиши SQL, який виведе працівника з найбільшою заробітною платою. Якщо таких працівників декілька - потрібно вивести всіх.

Приклад результуючої таблиці:

<table>
    <tr>
        <th>NAME</th>
        <th>SALARY</th>
    </tr>
    <tr>
        <td>John Doe</td>
        <td>1000</td>
    </tr>
</table>

Завдання №4 - знайти клієнта з найбільшою кількістю проєктів
Створи файл find_max_projects_client.sql. У ньому напиши SQL, який виведе клієнта з найбільшою кількістю проєктів. Якщо таких клієнтів декілька - потрібно вивести всіх.

Приклад результуючої таблиці:

NAME	PROJECT_COUNT
John Doe	3
Mix Max	3
Завдання №5 - знайти проєкт з найбільшою тривалістю
Створи файл find_longest_project.sql. У ньому напиши SQL, який виведе проєкт з найбільшою тривалістю в місяцях. Якщо таких проєктів декілька - потрібно вивести всі ці проєкти.

Приклад результуючої таблиці:

NAME	MONTH_COUNT
Project A	27
Project B	27
Завдання №6 - знайти найстаршого та наймолодшого працівника
Створи файл find_youngest_eldest_workers.sql. У ньому напиши SQL, який вибере наймолодшого та найстаршого працівників, та виведе їх у форматі таблиці з наступними полями:

TYPE - тип (може бути YOUNGEST або OLDEST)
NAME - ім'я працівника
BIRTHDAY - дата народження працівника
Якщо є декілька наймолодших/найстарших працівників - то необхідно вивести їх всіх.

Приклад таблиці:

TYPE	NAME	BIRTHDAY
YOUNGEST	John Doe	2000-01-07
YOUNGEST	John Doe	2000-01-07
ELDEST	Maxim	1980-06-17
Завдання №7 - вивести вартість кожного проєкту
Створи файл print_project_prices.sql. У ньому напиши SQL, який виведе список проєктів та вартість кожного проєкту.

Вартість проєкту - це сума заробітних плат працівників, що працюють над цим проєктом, помножених на тривалість у місяцях проєкту.

Наприклад, над проєктом Project A працюють працівники Max (заробітна плата 1000) та Joe (заробітна плата 1500). Проєкт триває 17 місяців. Тоді вартість проєкту Project A = 17 * (1000 + 1500) = 42500

Відсортуй проєкти по спаданню - спочатку виведи найдорожчі проєкти.

Приклад таблиці:

NAME	PRICE
Project A	42500
Project B	18000
Завдання №8 - оформи все в Github репозиторій
Створи новий репозиторій на GitHub. Додай туди всі створені .sql файли. Переконайсь, що в репозиторії немає зайвих файлів.

Результат виконання ДЗ - GitHub репозиторій зі всіма SQL файлами.
