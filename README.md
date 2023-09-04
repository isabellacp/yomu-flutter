# Yomu Journal

### An online journal to help you keep track of your manga library.

Atividade Prática da disciplina de Desenvolvimento Mobile -- Isabella Costa 726540


Feito em:
- Flutter (3.10.4)
- GoRouter para rotas.

Paginas
- AltenativeHome
- Profile
- Details

Uso de APIs:
- Kitsu API
- Para fazer as chamadas, foi utilizado o package http
- O codigo está em api_calls.dart

- Endpoints:


- - https://kitsu.io/api/edge/manga/{filtro}: Usado pra fazer busca


- - https://kitsu.io/api/edge/manga/${mangaId}: Usado pra pegar um manga especifico

- - https://kitsu.io/api/edge/manga/${mangaId}/genres: Usado pra pegar os generos de um manga


- - https://kitsu.io/api/edge/manga/${mangaId}/chapters: Usado pra pegar capitulos de um manga


- - https://kitsu.io/api/edge/trending/manga: retorna mangas trending


- - https://kitsu.io/api/edge/chapters/${chapterId}/manga: Dado um chapter, retorna o manga



Como o armazenamento funciona:
- Tudo é salvo no SharedPreferences. Temos 3 variaveis que são salvas: chapterReading, chapterRead, favoritedManga

#### COMO RODAR
Rodar o projeto no Android Studio + Plugin Flutter 3.10.4
