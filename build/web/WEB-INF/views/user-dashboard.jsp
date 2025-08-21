<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>PahanaEdu | Cashier</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <!-- Tailwind CSS CDN -->
        <script src="https://cdn.tailwindcss.com"></script>

        <!-- Google Fonts - Inter for a modern look -->
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">

        <!-- Fontawsome Icon CDN-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <script>
            tailwind.config = {
                theme: {
                    extend: {
                        colors: {
                            primary: '#4F46E5',
                            secondary: '#10B981',
                            dark: '#1F2937',
                            light: '#F9FAFB'
                        }
                    }
                }
            };
        </script>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            .sidebar {
                width: 16rem;
                background-color: #1a2235;
                color: white;
                display: flex;
                flex-direction: column;
                height: 100vh;
                position: fixed;
            }

            .sidebar-header {
                padding: 1.25rem 1.25rem 1.25rem 2rem;
                font-size: 1.5rem;
                font-weight: bold;
                border-bottom: 1px solid #2d3748;
                display: flex;
                align-items: center;
            }

            .sidebar-header img {
                height: 8rem;
                padding-left: 2rem;
            }

            nav {
                flex: 1;
                padding: 1.25rem 0;
            }

            .nav-item {
                display: flex;
                align-items: center;
                padding: 1rem 1.5rem;
                color: #cbd5e0;
                text-decoration: none;
                transition: all 0.3s;
            }

            .nav-item:hover {
                background-color: #2d3748;
                color: white;
            }

            .nav-item.active {
                color: #4fbfe8;
                background-color: #2d3748;
            }

            .nav-item i {
                width: 1.25rem;
                margin-right: 0.75rem;
                text-align: center;
            }

            .logout-section {
                margin-top: auto;
                padding: 1.5rem;
                border-top: 1px solid #2d3748;
            }

            .logout-btn {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 100%;
                padding: 0.75rem;
                background-color: #e53e3e;
                color: white;
                border: none;
                border-radius: 0.375rem;
                font-weight: 500;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .logout-btn:hover {
                background-color: #c53030;
            }

            .logout-btn i {
                margin-right: 0.5rem;
            }

            .content-section {
                display: none;
            }

            .content-section.active {
                display: block;
            }

            .nav-item.active {
                background-color: #374151;
                color: #4F46E5;
            }

            .chart-bar {
                transition: all 0.5s ease;
            }
        </style>

        <style>
            @importurl('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

            body {
                font-family: 'Poppins', sans-serif;
                background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
                min-height: 100vh;
            }

            .book-table {
                border-collapse: separate;
                border-spacing: 0;
                width: 100%;
            }

            .book-table th {
                background-color: #1a2235;
                color: white;
                font-weight: 500;
            }

            .book-table th:first-child {
                border-top-left-radius: 0.5rem;
            }

            .book-table th:last-child {
                border-top-right-radius: 0.5rem;
            }

            .book-table tr:last-child td:first-child {
                border-bottom-left-radius: 0.5rem;
            }

            .book-table tr:last-child td:last-child {
                border-bottom-right-radius: 0.5rem;
            }

            .action-btn {
                transition: all 0.2s ease;
            }

            .action-btn:hover {
                transform: scale(1.1);
            }

            .category-badge {
                display: inline-block;
                padding: 0.25rem 0.75rem;
                border-radius: 1rem;
                font-size: 0.75rem;
                font-weight: 600;
            }

            .book-cover {
                width: 50px;
                height: 70px;
                object-fit: cover;
                border-radius: 4px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                transition: transform 0.3s ease;
            }

            .book-cover:hover {
                transform: scale(1.8);
                z-index: 10;
                position: relative;
            }

            .image-upload-container {
                border: 2px dashed #cbd5e0;
                border-radius: 0.5rem;
                padding: 1rem;
                text-align: center;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .image-upload-container:hover {
                border-color: #4361ee;
                background-color: #f8faff;
            }

            .image-preview {
                max-width: 100%;
                max-height: 150px;
                margin-top: 1rem;
                border-radius: 0.5rem;
                display: none;
            }
        </style>

    </head>

    <body class="bg-gray-100 font-sans">
        <div class="flex h-screen">
            <!-- Sidebar -->
            <div class="w-64 bg-dark text-white">
                <div class="p-5 pl-8 text-2xl font-bold border-b border-gray-700">
                    <img src="PD.png" alt="logo" class="h-32 pl-8"> PAHANA EDU
                </div>
                <nav class="mt-2">
                    <a href="#" data-target="dashboard"
                       class="nav-item flex items-center p-4 text-primary bg-gray-800 active">
                        <i class="fa-solid fa-desktop w-5 mr-3"></i> Pos
                    </a>
                    <a href="#" data-target="books" class="nav-item flex items-center p-4 text-gray-300 hover:bg-gray-800">
                        <i class="fas fa-book w-5 mr-3"></i> Books
                    </a>
                    <a href="#" data-target="orders" class="nav-item flex items-center p-4 text-gray-300 hover:bg-gray-800">
                        <i class="fa-solid fa-money-bills w-5 mr-3"></i> Transactions
                    </a>
                    <a href="#" data-target="users"
                       class="nav-item flex items-center p-4 text-gray-300 hover:bg-gray-800">
                        <i class="fas fa-users w-5 mr-3"></i> Customers
                    </a>
                    <a href="#" data-target="settings"
                       class="nav-item flex items-center p-4 text-gray-300 hover:bg-gray-800">
                        <i class="fas fa-cog w-5 mr-3"></i> Settings
                    </a>
                </nav>
                <div class="logout-section">
                    <button class="logout-btn" id="logoutBtn">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </button>
                </div>
            </div>
            <!-- /Sidebar -->

            <!-- Main Content -->
            <div class="flex-1 overflow-auto">
                <!-- Header -->
                <header class="flex justify-between items-center p-4 bg-white shadow">
                    <h1 class="text-2xl font-bold text-dark" id="page-title">Pos</h1>
                    <div class="flex items-center">
                        <div class="relative mr-4">
                            <input type="text" placeholder="Search..."
                                   class="pl-10 pr-4 py-2 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-primary">
                            <i class="fas fa-search absolute left-3 top-3 text-gray-400"></i>
                        </div>
                        <div class="relative">
                            <button class="p-2 rounded-full bg-gray-200 text-gray-600 hover:bg-gray-300">
                                <i class="fas fa-bell"></i>
                                <span
                                    class="absolute top-0 right-0 h-4 w-4 bg-red-500 text-xs text-white rounded-full flex items-center justify-center">3</span>
                            </button>
                        </div>
                        <div class="ml-4">
                            <%= session.getAttribute("username")%>  <br>
                            <%= session.getAttribute("role")%>
                        </div>
                        <div class="ml-4">
                            <a href="#" data-target="settings"
                               class="nav-item flex items-center p-2 hover:bg-white-800 rounded-full">
                                <i class="fa-solid fa-user-circle" style="color: #031e38; font-size: 38px;"></i>
                            </a>

                        </div>
                    </div>
                </header>

                <!-- Dashboard -->
                <div id="dashboard" class="content-section active">
                    <!-- Stats Section -->
                    <%@ include file="../views/include/pos.jsp" %>
                </div>

                <!-- Books -->
                <div id="books" class="content-section p-4">
                    <%@ include file="../views/include/user-book.jsp" %>
                </div>

                <!--Transactions-->
                <div id="orders" class="content-section p-8">
                    <div class="bg-white rounded-xl shadow-lg p-6">
                        <h2 class="text-2xl font-bold mb-6">Transaction Management</h2>
                        <div class="overflow-x-auto">

                            <!-- Left Side - Table -->
                            <div>
                                <div class="overflow-x-auto">
                                    <table class="book-table">
                                        <thead>
                                            <tr>
                                                <th class="py-4 px-4 text-left">Order ID</th>
                                                <th class="py-4 px-5 text-left">Customer</th>
                                                <th class="py-3 px-4 text-left">Date</th>
                                                <th class="py-3 px-4 text-left">Amount</th>
                                                <th class="py-3 px-4 text-left">Status</th>
                                                <th class="py-3 px-4 text-left">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="border-b border-gray-100 text-sm hover:bg-gray-50">
                                                <td class="py-3 px-4 font-medium">ORD001</td>
                                                <td class="py-3 px-4">Harthik</td>
                                                <td class="py-3 px-4">12 Aug 2025</td>
                                                <td class="py-3 px-4">Rs. 3600.00</td>
                                                <td class="py-3 px-4"><span
                                                        class="px-2 py-1 bg-green-100 text-green-800 rounded-full text-xs">Completed</span>
                                                </td>
                                                <td class="py-3 px-4">
                                                    <button class="text-green-500 hover:text-green-700"><i class="fas fa-eye"></i>&nbsp; view</button>
                                                </td>
                                            </tr>

                                            <tr class="border-b border-gray-100 text-sm hover:bg-gray-50">
                                                <td class="py-3 px-4 font-medium">ORD002</td>
                                                <td class="py-3 px-4">Banujan</td>
                                                <td class="py-3 px-4 ">13 Aug 2025</td>
                                                <td class="py-3 px-4 ">Rs. 750.00</td>
                                                <td class="py-3 px-4 "><span
                                                        class="px-2 py-1 bg-green-100 text-green-800 rounded-full text-xs">Completed</span>
                                                </td>
                                                <td class="py-3 px-4">
                                                    <button class="text-green-500 hover:text-green-700"><i class="fas fa-eye"></i>&nbsp; view</button>
                                                </td>
                                            </tr>
                                            <tr class="border-b border-gray-100 text-sm hover:bg-gray-50">
                                                <td class="py-3 px-4 font-medium">ORD003</td>
                                                <td class="py-3 px-4 ">Harthik</td>
                                                <td class="py-3 px-4 ">13 Aug 2025</td>
                                                <td class="py-3 px-4 ">Rs. 1860.00</td>
                                                <td class="py-3 px-4"><span
                                                        class="px-2 py-1 bg-green-100 text-green-800 rounded-full text-xs">Completed</span>
                                                </td>
                                                <td class="py-3 px-4">
                                                    <button class="text-green-500 hover:text-green-700"><i class="fas fa-eye"></i>&nbsp; view</button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--Customers-->
                <div id="users" class="content-section p-6">
                    <div class="max-w-7xl mx-auto">
                        <div class="flex flex-col lg:flex-row gap-2">

                            <!-- Left Side - Table -->
                            <div class="lg:w-2/3">
                                <div class="bg-white rounded-xl shadow-lg p-6">
                                    <div class="flex justify-between items-center mb-2">
                                        <h2 class="text-2xl font-semibold text-gray-800">Customers Table</h2>
                                        <div class="flex space-x-2">
                                            <div class="relative">
                                                <input type="text" placeholder="Search Customers..." class="pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                                                <i class="fas fa-search absolute left-3 top-3 text-gray-400"></i>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="overflow-x-auto">
                                        <table class="book-table">
                                            <thead>
                                                <tr>
                                                    <th class="py-4 px-4 text-left">Account No.</th>
                                                    <th class="py-4 px-5 text-left">Name</th>
                                                    <th class="py-3 px-4 text-right">Address</th>
                                                    <th class="py-3 px-4 text-center">Phone</th>
                                                    <th class="py-3 px-4 text-center">Email</th>
                                                    <th class="py-3 px-4 text-center">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr class="bg-gray-50">
                                                    <td class="py-3 px-4 border-t border-gray-200">C001</td>
                                                    <td class="py-3 px-4 border-t border-gray-200">Harthik</td>
                                                    <td class="py-3 px-4 border-t border-gray-200 text-center">Jaffna</td>
                                                    <td class="py-3 px-4 border-t border-gray-200 text-center">0774565124</td>
                                                    <td class="py-3 px-4 border-t border-gray-200 text-center">harthik@gmail.com</td>
                                                    <td class="py-3 px-4 border-t border-gray-200 text-center">
                                                        <button class="action-btn text-blue-600 hover:text-blue-800 mr-2">
                                                            <i class="fas fa-edit"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                                <tr class="bg-gray-50">
                                                    <td class="py-3 px-4 border-t border-gray-200">C002</td>
                                                    <td class="py-3 px-4 border-t border-gray-200">Sakulan</td>
                                                    <td class="py-3 px-4 border-t border-gray-200 text-center">Vavuniya</td>
                                                    <td class="py-3 px-4 border-t border-gray-200 text-center">0764882641</td>
                                                    <td class="py-3 px-4 border-t border-gray-200 text-center">sakulan28@gmail.com</td>
                                                    <td class="py-3 px-4 border-t border-gray-200 text-center">
                                                        <button class="action-btn text-blue-600 hover:text-blue-800 mr-2">
                                                            <i class="fas fa-edit"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                                <tr class="bg-gray-50">
                                                    <td class="py-3 px-4 border-t border-gray-200">C003</td>
                                                    <td class="py-3 px-4 border-t border-gray-200">Banujan</td>
                                                    <td class="py-3 px-4 border-t border-gray-200 text-center">Jaffna</td>
                                                    <td class="py-3 px-4 border-t border-gray-200 text-center">0743232154</td>
                                                    <td class="py-3 px-4 border-t border-gray-200 text-center">banubanujan@gmail.com</td>
                                                    <td class="py-3 px-4 border-t border-gray-200 text-center">
                                                        <button class="action-btn text-blue-600 hover:text-blue-800 mr-2">
                                                            <i class="fas fa-edit"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                            </div>

                            <!-- Right Side - Form -->
                            <div class="lg:w-1/3 mt-8 lg:mt-0">
                                <div class="bg-white rounded-xl shadow-lg p-6 h-fit sticky top-6">
                                    <h2 class="text-2xl font-semibold text-gray-800 mb-2">Add New Customer</h2>

                                    <form id="bookForm" class="space-y-2">
                                        <div>
                                            <label for="title" class="block text-sm font-medium text-gray-700 mb-1">Name</label>
                                            <input type="text" id="title" required class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                                        </div>

                                        <div>
                                            <label for="author" class="block text-sm font-medium text-gray-700 mb-1">Address</label>
                                            <input type="text" id="author" required class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                                        </div>

                                        <div>
                                            <label for="category" class="block text-sm font-medium text-gray-700 mb-1">Phone</label>
                                            <select id="category" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                                                <option value="user" defalut>user</option>
                                            </select>
                                        </div>

                                        <div>
                                            <label for="author" class="block text-sm font-medium text-gray-700 mb-1">Email</label>
                                            <input type="text" id="author" required class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                                        </div>

                                        <button type="submit" class="w-full bg-blue-600 text-white py-3 px-4 rounded-lg font-medium hover:bg-blue-700 transition duration-200 flex items-center justify-center">
                                            <i class="fas fa-plus-circle mr-2"></i> Add Customer
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--Settings-->
                <div id="settings" class="content-section p-6">
                    <div class="bg-white rounded-xl shadow-md p-6 max-w-7xl mx-auto">
                        <div class="flex items-center mb-2 pl-12">
                            <div class="relative">
                                <i class="fa-solid fa-user-circle" style="color: #031e38; font-size: 78px;"></i>
                                <button class="absolute bottom-0 right-0 bg-primary text-white p-2 rounded-full">
                                    <i class="fas fa-camera"></i>
                                </button>
                            </div>
                            <div class="ml-6">
                                <h3 class="text-xl font-semibold"><%= session.getAttribute("username")%></h3>
                                <p class="text-gray-600"><%= session.getAttribute("role")%></p>
                            </div>
                        </div>

                        <form id="profileForm" class="max-w-2xl mx-auto">                          
                            <div>
                                <div class="mb-2">
                                    <label for="username" class="block text-sm font-medium text-gray-700 mb-1">Username</label>
                                    <input type="text" id="username" class="w-full px-4 py-2 border rounded-lg focus:ring-primary focus:border-primary" value="User1">
                                </div>

                                <div class="mb-2">
                                    <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email Address</label>
                                    <input type="email" id="email" class="w-full px-4 py-2 border rounded-lg focus:ring-primary focus:border-primary" value="user123@gmail.com">
                                </div>

                                <div class="mb-2">
                                    <label for="currentPassword" class="block text-sm font-medium text-gray-700 mb-1">Current Password</label>
                                    <input type="password" id="currentPassword" class="w-full px-4 py-2 border rounded-lg focus:ring-primary focus:border-primary" value="********">
                                </div>

                                <div class="mb-2">
                                    <label for="newPassword" class="block text-sm font-medium text-gray-700 mb-1">New Password</label>
                                    <input type="password" id="newPassword" class="w-full px-4 py-2 border rounded-lg focus:ring-primary focus:border-primary">
                                </div>

                                <div class="mb-2">
                                    <label for="confirmPassword" class="block text-sm font-medium text-gray-700 mb-1">Confirm New Password</label>
                                    <input type="password" id="confirmPassword" class="w-full px-4 py-2 border rounded-lg focus:ring-primary focus:border-primary">
                                </div>
                            </div>

                            <div class="flex justify-end space-x-4 pt-6">
                                <button type="button" class="px-5 py-2 border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-50">Cancel</button>
                                <button type="submit" class="px-5 py-2 bg-primary text-white rounded-lg hover:bg-indigo-600">Save Changes</button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>

        <!--Main-->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Navigation functionality
                const navItems = document.querySelectorAll('.nav-item');
                const contentSections = document.querySelectorAll('.content-section');
                const pageTitle = document.getElementById('page-title');

                navItems.forEach(item => {
                    item.addEventListener('click', function (e) {
                        e.preventDefault();

                        // Remove active class from all items
                        navItems.forEach(navItem => {
                            navItem.classList.remove('active', 'bg-gray-800', 'text-primary');
                            navItem.classList.add('text-gray-300');
                        });

                        // Add active class to clicked item
                        this.classList.add('active', 'bg-gray-800', 'text-primary');
                        this.classList.remove('text-gray-300');

                        // Hide all content sections
                        contentSections.forEach(section => {
                            section.classList.remove('active');
                        });

                        // Show the targeted content section
                        const target = this.getAttribute('data-target');
                        document.getElementById(target).classList.add('active');

                        // Update page title
                        pageTitle.textContent = this.textContent.trim();
                    });
                });

                // Logout confirmation logic
                document.getElementById('logoutBtn').addEventListener('click', function (e) {
                    e.preventDefault();
                    if (confirm('Are you sure you want to logout?')) {
                        alert('Logging out...');
                        // In a real application, you would redirect to the logout URL
                        window.location.href = 'logout';
                    }
                });

                // Navigation item active state logic
                document.querySelectorAll('.nav-item').forEach(item => {
                    item.addEventListener('click', function (e) {
                        e.preventDefault();
                        // Remove 'active' class from all nav items
                        document.querySelectorAll('.nav-item').forEach(i => i.classList.remove('active'));
                        // Add 'active' class to the clicked nav item
                        this.classList.add('active');
                    });
                });

                // Notification button
                const notificationBtn = document.querySelector('button .fa-bell').parentElement;
                notificationBtn.addEventListener('click', function () {
                    alert('You have 3 new notifications!');
                });

                // Chart animation
                const bars = document.querySelectorAll('.chart-bar');
                bars.forEach(bar => {
                    const height = bar.style.height;
                    bar.style.height = '0';
                    setTimeout(() => {
                        bar.style.transition = 'height 0.5s ease';
                        bar.style.height = height;
                    }, 300);
                });

                // Add hover effects to table rows
                const tableRows = document.querySelectorAll('tr');
                tableRows.forEach(row => {
                    row.addEventListener('mouseenter', function () {
                        this.style.backgroundColor = '#f9fafb';
                    });
                    row.addEventListener('mouseleave', function () {
                        this.style.backgroundColor = '';
                    });
                });
            });
        </script>


    </body>

</html>