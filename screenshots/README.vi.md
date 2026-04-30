# Tài liệu ảnh chụp màn hình Rails Bookverse

> 🌐 Language / Ngôn ngữ: [English](README.md) | **Tiếng Việt**

Tài liệu này mô tả bộ ảnh chụp màn hình giao diện của Rails Bookverse trong thư mục `screenshots`. Bộ ảnh tập trung vào dashboard, các trang danh sách theo nhiều chế độ hiển thị, và một số trang chi tiết có quan hệ dữ liệu giữa các thực thể.

## Mục đích

- Ghi lại hiện trạng giao diện của ứng dụng để đưa vào README, tài liệu sản phẩm, release note, hoặc demo.
- Minh họa các chế độ hiển thị `Card`, `List`, `Table` và trạng thái `collapsed sidebar`.
- Cung cấp một chỉ mục để tìm nhanh ảnh theo từng khu vực chức năng.

## Phạm vi bao phủ

Bộ ảnh hiện tại bao gồm:

- Dashboard tổng quan với các thẻ thống kê, biểu đồ và bảng dữ liệu.
- Các trang index của nhiều tài nguyên như authors, books, reviews, tags, publishers, published dates, members, libraries và book loans.
- Các trang detail có khối `Associations and Relationships`, cho thấy dữ liệu liên kết giữa tác giả, author profile, sách, thành viên và book loan.
- Ví dụ về sidebar thu gọn để mô tả cách giao diện hoạt động trong bố cục hẹp hơn.

## Quy ước đặt tên tệp

- `*-index-card-view.png`: trang danh sách ở dạng card.
- `*-index-list-view.png`: trang danh sách ở dạng list.
- `*-index-table-view.png`: trang danh sách ở dạng table.
- `*-detail*.png`: trang chi tiết của một bản ghi.
- `*-tab.png`: trang chi tiết với một tab quan hệ đang được chọn.

## Danh mục ảnh

| Tệp ảnh | Nhóm màn hình | Mô tả ngắn |
| --- | --- | --- |
| [dashboard-static-content.png](dashboard-static-content.png) | Dashboard | Trang tổng quan với KPI card, biểu đồ traffic, các khối social và bảng hoạt động. |
| [authors-index-card-view.png](authors-index-card-view.png) | Authors | Trang danh sách tác giả ở chế độ card, hiển thị thông tin cơ bản và số lượng sách/author profile. |
| [authors-index-list-view.png](authors-index-list-view.png) | Authors | Trang danh sách tác giả ở chế độ list, đồng thời minh họa sidebar thu gọn. |
| [authors-index-table-view.png](authors-index-table-view.png) | Authors | Trang danh sách tác giả ở chế độ table, phù hợp khi cần quét nhanh nhiều bản ghi. |
| [author-detail-profiles-tab.png](author-detail-profiles-tab.png) | Authors | Trang chi tiết tác giả với tab `Author Profiles` đang được chọn. |
| [author-detail-books-tab.png](author-detail-books-tab.png) | Authors | Trang chi tiết tác giả với tab `Books` đang được chọn và danh sách sách liên quan. |
| [author-profiles-index-card-view.png](author-profiles-index-card-view.png) | Author Profiles | Trang danh sách author profile ở chế độ card, hiển thị bio và liên kết mạng xã hội. |
| [books-index-card-view.png](books-index-card-view.png) | Books | Trang danh sách sách ở chế độ card, hiển thị summary, ISBN, price, stock và review. |
| [reviews-index-card-view.png](reviews-index-card-view.png) | Reviews | Trang danh sách review ở chế độ card, nhấn mạnh nội dung đánh giá và số sao. |
| [reviews-index-table-view.png](reviews-index-table-view.png) | Reviews | Trang danh sách review ở chế độ table, phù hợp cho đối chiếu nhiều bản ghi cùng lúc. |
| [tags-index-card-view-with-collapsed-sidebar.png](tags-index-card-view-with-collapsed-sidebar.png) | Tags | Trang danh sách tag ở chế độ card, kèm sidebar thu gọn để minh họa điều hướng gọn. |
| [libraries-index-card-view.png](libraries-index-card-view.png) | Libraries | Trang danh sách thư viện ở chế độ card, hiển thị tổng số thành viên mỗi thư viện. |
| [members-index-card-view.png](members-index-card-view.png) | Members | Trang danh sách thành viên ở chế độ card, hiển thị library và book loans count. |
| [member-detail.png](member-detail.png) | Members | Trang chi tiết thành viên với khối `Associations and Relationships` và danh sách book loan liên quan. |
| [book-loans-index-card-view.png](book-loans-index-card-view.png) | Book Loans | Trang danh sách lượt mượn sách ở chế độ card, hiển thị sách, thành viên, trạng thái và ngày mượn/trả. |
| [publishers-index-card-view.png](publishers-index-card-view.png) | Publishers | Trang danh sách nhà xuất bản ở chế độ card, hiển thị địa chỉ, liên hệ và thông tin doanh nghiệp. |
| [published-dates-index-card-view.png](published-dates-index-card-view.png) | Published Dates | Trang danh sách ngày xuất bản ở chế độ card, hiển thị sách, nhà xuất bản, ngày xuất bản và edition. |

## Điểm nổi bật giao diện được thể hiện qua bộ ảnh

### 1. Bộ khung admin thống nhất

Tất cả ảnh đều cho thấy một bộ khung giao diện nhất quán gồm sidebar bên trái, breadcrumb bên trên, thanh hành động và khu vực nội dung chính. Điều này giúp tài liệu hóa rõ ràng cấu trúc điều hướng của ứng dụng.

### 2. Nhiều chế độ hiển thị cho cùng một tài nguyên

Bộ ảnh cho thấy một tài nguyên có thể được xem ở nhiều dạng khác nhau:

- `Card view`: phù hợp khi cần nhìn tổng quan và đọc thông tin chi tiết trong từng thẻ.
- `List view`: phù hợp khi muốn đọc nhanh từng bản ghi theo chiều dọc.
- `Table view`: phù hợp khi so sánh nhiều dòng dữ liệu trên cùng một màn hình.

### 3. Quan hệ dữ liệu được trình bày trực quan

Hai ảnh chi tiết của `Authors` và một ảnh chi tiết của `Members` cho thấy cách ứng dụng hiển thị quan hệ giữa các bảng dữ liệu thông qua tab và danh sách liên kết. Đây là điểm quan trọng để minh họa giá trị của hệ thống quản lý dữ liệu đa bảng.

### 4. Sidebar thu gọn vẫn giữ được khả năng điều hướng

Hai ảnh có `collapsed sidebar` cho thấy giao diện vẫn hoạt động tốt trong bố cục hẹp hơn mà không mất mát điều hướng chính. Đây là ảnh hữu ích nếu cần mô tả tính linh hoạt của layout.

## Gợi ý sử dụng bộ ảnh

- Nếu cần một bộ ảnh ngắn gọn cho trang giới thiệu dự án, nên ưu tiên [dashboard-static-content.png](dashboard-static-content.png), [authors-index-table-view.png](authors-index-table-view.png), [books-index-card-view.png](books-index-card-view.png) và [member-detail.png](member-detail.png).
- Nếu cần minh họa hệ thống CRUD và nhiều kiểu presentation, nên kết hợp cả `card`, `list`, `table` từ nhóm Authors và Reviews.
- Nếu cần mô tả kiến trúc dữ liệu và liên kết giữa các thực thể, nên dùng [author-detail-profiles-tab.png](author-detail-profiles-tab.png), [author-detail-books-tab.png](author-detail-books-tab.png) và [member-detail.png](member-detail.png).

## Tóm tắt

Bộ ảnh này mô tả khá đầy đủ giao diện admin của Rails Bookverse: từ dashboard, các trang danh sách, nhiều view mode, cho tới các trang chi tiết có quan hệ dữ liệu. Đây là tập tài nguyên phù hợp để sử dụng trong tài liệu kỹ thuật, demo sản phẩm và trình bày dự án.