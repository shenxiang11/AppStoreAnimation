//
//  ContentView.swift
//  AppStoreAnimation
//
//  Created by 香饽饽zizizi on 2024/2/19.
//

import SwiftUI

struct ContentView: View {
    @State private var showDetail = false
    @Namespace var animation

    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack(alignment: .bottom) {
                        Text("Today")
                            .font(.title.bold())

                        Text("2月19日")
                            .font(.title2.bold())
                            .foregroundStyle(.gray)

                        Spacer()
                    }

                    Color.gray.opacity(0.3)
                        .frame(height: 240)
                        .clipShape(.rect(cornerRadius: 25, style: .continuous))

                    Image(.danzai)
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .overlay(alignment: .bottomLeading) {
                            VStack(spacing: 0.0) {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("主打推荐")
                                            .font(.callout.bold())
                                            .foregroundStyle(.white)

                                        Text("蛋仔冲冲冲")
                                            .font(.title2.bold())
                                            .foregroundStyle(.white)
                                    }
                                    Spacer()
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background {
                                    LinearGradient(colors: [.clear, .black.opacity(0.3)], startPoint: .top, endPoint: .bottom)
                                }

                                HStack {
                                    Image(.logo)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .clipShape(.rect(cornerRadius: 10, style: .continuous))

                                    VStack(alignment: .leading, spacing: 4.0) {
                                        Text("蛋仔派对")
                                            .font(.system(size: 16).bold())
                                            .foregroundStyle(.white)

                                        Text("蛋仔冲国民原创乐园游戏")
                                            .font(.system(size: 14).bold())
                                            .foregroundStyle(.white.opacity(0.9))
                                    }

                                    Spacer()

                                    Image(systemName: "icloud.and.arrow.down")
                                        .foregroundStyle(.white)
                                        .font(.title2.bold())
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(.ultraThinMaterial)
                            }
                        }
                        .matchedGeometryEffect(id: "danzai", in: animation)
                        .clipShape(.rect(cornerRadius: 20, style: .continuous))
                        .onTapGesture {
                            withAnimation {
                                showDetail = true
                            }
                        }

                    Color.gray.opacity(0.3)
                        .frame(height: 240)
                        .clipShape(.rect(cornerRadius: 25, style: .continuous))
                    
                    Color.gray.opacity(0.3)
                        .frame(height: 240)
                        .clipShape(.rect(cornerRadius: 25, style: .continuous))

                    Color.gray.opacity(0.3)
                        .frame(height: 240)
                        .clipShape(.rect(cornerRadius: 25, style: .continuous))
                }
                .padding()
            }
        }
        .overlay {
            if showDetail {
                DetailView(showDetail: $showDetail, animation: animation)
            }
        }
    }
}

struct DetailView: View {
    @Binding var showDetail: Bool
    var animation: Namespace.ID
    @State var viewState: CGSize = .zero
    @State var showContent = true

    var body: some View {
        ZStack {
            Color.white

            Color.black.opacity(0.25)

            ScrollView {
                VStack {
                    ZStack(alignment: .topTrailing) {
                        Image(.danzai)
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .overlay(alignment: .bottomLeading) {
                                VStack(spacing: 0.0) {
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text("主打推荐")
                                                .font(.callout.bold())
                                                .foregroundStyle(.white)

                                            Text("蛋仔冲冲冲")
                                                .font(.title2.bold())
                                                .foregroundStyle(.white)
                                        }
                                        Spacer()
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background {
                                        LinearGradient(colors: [.clear, .black.opacity(0.3)], startPoint: .top, endPoint: .bottom)
                                    }

                                    HStack {
                                        Image(.logo)
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                            .clipShape(.rect(cornerRadius: 10, style: .continuous))

                                        VStack(alignment: .leading, spacing: 4.0) {
                                            Text("蛋仔派对")
                                                .font(.system(size: 16).bold())
                                                .foregroundStyle(.white)

                                            Text("蛋仔冲国民原创乐园游戏")
                                                .font(.system(size: 14).bold())
                                                .foregroundStyle(.white.opacity(0.9))
                                        }

                                        Spacer()

                                        Image(systemName: "icloud.and.arrow.down")
                                            .foregroundStyle(.white)
                                            .font(.title2.bold())
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(.ultraThinMaterial)
                                }
                            }
                            .matchedGeometryEffect(id: "danzai", in: animation)

                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.title3.bold())
                            .padding(6)
                            .background {
                                Circle().fill(.black.opacity(0.8))
                            }
                            .offset(.init(width: -20, height: 40))
                            .opacity(1.0 - viewState.width/120)
                            .onTapGesture {
                                close()
                            }
                    }

                    if showContent {
                        VStack(alignment: .leading) {
                            Text("尽情跳跃、翻滚和碰撞，这款轻松休闲的派对游戏，值得一玩。")
                                .font(.callout.bold())

                            Divider()

                            Text("""
        欢迎光临蛋仔岛！《蛋仔派对》是一款拥有5亿玩家的国民原创乐园游戏。在这里，你将化身Q萌的蛋仔，在盲盒机背后的神秘世界——蛋仔岛，展开一段奇妙的闯关之旅。游戏内含上百张风格各异的地图关卡、数十种休闲娱乐玩法，不怕手残，趣味无穷\\~海量高萌盲盒外观，来邂逅你的心动款！自由度极高的乐园编辑器，助你打造独一无二的乐园地图！更有充满脑洞与想象的蛋仔乐园，集结上亿张玩家原创乐园地图，等你和蛋搭子一同游玩打卡！


        【神秘盲盒机背后，有个奇趣蛋仔岛】

        你有没有好奇过，盲盒机内部有着怎么样的故事呢？盲盒机背后的蛋仔岛上，生活着无数可爱的蛋仔。它们的梦想是从一场场派对中胜出，争夺象征胜利的金币，而胜出的蛋仔将被传送到人类世界！


        【萌蛋智勇大冲关，海量关卡任你玩】

        滚动、碰撞、火花四射！数十个新奇关卡，超百变陷阱机关，争先恐后往前冲！不但有竞速、团队、生存关卡，更有捉迷藏、一线牵等特殊玩法，保证派对新鲜有趣不无聊！


        【创意编辑器乐园，个性地图随心造】

        在蛋仔工坊发挥创意和脑洞，创作你的专属关卡吧！零门槛上手，上百种组件道具自由摆放，一键发布原创地图，让更多玩家体验你的杰作！叫上蛋搭子前往乐园打卡美妙的玩家自制地图，解锁新鲜有趣的经历！


        【圆滚滚百变外观，解锁你的心动款】

        进入巨型盲盒机，感受拆盲盒的快乐！我们准备了海量精致酷炫的盲盒，潮流、萌趣的可爱蛋仔，等你收入囊中！更有可供你DIY的服饰配件，穿搭出你独一无二的style！


        【超Q弹物理碰撞，duang到停不下来】

        闯关开趴，撞到开花！圆滚滚的蛋仔不但奔跑速度惊人，冲撞起来威力同样巨大，为闯关带来意想不到的效果！和队友撞个满怀，将对手怼出赛道，蛋仔法则就是duang~
        """)
                        }
                        .padding()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .background(.white)
            .clipShape(.rect(cornerRadius: viewState.width/2, style: .continuous))
            .gesture(drag)
            .scaleEffect(-viewState.width/800 + 1)
        }
        .ignoresSafeArea()
    }

    var drag: some Gesture {
        DragGesture(minimumDistance: 30, coordinateSpace: .local)
            .onChanged { value in
                guard value.translation.width > 0 else {
                    return
                }

                if value.startLocation.x < 100 {
                    withAnimation {
                        viewState = value.translation
                    }

                    if viewState.width > 80 {
                        close()
                    }
                }
            }
            .onEnded { value in
                if viewState.width > 80 {
                    close()
                } else {
                    withAnimation {
                        viewState = .zero
                    }
                }
            }
    }

    private func close() {
        withAnimation(.easeOut) {
            showDetail = false
            viewState = .zero
        }
        showContent = false
    }
}

#Preview {
    ContentView()
}
