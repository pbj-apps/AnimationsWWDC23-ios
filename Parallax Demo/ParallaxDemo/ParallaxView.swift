//
//  ParallaxView.swift
//  Collapsable Header
//
//  Created by Pierre-Antoine Fagniez on 01/08/2023.
//

import SwiftUI

struct ParallaxView: View {
    var body: some View {
        ParallaxScrollView {
            VStack {
                Text("Parallax Example")
                    .font(.system(size: 40))
                    .padding(.bottom, 20)
                
                Text(loremIpsum)
                    .font(.system(size: 17))
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }.edgesIgnoringSafeArea(.bottom)
    }
}

struct ParallaxView_Previews: PreviewProvider {
    static var previews: some View {
        ParallaxView()
    }
}

struct ParallaxScrollView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ZStack {
                GeometryReader { proxy in
                    Image("background")
                        .resizable()
                        .scaledToFill()
                        .scaleEffect(2)
                        .blur(radius: 1)
                        .opacity(0.6)
                        .offset(y: -proxy.frame(in: .global).origin.y / 2)
                }
                
                content
            }
            .ignoresSafeArea()
        }
    }
}

let loremIpsum = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a risus in nunc accumsan sagittis. Nullam eu rutrum odio. Donec pulvinar lorem ac laoreet tincidunt. Pellentesque sed lacus sed magna mollis pulvinar eu quis felis. Aliquam accumsan sapien ac ante sagittis, id sagittis erat euismod. Curabitur ut purus suscipit eros pellentesque ornare a non magna. Nulla facilisi. Pellentesque vel varius orci. Nulla rutrum vulputate varius. Proin augue nunc, tincidunt ut euismod volutpat, dictum sit amet magna. Phasellus eget dolor libero. Ut eget vestibulum urna. Curabitur fringilla pellentesque orci quis egestas.

Cras at velit nec urna aliquam accumsan eu sed risus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus pellentesque rhoncus dolor, ut lacinia ipsum sollicitudin eget. Pellentesque eleifend pretium tortor et consequat. Nunc gravida sapien a semper congue. Donec vitae interdum libero. Vestibulum luctus tincidunt rutrum. Nam aliquam malesuada ligula id semper. Nullam sed vehicula elit, eget pellentesque neque.

Ut at sollicitudin ligula. Morbi vel vestibulum elit. Nulla facilisi. Donec cursus est nec orci fringilla, sit amet mollis augue scelerisque. Nunc in feugiat ipsum. Nunc mauris lacus, feugiat sit amet posuere vel, consequat id sapien. In varius pharetra venenatis. Pellentesque auctor sapien ac libero tempus, pretium facilisis magna sollicitudin. Integer vestibulum interdum dui ac mattis. Donec maximus nunc sit amet urna sodales tristique. Proin facilisis orci ut odio interdum, at placerat augue vehicula. Nulla elementum condimentum nibh, quis ornare nunc cursus id. Fusce pretium velit eu mattis bibendum. Vivamus vitae ante efficitur, vulputate massa at, dignissim urna.

Nulla tristique orci rutrum dolor tincidunt, in eleifend mauris maximus. Etiam accumsan dignissim ante, at gravida lectus sagittis molestie. Donec rutrum nisl ac mauris egestas, quis finibus diam blandit. Maecenas facilisis enim viverra, lobortis urna non, vehicula elit. Pellentesque ultrices consequat lectus, ornare ornare dolor varius sit amet. Nullam et eros ac arcu finibus faucibus et sit amet diam. Quisque auctor ac felis finibus facilisis. Praesent interdum ipsum arcu. In non risus rhoncus, accumsan augue non, interdum justo. Aenean molestie metus sit amet nisl viverra, eu gravida eros condimentum. In dapibus nunc eget fringilla faucibus. Phasellus et interdum dui. Phasellus luctus porta velit, vehicula placerat justo dapibus id. Integer accumsan, turpis eu convallis cursus, eros nibh tincidunt massa, ut consectetur mauris metus in nulla. In quis congue tellus.

Sed vel pulvinar nibh. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec tristique luctus nibh, quis hendrerit sem sagittis quis. Mauris viverra gravida neque sed semper. Vivamus accumsan ullamcorper massa, vitae pulvinar tortor sodales ac. Duis ullamcorper, ante et aliquam suscipit, orci augue pulvinar diam, eget ullamcorper neque urna sed justo. Nunc iaculis quam suscipit, suscipit libero id, varius lectus. Nulla cursus tristique turpis, ut finibus tellus lacinia et. Nunc varius felis eu diam maximus consectetur. Mauris non lacus non dui dignissim auctor quis non nunc. Vivamus et dui et diam malesuada pulvinar vel sed orci. Sed sit amet sodales mi. Phasellus massa massa, commodo nec nisi id, maximus elementum sapien.

Sed eget turpis a nunc interdum pellentesque nec ut turpis. Nulla consectetur in augue sed consequat. Etiam quis scelerisque dolor. Sed cursus congue leo ut tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer aliquam orci vel erat sagittis auctor. Donec dapibus a lectus sit amet pulvinar. Pellentesque laoreet interdum diam eu suscipit.

Vestibulum odio arcu, dapibus vel leo ac, ullamcorper gravida mi. In ornare nibh ligula, sit amet faucibus sem faucibus sit amet. Praesent efficitur quam at odio suscipit, nec tristique eros aliquet. Morbi mi magna, rhoncus eu quam at, vehicula tempor augue. Etiam placerat dictum mi non iaculis. Integer ornare, quam at dictum aliquam, enim tortor faucibus nisi, vel sodales odio nunc eu est. Ut nisl dolor, blandit et sollicitudin nec, tempor non turpis. Etiam eleifend dui nec metus gravida, at efficitur turpis lobortis. Cras scelerisque, diam et cursus dictum, purus ligula efficitur metus, id congue mi massa id enim.

Fusce ante magna, blandit ut porttitor quis, lacinia ac lacus. Morbi efficitur quam nec orci vulputate viverra. Praesent convallis odio et rutrum sodales. Maecenas consectetur, tortor euismod sodales rhoncus, augue justo tristique eros, vitae tincidunt purus metus in tortor. Vestibulum efficitur faucibus nisl et accumsan. Suspendisse erat augue, semper quis tellus ut, interdum ornare libero. Curabitur vehicula erat sed eros tincidunt, vitae accumsan magna cursus. Cras id sollicitudin nulla. Sed dapibus turpis in massa tincidunt tempus. Etiam lacinia ullamcorper mauris sit amet commodo. Vivamus massa erat, tempor et sapien ut, ornare fermentum massa. Integer eu velit vel risus finibus efficitur ut sit amet justo. Morbi auctor, libero quis rhoncus mollis, odio purus commodo lacus, vitae luctus dolor est commodo diam. Mauris ac porta tellus.

Proin ut justo non ligula gravida venenatis. Sed nec convallis lorem. Duis porta volutpat augue, non porttitor nulla gravida ac. Curabitur aliquet leo nec porttitor volutpat. Maecenas condimentum viverra sem non tincidunt. Cras varius lobortis lobortis. Maecenas pulvinar ultrices cursus. Nunc sit amet ligula purus. Duis lobortis, augue in hendrerit cursus, felis elit auctor nisl, aliquet vestibulum nisl elit in massa. Vestibulum nec nulla placerat, accumsan odio quis, laoreet felis. Mauris congue in tortor quis laoreet. Aenean ultricies pulvinar ultricies.

Nulla facilisi. Donec quis urna auctor felis pulvinar dignissim. Sed eget turpis sed mauris faucibus pharetra. Suspendisse nec lobortis metus. Nunc eget mollis lacus. Morbi placerat sem eu velit finibus, eu luctus dolor gravida. Nam faucibus quam ac leo ornare, nec aliquam magna sollicitudin. Donec volutpat elit vel lacus semper fringilla. Pellentesque mattis arcu vel mauris faucibus dignissim. Cras ultricies magna vitae tellus semper dapibus.

Nunc varius libero mi, eget elementum neque porta vitae. Pellentesque lacinia fringilla eros maximus tincidunt. Morbi ultrices metus vitae nisi aliquam varius. Nulla consequat sem at bibendum tincidunt. Aenean sagittis tincidunt tellus nec pellentesque. Nullam quis pellentesque urna, sed cursus est. Sed dapibus elit ac nunc iaculis, eget aliquet est tincidunt. Phasellus id ipsum maximus, lacinia felis nec, tincidunt leo.

Vestibulum leo libero, tempor vitae aliquam id, tristique ut felis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer vel velit nunc. Nullam sollicitudin, nisi ut iaculis congue, ante libero commodo nulla, mattis consequat nisl sapien id purus. Nulla eu augue sem. Nam eget nunc quam. Sed maximus, felis ut fringilla pretium, quam ante scelerisque libero, at luctus dui nisl vitae orci. Proin eu urna eu felis accumsan egestas eu bibendum sapien. Suspendisse potenti. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Maecenas quis lacus vestibulum, faucibus tellus lobortis, vulputate dui. Nunc at ornare purus. Donec eleifend in elit malesuada vestibulum. Quisque in luctus tortor.

Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce convallis, risus vitae ultricies dictum, quam leo accumsan quam, ut sagittis dui enim ut nisl. Nunc feugiat quam non ligula feugiat, a egestas metus efficitur. Nam in orci et eros vulputate rutrum. Vivamus ultricies lacus sit amet varius gravida. Vivamus quis bibendum nulla. Cras finibus efficitur nisl, suscipit consequat leo mollis eu. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tristique est sapien, sit amet ultrices neque aliquam vel. Sed ac felis eget ipsum rhoncus vulputate. Nunc faucibus ac diam feugiat facilisis. Praesent varius cursus mauris, eget cursus velit consequat sit amet. Suspendisse posuere lacus mauris, a convallis elit laoreet vitae. Nulla ipsum felis, convallis quis lobortis a, bibendum tincidunt nibh. In hac habitasse platea dictumst. Aenean vitae sapien eget libero maximus volutpat egestas id nulla.

Mauris enim ante, malesuada ac imperdiet sit amet, ornare eget ex. Ut mi orci, hendrerit nec laoreet non, blandit at est. Vivamus tempor lacus ac faucibus ullamcorper. Praesent tristique sit amet urna id aliquet. Nam tristique efficitur justo, sit amet semper nisl tempor ac. Donec sodales, tortor vel varius aliquet, quam eros pulvinar magna, non accumsan sem felis in erat. Vivamus et efficitur odio, vitae molestie enim. Nunc faucibus pellentesque felis vel feugiat.

Nullam non hendrerit ex. Vestibulum tempor, lectus in auctor dictum, elit nisl commodo libero, quis rutrum eros lectus ac ex. In fringilla volutpat purus, ac ornare dolor lobortis ut. Ut ut magna erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Duis sit amet ex a orci pretium molestie. Suspendisse ut placerat tortor, at aliquam massa. Maecenas placerat sapien tellus. Praesent scelerisque elementum mi, ac venenatis purus efficitur nec. Quisque libero sem, placerat vel nisl sit amet, imperdiet hendrerit nibh. Nulla eu erat ut orci ullamcorper dapibus nec ut leo. In ut laoreet mauris, ac accumsan arcu. Vivamus ut consequat quam. Nunc consectetur augue a felis gravida, ut vehicula erat vulputate. Sed gravida tellus ut libero auctor, id euismod neque convallis. Phasellus consequat sodales libero, pellentesque pretium massa bibendum nec.

Phasellus magna tortor, vulputate at faucibus in, fermentum ac quam. Donec feugiat ante eget tortor maximus sagittis. Suspendisse suscipit nisi quam, at ultrices metus scelerisque eget. Aliquam gravida accumsan quam eget mollis. Pellentesque id risus sollicitudin, viverra ligula vel, egestas diam. Integer arcu eros, viverra sit amet tellus sed, pellentesque placerat justo. Aliquam non felis suscipit, aliquet augue sed, gravida nulla. Morbi placerat felis ligula, at congue justo ornare convallis.

Morbi non feugiat eros. Pellentesque dapibus rhoncus eros et aliquet. Curabitur posuere, velit congue elementum malesuada, diam diam placerat lectus, quis vehicula augue arcu sed purus. In eleifend suscipit odio. Curabitur vel iaculis metus. Donec a nunc et velit aliquam placerat. Nullam cursus tempus leo, id posuere tellus interdum nec. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sagittis eros vitae justo sagittis suscipit. Aliquam sit amet semper leo, eget gravida urna. Cras mauris erat, congue at nibh vel, fringilla rutrum purus. Aliquam non varius est. Vestibulum sapien magna, maximus vitae facilisis a, consequat non purus. Vestibulum feugiat eleifend erat, eu iaculis dolor rhoncus ac. Etiam non tempor lectus, ut fringilla neque. In scelerisque erat ut quam tincidunt, nec finibus turpis vulputate.

Duis tincidunt semper dignissim. Sed laoreet felis enim, dignissim tempus nisl eleifend vitae. Cras vitae libero dolor. Phasellus fringilla urna erat, id efficitur tellus condimentum quis. Vivamus nec sagittis eros. Sed elementum laoreet nibh sit amet porttitor. Morbi vel eros ut magna blandit tempus. Vivamus fringilla augue ut purus feugiat viverra.

Quisque faucibus urna a neque facilisis accumsan. Sed placerat, ligula nec vestibulum lobortis, sapien ligula venenatis orci, vitae volutpat urna nisl sit amet augue. Cras enim mi, facilisis id orci et, finibus pulvinar ligula. Aliquam non nulla vel lectus ullamcorper tristique at et arcu. Cras nulla justo, congue porttitor mattis non, vestibulum at velit. Integer rhoncus erat vel diam imperdiet, id iaculis purus ornare. Nullam nec massa id nulla vehicula elementum. Vivamus est felis, interdum vitae rhoncus a, euismod nec lectus. Nam facilisis dui eget ligula malesuada vestibulum. Quisque id velit sed purus luctus viverra. Donec laoreet suscipit tortor at pellentesque. Etiam efficitur neque quis massa semper, vel finibus ante pulvinar.

Praesent non leo nec arcu fringilla volutpat vitae eu ipsum. Vivamus dapibus dolor ex, in blandit mauris vehicula in. Praesent porta vel lorem ac vulputate. Phasellus eu mauris et tellus placerat varius. Proin et ante id neque egestas sodales. Maecenas dictum mi eu fringilla pellentesque. Praesent nec mauris a turpis consectetur dapibus eu quis libero. Morbi porttitor nunc magna, id egestas diam imperdiet sed. Nulla facilisi. Etiam purus est, fringilla maximus erat et, auctor ullamcorper felis. Nulla maximus porttitor posuere. Nulla tincidunt pulvinar risus. Nunc enim enim, interdum eget ornare et, scelerisque et tortor. Mauris a euismod justo.

Pellentesque aliquam mi id felis volutpat auctor. Proin vehicula vulputate eros eget pellentesque. Nunc in finibus tellus. Sed ut quam feugiat, pharetra metus sed, venenatis arcu. Quisque congue magna lorem, ac dignissim odio laoreet eu. Nullam vitae eros nunc. Sed posuere justo in scelerisque condimentum. Sed ut nibh magna. Ut condimentum nulla efficitur, scelerisque libero sit amet, consectetur tortor.

Sed dapibus enim at ligula porta tempus. Donec quis blandit ipsum. Cras imperdiet molestie tellus. Morbi ullamcorper ullamcorper arcu, at vestibulum nunc placerat in. Aenean sit amet congue massa. Aliquam convallis augue ut ligula eleifend volutpat. Sed euismod, arcu sed efficitur commodo, ex neque tincidunt eros, sit amet tempus leo sem vitae erat.

Etiam lobortis venenatis arcu a gravida. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque erat nunc, vehicula sed vehicula in, venenatis iaculis justo. Donec massa eros, consequat luctus lacinia sit amet, scelerisque sit amet felis. Morbi sed nisl ipsum. Donec consequat libero a ultrices vulputate. Ut facilisis suscipit ante non luctus. Etiam pretium tellus sit amet tortor pulvinar, sed tincidunt urna vulputate. Vestibulum id odio vitae odio ultrices eleifend sit amet eget dolor. Praesent sed posuere massa. Pellentesque semper, eros scelerisque dictum efficitur, magna nisl luctus arcu, vel porttitor leo erat eu neque. Phasellus pretium, enim sed ultrices eleifend, libero mauris feugiat nisl, in commodo nisl turpis vitae nulla. Praesent maximus dictum venenatis. Integer eget orci sed tellus maximus imperdiet.

Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Integer vitae ullamcorper erat, quis dignissim ligula. Pellentesque ac nibh enim. Nunc ac ex quis ex tristique pulvinar vel in mi. Integer arcu lorem, pharetra a volutpat sit amet, euismod a arcu. Cras consectetur venenatis magna, id tincidunt massa malesuada id. Proin vehicula ante ante, et venenatis lorem laoreet id. Nulla elementum velit vel lobortis iaculis. Donec ac magna interdum, maximus sem a, consectetur dolor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed in aliquam tellus.

Fusce efficitur hendrerit sem. Ut at orci vitae lectus vehicula convallis. Mauris id tortor scelerisque, euismod dui nec, posuere ex. Aliquam pulvinar augue a lacus bibendum dictum. Integer aliquam, metus vel fringilla tristique, ipsum mi dictum diam, sit amet maximus risus arcu ac tellus. Curabitur mollis tincidunt vehicula. Maecenas cursus dui sit amet est luctus laoreet. Praesent ac tortor suscipit, sodales mi nec, porta sapien. Nunc vel odio nunc. Nullam quam tortor, commodo a ultricies in, convallis ut velit. Suspendisse at mauris tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Duis massa ipsum, porttitor et elit eget, rutrum blandit metus.

Curabitur quis mollis purus. Praesent sit amet porta sapien. Curabitur lobortis enim vel erat faucibus, quis vehicula felis finibus. Mauris luctus feugiat viverra. Aliquam congue felis vitae tincidunt maximus. Phasellus pharetra mattis purus eget tincidunt. Nullam aliquet libero at ex vehicula sodales.

Sed volutpat, diam sed ultricies imperdiet, tellus nibh pellentesque sapien, eget eleifend velit enim ut nulla. Nam ac sagittis velit, eu dictum purus. Vivamus facilisis massa arcu, at egestas turpis feugiat aliquet. Praesent congue a diam non mollis. Aliquam suscipit varius elit cursus finibus. Suspendisse tincidunt in lacus at posuere. Morbi venenatis nisl sit amet commodo tempus. Sed suscipit neque purus, sed tincidunt dolor luctus ut. Sed ut laoreet neque, at auctor odio. Suspendisse potenti. Proin posuere sapien a velit maximus tincidunt et ac justo. Sed lacinia urna purus. Cras ultrices tincidunt consequat.

Praesent quis felis at sem dictum feugiat sed nec nunc. In laoreet felis eget turpis ullamcorper vestibulum. Cras erat dolor, iaculis sed augue et, faucibus iaculis turpis. Nam ac vehicula lacus. Sed sem ligula, condimentum a diam non, vulputate molestie lectus. Duis iaculis pellentesque dui, ultricies cursus dui porta eu. Suspendisse potenti. Proin pharetra nunc at nibh elementum aliquet.

Donec quis tristique sapien. Phasellus ornare pellentesque dui, laoreet eleifend ex congue vitae. Aliquam quis metus tortor. In sodales dui risus, et fermentum lectus faucibus luctus. Nullam vel iaculis turpis, quis lacinia eros. Aliquam a magna blandit, sollicitudin elit vel, ultrices ligula. Suspendisse in risus aliquet mi auctor laoreet. Donec feugiat aliquet eros at placerat. Cras efficitur nulla risus, vel faucibus mi vestibulum vel. Sed blandit laoreet risus, vitae consequat massa scelerisque nec. Curabitur ut posuere purus, a blandit libero. Praesent at turpis lobortis, aliquet odio sed, aliquam mauris. Cras consequat turpis a feugiat ultricies. Pellentesque sit amet aliquam ipsum. Curabitur at feugiat leo, id lobortis tellus.

Vivamus fringilla vel magna et tincidunt. Praesent ac orci id nulla facilisis sagittis. Morbi elementum lacus at laoreet blandit. Nullam efficitur commodo eros eget fermentum. Cras egestas nulla nec nunc malesuada, eget posuere neque posuere. Morbi dapibus dolor at ex scelerisque imperdiet. Donec in faucibus magna, vel suscipit ex. Aliquam erat volutpat. Pellentesque pretium ligula id feugiat egestas. Nunc consectetur dapibus interdum. Donec quis ex et lectus porttitor blandit eu nec dolor. Mauris porttitor turpis mauris, nec pharetra libero lacinia id. Vestibulum at urna nec elit fermentum semper vitae sit amet augue. Sed nec mauris a dolor mollis eleifend. Praesent ipsum dui, gravida eget libero at, euismod rutrum urna.

Sed lorem massa, mattis vel auctor eget, rhoncus ac ipsum. Quisque ac ligula quis erat consequat bibendum iaculis quis risus. Duis semper malesuada ipsum, et porttitor velit sodales non. Sed auctor magna augue, ut scelerisque enim maximus at. Nullam ornare vehicula dolor ornare molestie. Aenean varius ipsum ultrices, dictum ligula nec, pulvinar elit. Donec gravida ullamcorper eros quis porta. Mauris sit amet tincidunt risus.

In sem arcu, auctor in ex ut, tincidunt pharetra ligula. Praesent vestibulum mi vitae nisi facilisis, vitae blandit dolor gravida. Fusce et mi orci. Nunc non lectus ultrices, blandit eros eget, convallis nunc. Phasellus condimentum rutrum fringilla. In vestibulum posuere libero et malesuada. Nullam tempus augue laoreet nunc lobortis, nec consequat sapien scelerisque. Quisque eget luctus felis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aenean lacinia consectetur lectus, id auctor ligula ullamcorper at.

Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris at est ut mi semper sagittis quis a elit. Sed imperdiet mi non condimentum consectetur. Mauris mattis egestas augue, eu efficitur dolor. Donec in blandit erat. Aenean odio orci, dapibus a tempus ut, fermentum non ante. Vestibulum a dui scelerisque, tempus arcu nec, porta nunc.

Sed et lectus vitae libero vestibulum semper eget ac nibh. Sed sed dapibus nisi, ac imperdiet nulla. Nam at molestie libero. Maecenas vehicula sollicitudin arcu nec auctor. Aliquam orci nunc, dignissim a urna sit amet, placerat pharetra lacus. Nulla facilisi. Nullam imperdiet lacus sed dolor tincidunt, et lobortis ipsum tincidunt. Phasellus commodo volutpat lacus sit amet sollicitudin. Cras nec ante imperdiet, luctus neque et, faucibus felis. Donec elit magna, blandit non rhoncus sed, eleifend sit amet tellus. Etiam a feugiat ipsum. Proin et odio tincidunt, gravida velit a, mattis magna. Proin ornare porta nisl, eget pretium urna tempus non. Praesent euismod est quis tellus porta dictum.

Donec imperdiet eros tempor pulvinar pulvinar. Cras tempus sagittis dictum. Mauris vulputate gravida vehicula. Morbi tincidunt quis turpis in consectetur. Quisque quis pharetra nunc, a venenatis justo. Duis viverra dolor et tristique dictum. Sed a tortor facilisis, ornare dolor eu, venenatis massa. Proin mollis nunc sit amet diam tempus feugiat. Maecenas nec lectus quis eros viverra maximus eget suscipit ex. Praesent consequat tempus elit nec elementum. Mauris in posuere neque. Aenean feugiat interdum consectetur. Morbi porttitor, sem non porttitor maximus, turpis nunc scelerisque elit, id suscipit metus erat eu enim. Curabitur feugiat lacus mi, sed consequat nisl elementum vel.

Curabitur vulputate sed dui posuere sodales. Pellentesque cursus pulvinar ex, quis pharetra est bibendum bibendum. Etiam leo mauris, dictum sed neque sit amet, porta posuere nibh. Aenean sed massa gravida, pulvinar arcu at, elementum risus. Fusce molestie ex faucibus, interdum mi eu, imperdiet sapien. Nam egestas libero non libero blandit, sit amet rutrum orci porta. Fusce placerat felis orci, eu aliquet sem scelerisque id. Integer et accumsan libero.

Sed non tortor vitae mauris vehicula cursus sit amet eget diam. Phasellus at dapibus nunc, ut ultricies quam. Integer porttitor pretium dui, semper blandit nulla iaculis non. Praesent porta massa sed placerat scelerisque. Cras a lorem a nisl consequat placerat quis a lacus. Quisque faucibus feugiat eleifend. Nunc ac massa mi. Nam ac semper ipsum. Nullam ac dolor placerat magna fermentum ullamcorper non a arcu. In dui lorem, placerat et libero ut, cursus eleifend est.

Etiam elementum porttitor nisl. Etiam vel ultricies nunc, vel semper ipsum. Morbi id metus id lacus ornare elementum. Vestibulum dictum augue enim, ut ultricies tortor elementum quis. Cras elit urna, tempor in ornare eget, placerat consequat tortor. Curabitur id odio at libero efficitur lobortis non ac metus. Morbi porttitor feugiat consequat. Donec id blandit ipsum, quis tincidunt erat. Sed pulvinar luctus ipsum vel tempor. Sed porta interdum sollicitudin.

Duis auctor a risus sit amet porta. Morbi erat diam, tincidunt vel lacus vel, laoreet ullamcorper mauris. Curabitur purus velit, dapibus et ultrices ultricies, tristique ut massa. Sed auctor massa eget justo imperdiet, nec condimentum purus pharetra. Aliquam faucibus scelerisque tortor eu interdum. Nam sed urna turpis. Sed cursus feugiat tortor, ut ultricies nisi scelerisque a. Donec euismod, orci at scelerisque auctor, purus odio aliquam ligula, a tempus tortor risus malesuada quam. Nam placerat neque dui, vel sodales metus auctor eu. Morbi ut scelerisque risus, vitae viverra dui.

Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce finibus convallis viverra. Phasellus ac turpis at lectus luctus consequat sed ut neque. Aenean sem ipsum, eleifend eu pulvinar eu, cursus sit amet justo. Aenean et dictum purus. Praesent blandit, turpis ut lacinia rutrum, est est gravida felis, eget facilisis leo tellus non mi. Integer nec arcu vitae sapien pulvinar suscipit venenatis a arcu. Curabitur fermentum metus massa, non molestie ipsum commodo accumsan. Donec tincidunt metus quis lobortis dapibus. Nam euismod tellus eget ipsum dictum elementum. Quisque sagittis purus et velit malesuada, sit amet rhoncus ante tempus. Nam sit amet tincidunt urna, sit amet tempor odio. Donec congue vestibulum nunc, non egestas erat imperdiet sit amet. Curabitur sed mattis nulla, ornare placerat diam.
"""
