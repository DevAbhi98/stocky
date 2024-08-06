//
//  NewArticleView.swift
//  StocksApp
//
//  Created by The Seven Stallions on 07/07/22.
//

import SwiftUI
import URLImage

struct NewArticleView: View {
    
    let articles:[ArticleViewModel]
    let onDragBegin:(DragGesture.Value) -> Void
    let onDragEnd:(DragGesture.Value) -> Void
    
    var body: some View {
        
        let screenSize = UIScreen.main.bounds.size
        
        return ZStack {

            VStack(alignment: .leading){
                
                HStack {
                    Spacer()
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 40, height: 8)
                        .cornerRadius(20)
                        .padding(.top, 10)
                        .padding(.bottom)
                    Spacer()
                }
                .gesture(DragGesture()
                    .onChanged(self.onDragBegin)
                    .onEnded(self.onDragEnd)
                )
                HStack {
                    Text("Top Stories")
                        .foregroundColor(Color("White"))
                        .font(.system(size: 28, weight: .bold))
                        .padding(.leading)
                    
                    Spacer()
                }
                .gesture(DragGesture()
                    .onChanged(self.onDragBegin)
                    .onEnded(self.onDragEnd)
                )
                Text("From News")
                    .foregroundColor(Color.gray)
                    .padding(.leading)
                Divider()
                    .padding(.leading)
                    .padding(.trailing)
                
                ScrollView{
                    VStack(alignment:.leading){
                        ForEach(articles, id:\.title){ article in
                            HStack{
                                VStack(alignment: .leading){
                                    Text(article.publication)
                                        .foregroundColor(Color("White"))
                                        .font(.custom("Arial", size: 22))
                                        .fontWeight(.bold)
                                    Text(article.title)
                                        .font(.custom("Arial", size: 22))
                                        .foregroundColor(Color("White"))
                                    Spacer()
                                }
                                Spacer()
                                
                                VStack{
                                    URLImage(URL(string: article.imageURL)!, content: {image in
                                        image.resizable()
                                    })
                                    .scaledToFill()
                                    .frame(width:150, height:150)
                                    .cornerRadius(20)
                                    Spacer()
                                }
                                .padding(.trailing)
                            }
                        }
                    }
                    .padding(.leading)
                }.frame(maxWidth:.infinity)
                
                Spacer()
            }//:MAIN VSTACK
            .background(Color("BackgroundColor"))
            .cornerRadius(20)
        }
    }
}

struct NewArticleView_Previews: PreviewProvider {
    static var previews: some View {
        NewArticleView(articles: [ArticleViewModel(article: Article(title: "Hello There", imageURL: "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5f2c667737950e6bf2338de1%2F0x0.jpg", publication: "Bloomberg"))], onDragBegin: {value in
            
        }, onDragEnd: { value in
            
        })
    }
}
