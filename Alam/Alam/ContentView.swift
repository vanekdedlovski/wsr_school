//
//  ContentView.swift
//  Alam
//
//  Created by bnkwsr2 on 03.12.2021.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
//    @StateObject var postModule = PostModule()
//    @StateObject var commentModule = CommentModule()
//    @StateObject var albumsModule = AlbumsModule()
//    @StateObject var photoModule = PhotoModule()
//    @StateObject var todosModule = TodosModule()
//    @StateObject var usersModule = UsersModule()
        @StateObject var chatsModule = ChatsModule()
        @StateObject var moviesModule = MoviesModule()
    @StateObject var filterModule = FilterModule()
    @StateObject var filmModule = FilmModule()
    var body: some View {
        
//        ScrollView(.vertical) {
//            VStack {
//                Text("123")
//                ForEach(postModule.Posts, id:\.id) { post in
//                    LazyVStack {
//                        Text("\(post.userId)")
//                        Text("\(post.id)")
//                        Text("\(post.title)")
//                        Text("\(post.body)")
//                    }
//                }
//            }
//            .onAppear {
//                postModule.GetPost()
//        }
//
//
//            VStack {
//
//                ForEach(commentModule.Comments, id:\.id) { comment in
//                    LazyVStack {
//                        Text("\(comment.postId)")
//                        Text("\(comment.id)")
//                        Text("\(comment.name)")
//                        Text("\(comment.email)")
//                        Text("\(comment.body)")
//
//                    }
//                }
//            }
//            .onAppear {
//                commentModule.GetComment()
//            }
//
//
//            VStack {
//                ForEach(albumsModule.AlbumsS, id:\.id) { album in
//                    LazyVStack {
//                        Text("\(album.userId)")
//                        Text("\(album.id)")
//                        Text("\(album.title)")
//
//                    }
//
//                }
//            }
//            .onAppear {
//                albumsModule.GetAlbums()
//            }
//
//
//            VStack {
//                ForEach(photoModule.Photos, id:\.id) { photo in
//                    LazyVStack {
//                        KFImage(URL(string: photo.thumbnailUrl )!)
//                    }
//
//                }
//            }
//            .onAppear {
//                photoModule.GetPhotos()
//            }
//
//
//            LazyVStack {
//                ForEach(todosModule.Todos, id:\.id) { todos in
//                    Text("\(todos.userId)")
//                    Text("\(todos.id)")
//                    Text("\(todos.title)")
//                    Text("\(todos.completed ? "Выполнил" : "Невыполнил")")
//                }
//            }
//            .onAppear {
//                todosModule.GetTodos()
//            }
//
//
//            LazyVStack {
//                ForEach(usersModule.Users, id:\.id) { user in
//                    VStack {
//                        Text("\(user.id)")
//                        Text("\(user.name)")
//                        Text("\(user.username)")
//                        Text("\(user.email)")
//                        Text("\(user.address.street)")
//                        Text("\(user.address.suite)")
//                        Text("\(user.address.city)")
//                        Text("\(user.address.zipcode)")
//                        Text("\(user.address.geo.lat)")
//                        Text("\(user.address.geo.lng)")
//                    }
//                    VStack {
//                        Text("\(user.phone)")
//                        Text("\(user.website)")
//                        Text("\(user.company.name)")
//                        Text("\(user.company.catchPhrase)")
//                        Text("\(user.company.bs)")
//                    }
//
//
//
//                }
//            }
//            .onAppear {
//                usersModule.GetUsers()
//            }
//
//    }
//        ScrollView(.vertical) {
//            VStack {
//                ForEach(chatsModule.Chats, id:\.chatId) { chat in
//                    Text("\(chat.chatId)")
//                    Text("\(chat.name)")
//                }
//            }
//            .onAppear {
//                chatsModule.GetChats()
//            }
//        }
//        ScrollView(.vertical) {
//            KFImage(URL(string: "http://cinema.areas.su/up/images/\(moviesModule.movie?.backgroundImage ?? "")"))
//            KFImage(URL(string: "http://cinema.areas.su/up/images/\(moviesModule.movie?.foregroundImage ?? "")"))
//                }
//
//            .onAppear {
//                moviesModule.GetMovies()
//            }
        ScrollView(.vertical) {
            VStack {
                ForEach(filterModule.Filters, id:\.movieId) { filter in
                    Text("\(filter.movieId)")
                    Text("\(filter.name)")
                    Text("\(filter.description)")
                    Text("\(filter.age)")
                    ForEach(filter.images, id:\.self) { img in
                        KFImage(URL(string: "http://cinema.areas.su/up/images/\(img)"))
                    }
                    Text("\(filter.poster)")
                    ForEach(filter.tags, id:\.idTags) { tag in
                        Text("\(tag.idTags)")
                        Text("\(tag.idTags)")
                    }

                }
            }
            .onAppear {
                filterModule.GetFilter()
            }
        }
//        ScrollView(.vertical) {
//            VStack {
//                Text("\(filmModule.film?.movieId ?? "" )")
//                Text("\(filmModule.film?.name ?? "")")
//                Text("\(filmModule.film?.description ?? "")")
//                Text("\(filmModule.film?.age ?? "")")
//                ForEach(filmModule.film?.images ?? [], id:\.self) { img in
//                    KFImage(URL(string: "http://cinema.areas.su/up/images/\(img)"))
//                }
//                Text("\(filmModule.film?.poster ?? "")")
//                ForEach(filmModule.film?.tags ?? [], id:\.idTags) { tag in
//                    Text("\(tag.idTags)")
//                    Text("\(tag.idTags)")
//                }
//            }
//            .onAppear {
//                filmModule.GetFilms()
//            }
//        }
        
        }
        }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
