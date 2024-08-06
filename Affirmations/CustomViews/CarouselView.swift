//
//  TypeListView.swift
//  Collectivist
//
//  Created by Andrey Buksha on 2024-05-03.
//

import SwiftUI
import SDWebImageSwiftUI
import LinkPresentation

struct CarouselView<Page: View>: View {
    @State private var scale: CGFloat = 1
    @State private var lastScale: CGFloat = 1
    @State private var offset: CGPoint = .zero
    @State private var lastTranslation: CGSize = .zero
    
    @State var geometry: GeometryProxy
    
    @Binding var active: Bool
    @Binding var currentPage: Int
    
    var medias: [Sizes.Image]?
    var pages: [Page]
    
    var body: some View {
        VStack(spacing: 0) {
            if !pages.isEmpty {
                ScrollView(.vertical, showsIndicators: false) {
                    let pagesWithMenu = pages.map {
                        $0.contextMenu {
                            Button {
                                contextMenuSave()
                            } label: {
                                Label("Save", systemImage: "folder")
                            }
                            Button {
                                contextMenuShare()
                            } label: {
                                Label("Share", systemImage: "square.and.arrow.up")
                            }
                            Button {
                                contextMenuCopy()
                            } label: {
                                Label("Copy", systemImage: "doc.on.clipboard")
                            }
                            Button {
                                contextMenuAddCustomList()
                            } label: {
                                Label("Add to Custom List", systemImage: "doc.text.below.ecg")
                            }
                        }
                        .zoomable()
                    }
                    PageViewController(pages: pagesWithMenu, currentPage: $currentPage)
                        .onTapGesture {
                            withAnimation(.snappy(duration: 0.25)) {
                                active = true
                            }
                        }
                        .frame(height: geometry.size.height / 2)
                }
                .scrollDisabled(true)
                
                HStack {
                    PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                }
                .padding(.top, 20)
            } else {
                Text("Images not loaded, try again.")
                    .frame(alignment: .center)
            }
        }
    }
    
    private func getImageByPage() -> UIImage {
        let size = extractDimensions(from: medias?[currentPage].sourceURL)
        let image = pages[currentPage].asImage(size:
                .init(
                    width: (size.width ?? medias?[currentPage].width) ?? 1000,
                    height: (size.height ?? medias?[currentPage].height) ?? 1000
                )
        )
        return image
    }
    
    private func extractDimensions(from url: String?) -> (width: Int?, height: Int?) {
        guard let urlComponents = URLComponents(string: url ?? ""),
              let queryItems = urlComponents.queryItems else {
            return (nil, nil)
        }
        var width: Int?
        var height: Int?
        
        for queryItem in queryItems {
            if queryItem.name == "width", let value = queryItem.value, let intValue = Int(value) {
                width = intValue
            }
            if queryItem.name == "height", let value = queryItem.value, let intValue = Int(value) {
                height = intValue
            }
        }
        return (width, height)
    }
    
    private func contextMenuSave() {
        let image = getImageByPage()
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
    
    private func contextMenuShare() {
        let image = getImageByPage()
        let viewController = UIApplication.shared.currentUIWindow().rootViewController
        viewController?.presentedViewController?.dismiss(animated: false, completion: nil)
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = viewController?.view
        viewController?.present(activityViewController, animated: true, completion: nil)
    }
    
    private func contextMenuCopy() {
        let image = getImageByPage()
        image.cgImage?.copy()
    }
    
    private func contextMenuAddCustomList() {
        let _ = getImageByPage()
        // no action
    }
    
    private func adjustMaxOffset(size: CGSize) {
        let maxOffsetX = (size.width * (scale - 1)) / 2
        let maxOffsetY = (size.height * (scale - 1)) / 2
        var newOffsetX = offset.x
        var newOffsetY = offset.y
        if abs(newOffsetX) > maxOffsetX {
            newOffsetX = maxOffsetX * (abs(newOffsetX) / newOffsetX)
        }
        if abs(newOffsetY) > maxOffsetY {
            newOffsetY = maxOffsetY * (abs(newOffsetY) / newOffsetY)
        }
        let newOffset = CGPoint(x: newOffsetX, y: newOffsetY)
        if newOffset != offset {
            withAnimation {
                offset = newOffset
            }
        }
        self.lastTranslation = .zero
    }
}
