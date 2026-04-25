# QSNetRequest

QSNetRequest 是一个基于 Alamofire 封装的 Swift 网络请求工具类，提供 JSON 请求、Data 请求、文件下载和 multipart 表单上传等常用能力。

## 环境要求

- iOS 15.0+
- watchOS 8.0+
- Swift 5

## 安装

通过 CocoaPods 安装：

```ruby
pod 'QSNetRequest'
```

然后执行：

```bash
pod install
```

## 使用方法

在需要使用的文件中导入：

```swift
import QSNetRequest
import Alamofire
```

### 请求 JSON

```swift
NetRequest.requestJson(
    urlString: "https://example.com/api/user",
    methodType: .get,
    paraDict: ["id": 1],
    encoding: URLEncoding.default,
    headers: nil
) { json in
    print("请求成功：", json)
} onError: { error, statusCode in
    print("请求失败：", error, statusCode ?? 0)
}
```

POST JSON 请求可以使用 `JSONEncoding.default`：

```swift
NetRequest.requestJson(
    urlString: "https://example.com/api/login",
    methodType: .post,
    paraDict: ["username": "test", "password": "123456"],
    encoding: JSONEncoding.default,
    headers: nil
) { json in
    print(json)
} onError: { error, statusCode in
    print(error, statusCode ?? 0)
}
```

### 请求 Data

```swift
NetRequest.requestData(
    urlString: "https://example.com/file",
    methodType: .get,
    paraDict: nil
) { data in
    print("Data 大小：", data.count)
} onError: { error, statusCode in
    print(error, statusCode ?? 0)
}
```

### 下载文件

```swift
NetRequest.download(
    urlString: "https://example.com/image.png",
    headers: nil
) { data in
    print("下载完成：", data.count)
} onError: { error, statusCode in
    print("下载失败：", error, statusCode ?? 0)
} onProgress: { progress in
    print("下载进度：", progress)
}
```

### 上传文件

```swift
let fileURL = URL(fileURLWithPath: "/path/to/file.png")

NetRequest.upload(
    urlString: "https://example.com/upload",
    paraDict: ["file": fileURL],
    headers: nil
) { data in
    print("上传成功：", data.count)
} onError: { error, statusCode in
    print("上传失败：", error, statusCode ?? 0)
}
```

## 错误处理

失败回调会返回 `Error` 和可选的 HTTP 状态码：

```swift
onError: { error, statusCode in
    print(error)
    print(statusCode ?? 0)
}
```

内置错误类型：

- `NetRequestError.urlError`：URL 格式错误
- `NetRequestError.jsonParseError`：JSON 解析失败

## License

QSNetRequest 基于 MIT License 开源。
