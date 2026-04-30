# Rails Bookverse

[![Ruby 3.4.1](https://img.shields.io/badge/Ruby-3.4.1-red?style=flat&logo=ruby&logoColor=white)](https://www.ruby-lang.org/)
[![Rails 7.2](https://img.shields.io/badge/Rails-7.2-CC0000?logo=rubyonrails&logoColor=white)](https://rubyonrails.org/)
[![CircleCI](https://dl.circleci.com/status-badge/img/gh/dangkhoa2016/Rails-Bookverse/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/dangkhoa2016/Rails-Bookverse/tree/main)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

> 🌐 Language / Ngôn ngữ: [English](README.md) | **Tiếng Việt**

Rails Bookverse là một ứng dụng web toàn diện để quản lý sách, tác giả, nhà xuất bản, thư viện, thành viên và các lượt mượn sách. Được xây dựng trên nền tảng Ruby on Rails 7.2, ứng dụng cung cấp giao diện quản trị (admin) gọn gàng với đầy đủ các tính năng CRUD cho tất cả thực thể, các trường chọn (select) hỗ trợ tìm kiếm động, hỗ trợ đa ngôn ngữ và nhiều chế độ hiển thị danh sách.

## Tính năng

- **Bảng điều khiển (Dashboard)**: Trang chủ với các biểu đồ tóm tắt và tiện ích hoạt động được hỗ trợ bởi Chart.js.
- **Quản lý sách**: Lưu trữ và quản lý sách với các thông tin: tiêu đề, tóm tắt, mã ISBN, số trang, giá và số lượng tồn kho. Sách có thể được liên kết với nhiều tác giả, danh mục, thể loại và thẻ (tags).
- **Quản lý tác giả**: Quản lý tác giả với họ tên, email và trạng thái hoạt động. Mỗi tác giả có thể có một hoặc nhiều hồ sơ tác giả.
- **Hồ sơ tác giả**: Lưu trữ thông tin tiểu sử và các liên kết mạng xã hội (Facebook, Twitter, Instagram, LinkedIn, YouTube) cho từng tác giả.
- **Quản lý nhà xuất bản**: Quản lý các nhà xuất bản với tên, địa chỉ, số điện thoại, email, năm thành lập, website và tên CEO.
- **Ngày xuất bản**: Theo dõi phiên bản và ngày xuất bản cho mỗi sự kết hợp giữa sách và nhà xuất bản.
- **Hệ thống Danh mục, Thể loại & Thẻ**: Tổ chức sách theo danh mục (kèm mô tả), thể loại và các thẻ tự do.
- **Quản lý thư viện**: Quản lý nhiều thư viện với tên và địa chỉ khác nhau.
- **Quản lý thành viên**: Quản lý thành viên thư viện, theo dõi họ tên, email và liên kết mỗi thành viên với một thư viện cụ thể.
- **Mượn trả sách**: Theo dõi các lượt mượn sách với ngày mượn, ngày trả và trạng thái (ví dụ: đã trả, đang xử lý, đã gia hạn, đã hủy, quá hạn).
- **Đánh giá sách**: Viết và xem các đánh giá xếp hạng sao kèm nội dung cho từng cuốn sách.
- **Giao diện đa ngôn ngữ**: Giao diện hỗ trợ tiếng Anh và tiếng Việt, có thể chuyển đổi theo từng phiên làm việc (session).
- **Nhiều chế độ hiển thị**: Duyệt bất kỳ danh sách nào dưới dạng thẻ (card), danh sách (list) hoặc bảng (table) — tùy chọn này được lưu trong cookie.
- **Chọn liên kết động**: Các menu thả xuống (dropdown) sử dụng Choices.js với tính năng tìm kiếm từ xa (remote search) và cuộn vô tận (infinite scroll) thông qua một Stimulus controller tùy chỉnh.
- **Phân trang**: Tất cả các danh sách được phân trang bằng thư viện Pagy.

## Mô hình dữ liệu

```
Tác giả (Authors) ──< Hồ sơ tác giả (AuthorProfiles)
Tác giả >──< Sách (Books) >──< Danh mục (Categories)
                          >──< Thể loại (Genres)
                          >──< Thẻ (Tags)
                          >──< Nhà xuất bản (Publishers) (thông qua PublishedDates)
                          ──< Đánh giá (Reviews)
                          ──< Mượn sách (BookLoans) ──> Thành viên (Members) ──> Thư viện (Libraries)
```

## Công nghệ sử dụng

| Tầng (Layer) | Công nghệ |
|---|---|
| Ngôn ngữ | Ruby 3.4.1 |
| Framework | Ruby on Rails 7.2 |
| Cơ sở dữ liệu | SQLite3 |
| Frontend CSS | CoreUI 5 (Giao diện quản trị dựa trên Bootstrap) |
| Biên dịch CSS | Sass + PostCSS (thông qua `cssbundling-rails`) |
| JavaScript | Hotwire (Turbo + Stimulus) thông qua importmap |
| Thư viện JS | Choices.js 11, Chart.js 4, SimpleBar |
| Phân trang | Pagy 9 |
| Kiểm thử | Minitest, Capybara, Selenium (Chrome headless) |

## Cài đặt

1. **Sao chép (clone) kho lưu trữ:**
   ```bash
   git clone https://github.com/dangkhoa2016/Rails-Bookverse.git
   cd Rails-Bookverse
   ```

2. **Cài đặt các thư viện Ruby (dependencies):**
   ```bash
   bundle install
   ```

3. **Cài đặt các gói phụ thuộc JavaScript/CSS:**
   ```bash
   yarn install
   ```

4. **Biên dịch tài nguyên CSS:**
   ```bash
   yarn build:css
   ```

5. **Thiết lập cơ sở dữ liệu:**
   ```bash
   bin/rails db:create db:migrate
   bin/rails db:seed   # Tùy chọn: nạp dữ liệu mẫu về sách, tác giả, nhà xuất bản, v.v.
   ```

6. **Khởi động máy chủ phát triển:**

   Sử dụng Foreman (chạy đồng thời Rails và trình theo dõi CSS):
   ```bash
   bin/dev
   ```

   Hoặc chỉ khởi động máy chủ Rails:
   ```bash
   bin/rails server
   ```

   Truy cập địa chỉ `http://localhost:3000` trên trình duyệt của bạn.

## Chạy kiểm thử (Tests)

```bash
# Kiểm thử Unit, model và controller
bin/rails test

# Kiểm thử hệ thống (yêu cầu Chrome headless)
bin/rails test test/system

# Chạy toàn bộ suite kiểm thử
bin/rails test:all
```

## Giấy phép

Rails Bookverse là phần mềm mã nguồn mở và được cung cấp theo [Giấy phép MIT](LICENSE).
