Класс Router

При создании объекта класса создается хэш @routes

Метод init вызывает метод  resources с параметрами (название класса PostsController, строка 'posts'(которая будет являтся ключем хэша @routes))
 В бесконечном цикле loop предлагается ввести 1 для постов 2 для коментариев 'q' для выхода,
 в переменную choise  записывается ввод с клавиатуры,
 Если переменная  choise равна 1 вызывется класс PostsController.connection(с хэшом  @routes['с ключом 'posts'']),
 Если переменная  choise равна 'q' выйти из цикла 
 Вывести  'Good bye!'
 
 
 Метод resources содержит два параметра (klass - принимает название класса, keyword - принимает ключ к хешу @routes)
Переменная controller создает обекта класса принятого из параметра (klass)
@routes[keyword] - хеш с ключом принятого из параметра (keyword) равен хешу (запрос 'GET' содержит 2 экешена ('index'- доступен через переменную controller которая содержит обеъкт класса с вызванным методом index (PostsController.index) )и ('show'- PostsController.show ))
(запрос POST доступен через объект класса PostsController.create)
(запрос UPDATE доступен через объект класса PostsController.update)
(запрос DELETE доступен через объект класса PostsController.destroy)


Причина по котрой используется extend для модуля Resourse : 
 В методе init  вызывется метод класса PostsController без создания объекта, методо connection содержир маршруты к экшинам, ему не нужны объекты.
 PostsController.connection(@routes['posts']) if choise == '1'
