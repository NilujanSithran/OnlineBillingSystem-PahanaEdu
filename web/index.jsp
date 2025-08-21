<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="refresh" content="0;url=login">
        <title>THE BOOK SHELF - Your Literary Destination</title>

        <!-- Tailwind CSS CDN -->
        <script src="https://cdn.tailwindcss.com"></script>

        <!-- Google Fonts - Inter for a modern look -->
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">

        <!-- Fontawsome Icon CDN-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <style>
            body {
                font-family: 'Inter', sans-serif;
                background-color: #1a202c;
                min-height: 100vh
            }

            .page-content {
                display: none;
            }

            .interactive-element {
                transition: all 0.2s ease-in-out;
                transform-origin: center;
            }

            .interactive-element:hover {
                transform: translateY(-2px) scale(1.02);
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
            }

            .interactive-element:active {
                transform: translateY(0) scale(0.98);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            }


            /*  scrollbar */
            ::-webkit-scrollbar {
                width: 8px;
            }

            ::-webkit-scrollbar-track {
                background: #2d3748;
                border-radius: 10px;
            }

            ::-webkit-scrollbar-thumb {
                background: #4a5568;
                border-radius: 10px;
            }

            ::-webkit-scrollbar-thumb:hover {
                background: #6a768c;
            }

            /* Hide scrollbar */
            .slider-container::-webkit-scrollbar {
                display: none;
            }

            .slider-container {
                -ms-overflow-style: none;
                scrollbar-width: none;
            }

            .book-card-glow {
                border: 1px solid transparent;
                background-clip: padding-box;
                position: relative;
            }

            .book-card-glow::before {
                content: '';
                position: absolute;
                inset: 0;
                border-radius: 0.5rem;
                padding: 1px;
                background: linear-gradient(to right, #a78bfa, #8b5cf6, #3b82f6);
                -webkit-mask: linear-gradient(#fff 0 0) content-box, linear-gradient(#fff 0 0);
                -webkit-mask-composite: xor;
                mask-composite: exclude;
                z-index: -1;
            }

            .book-card-glow:hover::before {
                background: linear-gradient(to right, #c084fc, #a855f7, #6366f1);
            }

            .book-card-glow:hover {
                box-shadow: 0 0 15px rgba(139, 92, 246, 0.6);
                transform: translateY(-5px) scale(1.02);
                transition: all 0.3s ease-in-out;
            }

            .interactive-element {
                cursor: pointer;
                transition: all 0.3s ease-in-out;
            }

            .filter-button.active {
                background-color: #8b5cf6;
                transform: scale(1.05);
                box-shadow: 0 0 10px rgba(139, 92, 246, 0.8);
            }


            /* footer */
            .footer-bg {
                background-color: #1A202C;
            }

            .footer-link {
                @apply text-gray-400 hover:text-white transition-colors duration-200;
            }

            /* value cards */
            .value-card {
                background-color: #24262b;
                border: 1px solid rgba(255, 255, 255, 0.1);
            }

            .value-card:hover {
                transform: translateY(-5px);
            }

            /* Active button */
            .nav-button.active {
                background-color: #6B46C1;

                color: white;
                box-shadow: 0 4px 14px rgba(107, 70, 193, 0.4);
            }

            /* Hidden content section */
            .content-section {
                display: none;
            }

            /* Visible content section */
            .content-section.active {
                display: block;
            }
        </style>
    </head>
    <body class="min-h-screen bg-gradient-to-br from-gray-900 to-black text-white flex flex-col">
        <!-- Top Navbar -->
        <nav
            class="bg-gradient-to-r from-gray-900 via-gray-800 to-black p-4 shadow-2xl sticky top-0 z-50 rounded-b-xl font-inter">
            <div class="container mx-auto flex flex-col md:flex-row justify-between items-center">
                <!-- Left Logo -->
                <div class="flex-shrink-0 mb-4 md:mb-0 pl-4">
                    <div class="flex items-center space-x-3 text-white text-3xl font-extrabold tracking-widest uppercase">
                        <img src="images/PD.png" alt="Pahana Edu Logo" class="w-12 h-12 rounded-full shadow-md">
                        <span class="text-white">PAHANA EDU</span>
                    </div>
                </div>
                <!-- /Left Logo -->

                <!-- Right section -->
                <div class="flex flex-col md:flex-row items-center space-y-4 md:space-y-0 md:space-x-8">
                    <ul class="flex flex-wrap justify-center space-x-4 text-white text-xl md:text-l">
                        <li>
                            <button class="nav-button px-4 py-2 rounded-lg bg-gray-700 text-purple-300"
                                    data-target="Home-section">Home
                            </button>
                        </li>
                        <li>
                            <button
                                class="nav-button px-4 py-2 rounded-lg hover:bg-gray-700 hover:text-purple-300 transition-colors duration-200"
                                data-target="Book-section">Book
                            </button>
                        </li>
                        <li>
                            <button
                                class="nav-button px-4 py-2 rounded-lg hover:bg-gray-700 hover:text-purple-300 transition-colors duration-200"
                                data-target="About-section">About
                            </button>
                        </li>
                        <li>
                            <button
                                class="nav-button px-4 py-2 rounded-lg hover:bg-gray-700 hover:text-purple-300 transition-colors duration-200"
                                data-target="Contact-section">Contact
                            </button>
                        </li>
                    </ul>

                    <div class="flex flex-wrap justify-center items-center space-x-4">
                        <button type="button"
                                class="nav-button interactive-element bg-transparent border border-purple-500 text-purple-300 py-2 px-6 rounded-full font-bold hover:bg-purple-500 hover:text-white transition-all duration-300 transform hover:scale-105 focus:outline-none focus:ring-2 focus:ring-purple-300 focus:ring-offset-2 focus:ring-offset-gray-800"
                                data-target="Login-section">Log in
                        </button>
                        <button type="submit"
                                class="nav-button nteractive-element bg-transparent border border-purple-500 text-purple-300 py-2 px-6 rounded-full font-bold hover:bg-purple-500 hover:text-white transition-all duration-300 transform hover:scale-105 focus:outline-none focus:ring-2 focus:ring-purple-300 focus:ring-offset-2 focus:ring-offset-gray-800"
                                data-target="Signup-section">Sign in
                        </button>
                    </div>
                </div>
                <!-- /Right section -->
            </div>
        </nav>
        <!-- /Top Navbar -->

        <!-- Home Section -->
        <div id="Home-section" class="content-section">
            <main class="flex-grow py-8">
                <div id="home-page" class="page-content flex flex-col items-center justify-center p-2">

                    <!-- Image Slider Section -->
                    <section id="image-slider-section" class="w-full max-w-7xl mb-8 relative">
                        <div class="relative w-full rounded-lg overflow-hidden shadow-xl border border-gray-700">
                            <!-- Slider Container -->
                            <div id="book-slider"
                                 class="flex transition-transform duration-500 ease-in-out slider-container"
                                 style="transform: translateX(0%);">
                                <!-- Slide 1 -->
                                <div class="w-full flex-shrink-0">
                                    <img src="images/slider/free-delivery.jpg" alt="free delivery"
                                         class="w-full h-[500px] object-cover rounded-lg">
                                    <div
                                        class="absolute inset-0 bg-gradient-to-t from-black via-transparent to-transparent opacity-80 rounded-lg">
                                    </div>
                                </div>

                                <!-- Slide 2 -->
                                <div class="w-full flex-shrink-0">
                                    <img src="images/slider/free-ticket.jpg" alt="free ticket"
                                         class="w-full h-[500px] object-cover rounded-lg">
                                    <div
                                        class="absolute inset-0 bg-gradient-to-t from-black via-transparent to-transparent opacity-80 rounded-lg">
                                    </div>
                                </div>

                                <!-- Slide 3 -->
                                <div class="w-full flex-shrink-0">
                                    <img src="images/slider/school-hero.png" alt="school hero"
                                         class="w-full h-[500px] object-cover rounded-lg">
                                    <div
                                        class="absolute inset-0 bg-gradient-to-t from-black via-transparent to-transparent opacity-80 rounded-lg">
                                    </div>
                                </div>
                            </div>
                            <!-- /Slider Container -->

                            <!-- Navigation Buttons -->
                            <button id="book-prevBtn"
                                    class="absolute top-1/2 left-4 transform -translate-y-1/2 bg-gray-800 text-white p-3 rounded-full shadow-lg hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-gray-300 z-20">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                                     stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M15 19l-7-7 7-7" />
                                </svg>
                            </button>
                            <button id="book-nextBtn"
                                    class="absolute top-1/2 right-4 transform -translate-y-1/2 bg-gray-800 text-white p-3 rounded-full shadow-lg hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-gray-300 z-20">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                                     stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M9 5l7 7-7 7" />
                                </svg>
                            </button>
                            <!-- /Navigation Buttons -->

                            <!-- Dots Indicator -->
                            <div id="book-dots-container"
                                 class="absolute bottom-4 left-0 right-0 flex justify-center space-x-1 z-20">
                            </div>
                            <!-- /Dots Indicator -->
                        </div>
                    </section>
                    <!-- /Image Slider Section -->

                    <!-- Features -->
                    <section id="features"
                             class="w-full max-w-7xl mb-8 p-4 bg-gray-800 rounded-xl shadow-lg border border-gray-700 text-white">
                        <div class="grid grid-cols-1 md:grid-cols-4 gap-8 text-center">

                            <!-- Islandwide -->
                            <div
                                class="p-6 bg-gray rounded-xl shadow-md p-6 flex items-center space-x-4 w-full transform interactive-element book-card-glow">
                                <div class="flex-shrink-0">
                                    <i class="fas fa-shipping-fast" style="color: #2563EB;"></i>
                                </div>
                                <div>
                                    <div class="text-lg font-semibold text-white-900">Islandwide Delivery</div>
                                    <p class="text-sm text-gray-400">Available for all orders</p>
                                </div>
                            </div>
                            <!-- /Islandwide -->

                            <!-- Best Dealers -->
                            <div
                                class="p-6 bg-gray rounded-xl shadow-md p-6 flex items-center space-x-4 w-full transform interactive-element book-card-glow">
                                <div class="flex-shrink-0">
                                    <i class="fas fa-sync-alt" style="color: #2563EB;"></i>
                                </div>
                                <div>
                                    <div class="text-lg font-semibold text-white-900">Best Dealers on</div>
                                    <p class="text-sm text-gray-400">All Categories</p>
                                </div>
                            </div>
                            <!-- /Best Dealers -->

                            <!-- Cod -->
                            <div
                                class="p-6 bg-gray rounded-xl shadow-md p-6 flex items-center space-x-4 w-full transform interactive-element book-card-glow">
                                <div class="flex-shrink-0">
                                    <i class="fas fa-hand-holding-usd" style="color: #2563EB;"></i>
                                </div>
                                <div>
                                    <div class="text-lg font-semibold text-white-900">Cash On Delivery</div>
                                    <p class="text-sm text-gray-400">available</p>
                                </div>
                            </div>
                            <!-- /Cod -->

                            <!-- Hotline -->
                            <div
                                class="p-6 bg-gray rounded-xl shadow-md p-6 flex items-center space-x-4 w-full transform interactive-element book-card-glow">
                                <div class="flex-shrink-0">
                                    <i class="fas fa-headset" style="color: #2563EB;"></i>
                                </div>
                                <div>
                                    <div class="text-lg font-semibold text-white-900">Hotline</div>
                                    <p class="text-sm text-gray-400">Call us: 0753 978 978</p>
                                </div>
                            </div>
                            <!-- /Hotline -->
                        </div>
                    </section>
                    <!-- /Features -->

                    <!-- New Arrivals -->
                    <section id="new-books"
                             class="w-full max-w-7xl mb-8 p-8 bg-gray-900 rounded-xl shadow-lg border border-gray-700">
                        <h2 class="text-4xl font-bold text-center text-white mb-8">New Arrivals</h2>
                        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-4">

                            <!-- Book Card -->
                            <div
                                class="bg-gray-800 rounded-lg shadow-md overflow-hidden transform interactive-element book-card-glow">
                                <img src="images/book/01.png" alt="Robin Harper"
                                     class="w-full h-64 object-cover" />
                                <div class="p-4 relative">
                                    <span
                                        class="absolute top-0 right-0 bg-blue-600 text-white text-xs font-bold px-2 py-1 rounded-bl-lg">Fiction</span>
                                    <h3 class="font-semibold text-lg text-white mb-1">Robin Harper</h3>
                                    <p class="text-gray-400 text-sm">By Robin Harper</p>
                                    <p class="text-green-400 font-bold mt-2 text-lg">Rs.800.00</p>
                                    <button
                                        class="mt-4 interactive-element bg-transparent border border-purple-500 text-white-300 py-2 px-6 rounded-lg hover:bg-purple-500 hover:text-white transition-all duration-300 transform hover:scale-105 focus:outline-none focus:ring-2 focus:ring-purple-300 focus:ring-offset-2 focus:ring-offset-gray-800">View
                                        Details</button>
                                </div>
                            </div>

                            <!-- Book Card -->
                            <div
                                class="bg-gray-800 rounded-lg shadow-md overflow-hidden transform interactive-element book-card-glow">
                                <img src="images/book/14.png" alt="Elon Musk"
                                     class="w-full h-64 object-cover" />
                                <div class="p-4 relative">
                                    <span
                                        class="absolute top-0 right-0 bg-purple-600 text-white text-xs font-bold px-2 py-1 rounded-bl-lg">Biography</span>
                                    <h3 class="font-semibold text-lg text-white mb-1">Elon Musk</h3>
                                    <p class="text-gray-400 text-sm">By Ashlee Vance</p>
                                    <p class="text-green-400 font-bold mt-2 text-lg">Rs.400.00</p>
                                    <button
                                        class="mt-4 interactive-element bg-transparent border border-purple-500 text-white-300 py-2 px-6 rounded-lg hover:bg-purple-500 hover:text-white transition-all duration-300 transform hover:scale-105 focus:outline-none focus:ring-2 focus:ring-purple-300 focus:ring-offset-2 focus:ring-offset-gray-800">View
                                        Details</button>
                                </div>
                            </div>

                            <!-- Book Card -->
                            <div
                                class="bg-gray-800 rounded-lg shadow-md overflow-hidden transform interactive-element book-card-glow">
                                <img src="images/book/02.png" alt="Stephen Kin"
                                     class="w-full h-64 object-cover" />
                                <div class="p-4 relative">
                                    <span
                                        class="absolute top-0 right-0 bg-emerald-600 text-white text-xs font-bold px-2 py-1 rounded-bl-lg">Science Fiction</span>
                                    <h3 class="font-semibold text-lg text-white mb-1">Stephen Kin</h3>
                                    <p class="text-gray-400 text-sm">By Hovle</p>
                                    <p class="text-green-400 font-bold mt-2 text-lg">Rs.1600.00</p>
                                    <button
                                        class="mt-4 interactive-element bg-transparent border border-purple-500 text-white-300 py-2 px-6 rounded-lg hover:bg-purple-500 hover:text-white transition-all duration-300 transform hover:scale-105 focus:outline-none focus:ring-2 focus:ring-purple-300 focus:ring-offset-2 focus:ring-offset-gray-800">View
                                        Details</button>
                                </div>
                            </div>

                            <!-- Book Card -->
                            <div
                                class="bg-gray-800 rounded-lg shadow-md overflow-hidden transform interactive-element book-card-glow">
                                <img src="images/book/20.png" alt="Einstein"
                                     class="w-full h-64 object-cover" />
                                <div class="p-4 relative">
                                    <span
                                        class="absolute top-0 right-0 bg-cyan-600 text-white text-xs font-bold px-2 py-1 rounded-bl-lg">History</span>
                                    <h3 class="font-semibold text-lg text-white mb-1">Einstein</h3>
                                    <p class="text-gray-400 text-sm">By James Sheriya</p>
                                    <p class="text-green-400 font-bold mt-2 text-lg">Rs.1100.00</p>
                                    <button
                                        class="mt-4 interactive-element bg-transparent border border-purple-500 text-white-300 py-2 px-6 rounded-lg hover:bg-purple-500 hover:text-white transition-all duration-300 transform hover:scale-105 focus:outline-none focus:ring-2 focus:ring-purple-300 focus:ring-offset-2 focus:ring-offset-gray-800">View
                                        Details</button>
                                </div>
                            </div>

                            <!-- Book Card -->
                            <div
                                class="bg-gray-800 rounded-lg shadow-md overflow-hidden transform interactive-element book-card-glow">
                                <img src="images/book/07.png" alt="The Unwilling"
                                     class="w-full h-64 object-cover" />
                                <div class="p-4 relative">
                                    <span
                                        class="absolute top-0 right-0 bg-purple-600 text-white text-xs font-bold px-2 py-1 rounded-bl-lg">Drama</span>
                                    <h3 class="font-semibold text-lg text-white mb-1">The Unwilling</h3>
                                    <p class="text-gray-400 text-sm">By k.Sterling</p>
                                    <p class="text-green-400 font-bold mt-2 text-lg">Rs.800.00</p>
                                    <button
                                        class="mt-4 interactive-element bg-transparent border border-purple-500 text-white-300 py-2 px-6 rounded-lg hover:bg-purple-500 hover:text-white transition-all duration-300 transform hover:scale-105 focus:outline-none focus:ring-2 focus:ring-purple-300 focus:ring-offset-2 focus:ring-offset-gray-800">View
                                        Details</button>
                                </div>
                            </div>

                            <!-- Book Card -->
                            <div
                                class="bg-gray-800 rounded-lg shadow-md overflow-hidden transform interactive-element book-card-glow">
                                <img src="images/book/05.png" alt="End of Watch"
                                     class="w-full h-64 object-cover" />
                                <div class="p-4 relative">
                                    <span
                                        class="absolute top-0 right-0 bg-emerald-600 text-white text-xs font-bold px-2 py-1 rounded-bl-lg">Science Fiction</span>
                                    <h3 class="font-semibold text-lg text-white mb-1">End of Watch</h3>
                                    <p class="text-gray-400 text-sm">By Dr. Hovle</p>
                                    <p class="text-green-400 font-bold mt-2 text-lg">Rs.800.00</p>
                                    <button
                                        class="mt-4 interactive-element bg-transparent border border-purple-500 text-white-300 py-2 px-6 rounded-lg hover:bg-purple-500 hover:text-white transition-all duration-300 transform hover:scale-105 focus:outline-none focus:ring-2 focus:ring-purple-300 focus:ring-offset-2 focus:ring-offset-gray-800">View
                                        Details</button>
                                </div>
                            </div>

                        </div>

                        <div class="flex flex-wrap justify-center items-center space-x-4 mt-6">
                            <button id="hero-explore-button"
                                    class="bg-gradient-to-r from-purple-600 to-indigo-600 text-white py-2 px-6 rounded-full text-lg font-bold hover:from-purple-700 hover:to-indigo-700 transition-all duration-300 transform hover:scale-105 interactive-element shadow-lg focus:outline-none focus:ring-2 focus:ring-purple-300 focus:ring-opacity-75">
                                Explore <span class="ml-2">&rarr;</span>
                            </button>
                        </div>
                    </section>
                    <!-- /New Arrivals-->

                    <!-- Trusted Publishers -->
                    <section id="publisher-slider-section" class="w-full max-w-7xl mb-12">
                        <h4 class="text-3xl font-bold text-white text-center mb-2">Trusted Publishers</h4>
                        <div class="relative w-full overflow-hidden">
                            <div id="publisher-slider"
                                 class="flex transition-transform duration-500 ease-in-out slider-container">
                                <div class="w-1/5 flex-shrink-0 p-1">
                                    <div
                                        class="bg-gray-800 rounded-lg shadow-md p-6 flex flex-col items-center justify-center h-full">
                                        <img src="images/publisher/Jam Fruit.jpg" alt="Jam Fruit" class="h-16 object-contain mb-4">
                                        <span class="text-gray-300 font-medium text-center">Jam Fruit</span>
                                    </div>
                                </div>
                                <div class="w-1/5 flex-shrink-0 p-1">
                                    <div
                                        class="bg-gray-800 rounded-lg shadow-md p-6 flex flex-col items-center justify-center h-full">
                                        <img src="images/publisher/Native.png" alt="Native" class="h-16 object-contain mb-4">
                                        <span class="text-gray-300 font-medium text-center">Native</span>
                                    </div>
                                </div>
                                <div class="w-1/5 flex-shrink-0 p-1">
                                    <div
                                        class="bg-gray-800 rounded-lg shadow-md p-6 flex flex-col items-center justify-center h-full">
                                        <img src="images/publisher/Newman Springs.png" alt="Newman Springs" class="h-16 object-contain mb-4">
                                        <span class="text-gray-300 font-medium text-center">Newman Springs</span>
                                    </div>
                                </div>
                                <div class="w-1/5 flex-shrink-0 p-1">
                                    <div
                                        class="bg-gray-800 rounded-lg shadow-md p-6 flex flex-col items-center justify-center h-full">
                                        <img src="images/publisher/OLEARY.png" alt="OLEARY" class="h-16 object-contain mb-4">
                                        <span class="text-gray-300 font-medium text-center">OLEARY</span>
                                    </div>
                                </div>
                                <div class="w-1/5 flex-shrink-0 p-1">
                                    <div
                                        class="bg-gray-800 rounded-lg shadow-md p-6 flex flex-col items-center justify-center h-full">
                                        <img src="images/publisher/Pavilion.jpg" alt="Pavilion" class="h-16 object-contain mb-4">
                                        <span class="text-gray-300 font-medium text-center">Pavilion</span>
                                    </div>
                                </div>
                                <div class="w-1/5 flex-shrink-0 p-1">
                                    <div
                                        class="bg-gray-800 rounded-lg shadow-md p-6 flex flex-col items-center justify-center h-full">
                                        <img src="images/publisher/Damick.png" alt="Damick" class="h-16 object-contain mb-4">
                                        <span class="text-gray-300 font-medium text-center">Damick</span>
                                    </div>
                                </div>
                            </div>

                            <button id="publisher-prevBtn"
                                    class="absolute top-1/2 left-0 transform -translate-y-1/2 bg-gray-800 text-white p-3 rounded-full shadow-lg hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-gray-300 z-20">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                                     stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M15 19l-7-7 7-7" />
                                </svg>
                            </button>
                            <button id="publisher-nextBtn"
                                    class="absolute top-1/2 right-0 transform -translate-y-1/2 bg-gray-800 text-white p-3 rounded-full shadow-lg hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-gray-300 z-20">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                                     stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M9 5l7 7-7 7" />
                                </svg>
                            </button>

                            <div id="publisher-dots-container"
                                 class="absolute bottom-0 left-0 right-0 flex justify-center space-x-1 z-20">
                            </div>
                        </div>
                    </section>
                    <!-- /Trusted Publishers -->

                    <!-- Quick Contact Link -->
                    <section id="contact-quick"
                             class="w-full max-w-7xl mb-2 p-8 bg-gray-800 rounded-xl shadow-lg border border-gray-700 text-center text-white">
                        <h2 class="text-4xl font-bold text-center text-white-400 mb-8">Get in Touch</h2>
                        <p class="text-lg text-gray-300 mb-6">
                            Have questions or need assistance? Our friendly team is ready to help!
                        </p>
                        <button id="quick-contact-button"
                                class="nav-button bg-gradient-to-r from-pink-600 to-red-600 text-white py-3 px-8 rounded-full text-xl font-bold hover:from-pink-700 hover:to-red-700 transition-colors duration-300 transform interactive-element shadow-lg focus:outline-none focus:ring-2 focus:ring-pink-300 focus:ring-opacity-75"
                                data-target="Contact-section">Contact Us
                        </button>
                    </section>
                    <!-- /Quick Contact Link -->
                </div>
            </main>
        </div>
        <!-- /Home Section -->

        <!-- Book Section -->
        <div id="Book-section" class="content-section active">
            <main class="container mx-auto p-8 md:p-10 lg:p-12 mt-8 mb-12 bg-gray-800 rounded-xl shadow-2xl max-w-7xl">
                <!-- Filter Options -->
                <div
                    class="bg-gray-900 p-6 rounded-xl shadow-lg mb-10 flex flex-wrap justify-center gap-4 border border-gray-700">
                    <button
                        class="filter-button bg-gray-700 text-white py-3 px-6 rounded-full shadow-md hover:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-purple-500 focus:ring-opacity-50 interactive-element active"
                        data-filter="All">All
                    </button>
                    <button
                        class="filter-button bg-gray-700 text-white py-3 px-6 rounded-full shadow-md hover:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-purple-500 focus:ring-opacity-50 interactive-element"
                        data-filter="Fiction">Fiction
                    </button>
                    <button
                        class="filter-button bg-gray-700 text-white py-3 px-6 rounded-full shadow-md hover:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-purple-500 focus:ring-opacity-50 interactive-element"
                        data-filter="NonFiction">NonFiction
                    </button>
                    <button
                        class="filter-button bg-gray-700 text-white py-3 px-6 rounded-full shadow-md hover:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-purple-500 focus:ring-opacity-50 interactive-element"
                        data-filter="Fantasy">Fantasy
                    </button>
                    <button
                        class="filter-button bg-gray-700 text-white py-3 px-6 rounded-full shadow-md hover:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-purple-500 focus:ring-opacity-50 interactive-element"
                        data-filter="SciFi">SciFi
                    </button>
                    <button
                        class="filter-button bg-gray-700 text-white py-3 px-6 rounded-full shadow-md hover:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-purple-500 focus:ring-opacity-50 interactive-element"
                        data-filter="Biography">Biography
                    </button>
                    <button
                        class="filter-button bg-gray-700 text-white py-3 px-6 rounded-full shadow-md hover:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-purple-500 focus:ring-opacity-50 interactive-element"
                        data-filter="History">History
                    </button>
                    <button
                        class="filter-button bg-gray-700 text-white py-3 px-6 rounded-full shadow-md hover:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-purple-500 focus:ring-opacity-50 interactive-element"
                        data-filter="Childrens">Childrens
                    </button>
                </div>

                <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-4" id="book-list">

                    <!-- Book Card -->
                    <div
                        class="bg-gray-800 rounded-lg shadow-md overflow-hidden transform interactive-element book-card-glow">
                        <img src="images/book/01.png" alt="Robin Harper"
                             class="w-full h-64 object-cover" />
                        <div class="p-4 relative">
                            <span
                                class="absolute top-0 right-0 bg-blue-600 text-white text-xs font-bold px-2 py-1 rounded-bl-lg">Fiction</span>
                            <h3 class="font-semibold text-lg text-white mb-1">Robin Harper</h3>
                            <p class="text-gray-400 text-sm">By Robin Harper</p>
                            <p class="text-green-400 font-bold mt-2 text-lg">Rs.800.00</p>
                            <button
                                class="mt-4 interactive-element bg-transparent border border-purple-500 text-white-300 py-2 px-6 rounded-lg hover:bg-purple-500 hover:text-white transition-all duration-300 transform hover:scale-105 focus:outline-none focus:ring-2 focus:ring-purple-300 focus:ring-offset-2 focus:ring-offset-gray-800">View
                                Details</button>
                        </div>
                    </div>

                    <!-- Book Card -->
                    <div
                        class="bg-gray-800 rounded-lg shadow-md overflow-hidden transform interactive-element book-card-glow">
                        <img src="images/book/14.png" alt="Elon Musk"
                             class="w-full h-64 object-cover" />
                        <div class="p-4 relative">
                            <span
                                class="absolute top-0 right-0 bg-purple-600 text-white text-xs font-bold px-2 py-1 rounded-bl-lg">Biography</span>
                            <h3 class="font-semibold text-lg text-white mb-1">Elon Musk</h3>
                            <p class="text-gray-400 text-sm">By Ashlee Vance</p>
                            <p class="text-green-400 font-bold mt-2 text-lg">Rs.400.00</p>
                            <button
                                class="mt-4 interactive-element bg-transparent border border-purple-500 text-white-300 py-2 px-6 rounded-lg hover:bg-purple-500 hover:text-white transition-all duration-300 transform hover:scale-105 focus:outline-none focus:ring-2 focus:ring-purple-300 focus:ring-offset-2 focus:ring-offset-gray-800">View
                                Details</button>
                        </div>
                    </div>

                    <!-- Book Card -->
                    <div
                        class="bg-gray-800 rounded-lg shadow-md overflow-hidden transform interactive-element book-card-glow">
                        <img src="images/book/02.png" alt="Stephen Kin"
                             class="w-full h-64 object-cover" />
                        <div class="p-4 relative">
                            <span
                                class="absolute top-0 right-0 bg-emerald-600 text-white text-xs font-bold px-2 py-1 rounded-bl-lg">Science Fiction</span>
                            <h3 class="font-semibold text-lg text-white mb-1">Stephen Kin</h3>
                            <p class="text-gray-400 text-sm">By Hovle</p>
                            <p class="text-green-400 font-bold mt-2 text-lg">Rs.1600.00</p>
                            <button
                                class="mt-4 interactive-element bg-transparent border border-purple-500 text-white-300 py-2 px-6 rounded-lg hover:bg-purple-500 hover:text-white transition-all duration-300 transform hover:scale-105 focus:outline-none focus:ring-2 focus:ring-purple-300 focus:ring-offset-2 focus:ring-offset-gray-800">View
                                Details</button>
                        </div>
                    </div>

                    <!-- Book Card -->
                    <div
                        class="bg-gray-800 rounded-lg shadow-md overflow-hidden transform interactive-element book-card-glow">
                        <img src="images/book/20.png" alt="Einstein"
                             class="w-full h-64 object-cover" />
                        <div class="p-4 relative">
                            <span
                                class="absolute top-0 right-0 bg-cyan-600 text-white text-xs font-bold px-2 py-1 rounded-bl-lg">History</span>
                            <h3 class="font-semibold text-lg text-white mb-1">Einstein</h3>
                            <p class="text-gray-400 text-sm">By James Sheriya</p>
                            <p class="text-green-400 font-bold mt-2 text-lg">Rs.1100.00</p>
                            <button
                                class="mt-4 interactive-element bg-transparent border border-purple-500 text-white-300 py-2 px-6 rounded-lg hover:bg-purple-500 hover:text-white transition-all duration-300 transform hover:scale-105 focus:outline-none focus:ring-2 focus:ring-purple-300 focus:ring-offset-2 focus:ring-offset-gray-800">View
                                Details</button>
                        </div>
                    </div>

                    <!-- Book Card -->
                    <div
                        class="bg-gray-800 rounded-lg shadow-md overflow-hidden transform interactive-element book-card-glow">
                        <img src="images/book/07.png" alt="The Unwilling"
                             class="w-full h-64 object-cover" />
                        <div class="p-4 relative">
                            <span
                                class="absolute top-0 right-0 bg-purple-600 text-white text-xs font-bold px-2 py-1 rounded-bl-lg">Drama</span>
                            <h3 class="font-semibold text-lg text-white mb-1">The Unwilling</h3>
                            <p class="text-gray-400 text-sm">By k.Sterling</p>
                            <p class="text-green-400 font-bold mt-2 text-lg">Rs.800.00</p>
                            <button
                                class="mt-4 interactive-element bg-transparent border border-purple-500 text-white-300 py-2 px-6 rounded-lg hover:bg-purple-500 hover:text-white transition-all duration-300 transform hover:scale-105 focus:outline-none focus:ring-2 focus:ring-purple-300 focus:ring-offset-2 focus:ring-offset-gray-800">View
                                Details</button>
                        </div>
                    </div>

                    <!-- Book Card -->
                    <div
                        class="bg-gray-800 rounded-lg shadow-md overflow-hidden transform interactive-element book-card-glow">
                        <img src="images/book/05.png" alt="End of Watch"
                             class="w-full h-64 object-cover" />
                        <div class="p-4 relative">
                            <span
                                class="absolute top-0 right-0 bg-emerald-600 text-white text-xs font-bold px-2 py-1 rounded-bl-lg">Science Fiction</span>
                            <h3 class="font-semibold text-lg text-white mb-1">End of Watch</h3>
                            <p class="text-gray-400 text-sm">By Dr. Hovle</p>
                            <p class="text-green-400 font-bold mt-2 text-lg">Rs.800.00</p>
                            <button
                                class="mt-4 interactive-element bg-transparent border border-purple-500 text-white-300 py-2 px-6 rounded-lg hover:bg-purple-500 hover:text-white transition-all duration-300 transform hover:scale-105 focus:outline-none focus:ring-2 focus:ring-purple-300 focus:ring-offset-2 focus:ring-offset-gray-800">View
                                Details</button>
                        </div>
                    </div>

                </div>

                <script>
                    document.addEventListener('DOMContentLoaded', () => {
                        // Get all filter buttons and book cards
                        const filterButtons = document.querySelectorAll('.filter-button');
                        const bookCards = document.querySelectorAll('.book-card-glow');

                        // Add event listeners to each filter button
                        filterButtons.forEach(button => {
                            button.addEventListener('click', () => {
                                // Remove 'active' class from all buttons
                                filterButtons.forEach(btn => btn.classList.remove('active'));
                                // Add 'active' class to the clicked button
                                button.classList.add('active');

                                // Get the filter category from the data-filter attribute
                                const filterCategory = button.dataset.filter;

                                // Iterate through each book card and show/hide based on the filter
                                bookCards.forEach(card => {
                                    const bookCategory = card.dataset.category;

                                    if (filterCategory === 'All' || bookCategory === filterCategory) {
                                        card.classList.remove('hidden'); // Show the book
                                        card.classList.add('block'); // Ensure it takes up space in the grid
                                    } else {
                                        card.classList.add('hidden'); // Hide the book
                                        card.classList.remove('block');
                                    }
                                });
                            });
                        });
                    });
                </script>

            </main>
        </div>
        <!-- /Book Section -->

        <!-- About Section -->
        <div id="About-section" class="content-section">
            <main class="container mx-auto p-6 md:p-10 lg:p-12 mt-2 mb-2 bg-gray-800 rounded-xl shadow-2xl max-w-7xl">
                <article class="prose prose-invert max-w-none">
                    <!-- About -->
                    <h2 class="text-3xl md:text-4xl font-bold text-white text-center mb-10">About US</h2>
                    <div class="flex flex-col md:flex-row items-center md:space-x-8 mb-12">

                        <div class="w-full md:w-1/2 mb-8 md:mb-0 flex justify-center">
                            <img src="images/book.jpg" alt="Pahana Edu Book Shop"
                                 class="rounded-xl shadow-lg max-w-full h-auto">
                        </div>
                        <div class="w-full md:w-1/2">

                            <p class="text-lg text-gray-300 mb-6">
                                knowledge and a commitment to our local community, Pahana
                                Edu isn't just a bookshop; it's a vibrant hub where curious minds can flourish. Our name,
                                **"Pahana,"** means "lamp" or "light" in Sinhala, symbolizing our mission to illuminate the
                                path
                                of learning for every student, educator, and lifelong learner across the island.
                            </p>
                            <p class="text-gray-300">
                                Pahana Edu was founded with a clear vision: to make quality educational resources accessible
                                to
                                a diverse range of books and materials that cater to local curricula,
                                international standards, and general knowledge.
                            </p>
                        </div>
                    </div>
                    <!-- /About -->

                    <!-- Values -->
                    <h2 class="text-3xl md:text-4xl text-white text-center mb-10">Our Values</h2>
                    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mb-12">

                        <!-- Card 01 -->
                        <div
                            class="value-card rounded-xl shadow-xl p-6 text-center transform transition-transform duration-300 hover:scale-105">
                            <div class="text-5xl mb-4">
                                <i class="fas fa-handshake" style="color: #031e38; font-size: 24px;"></i>
                            </div>
                            <h3 class="text-xl font-bold text-white mb-2">Exceptional Service</h3>
                            <p class="text-gray-400 text-sm">
                                Personalized recommendations and attentive support for every reader.
                            </p>
                        </div>
                        <!-- /Card 01 -->
                        <!-- Card 02 -->
                        <div
                            class="value-card rounded-xl shadow-xl p-6 text-center transform transition-transform duration-300 hover:scale-105">
                            <div class="text-5xl mb-4">
                                <i class="fas fa-globe" style="color: #1e90ff; font-size: 24px;"></i>
                            </div>
                            <h3 class="text-xl font-bold text-white mb-2">Diversity & Inclusion</h3>
                            <p class="text-gray-400 text-sm">
                                A curated selection that celebrates quality, diversity, and inclusivity.
                            </p>
                        </div>
                        <!-- /Card 02 -->
                        <!-- Card 03 -->
                        <div
                            class="value-card rounded-xl shadow-xl p-6 text-center transform transition-transform duration-300 hover:scale-105">
                            <div class="text-5xl mb-4">
                                <i class="fa-solid fa-circle-info" style="color: #1e90ff; font-size: 24px;"></i>
                            </div>
                            <h3 class="text-xl font-bold text-white mb-2">Local Support</h3>
                            <p class="text-gray-400 text-sm">
                                Championing local authors, publishers, and educational initiatives.
                            </p>
                        </div>
                        <!-- /Card 03 -->
                        <!-- Card 04 -->
                        <div
                            class="value-card rounded-xl shadow-xl p-6 text-center transform transition-transform duration-300 hover:scale-105">
                            <div class="text-5xl mb-4">
                                <i class="fa-solid fa-universal-access" style="color: #1e90ff; font-size: 24px;"></i>
                            </div>
                            <h3 class=" text-xl font-bold text-white mb-2">Accessibility</h3>
                            <p class="text-gray-400 text-sm">
                                A welcoming, accessible space for all readers in our community.
                            </p>
                        </div>
                        <!-- /Card 04 -->
                    </div>
                    <!-- /Values -->

                    <!-- Offering -->
                    <section id="features"
                             class="w-full max-w-7xl mb-8 p-4 bg-gray-800 rounded-xl shadow-lg border border-gray-700 text-white">
                        <h2 class="text-2xl md:text-4xl text-white text-center p-4">Our Offering</h2>
                        <div class="grid grid-cols-1 md:grid-cols-4 gap-8 text-center">
                            <!-- Card 01 -->
                            <div
                                class="p-6 bg-gray rounded-xl shadow-md p-6 flex items-center space-x-4 w-full transform interactive-element book-card-glow">
                                <div>
                                    <div class="text-lg font-semibold text-white-900">School Text Books</div>
                                    <p class="text-sm text-gray-400">All subjects for
                                        local and international curricula</p>
                                </div>
                            </div>
                            <!-- /Card 01 -->

                            <!-- Card 02 -->
                            <div
                                class="p-6 bg-gray rounded-xl shadow-md p-6 flex items-center space-x-4 w-full transform interactive-element book-card-glow">
                                <div>
                                    <div class="text-lg font-semibold text-white-900">Higher Education</div>
                                    <p class="text-sm text-gray-400">University-level texts and academic journals</p>
                                </div>
                            </div>
                            <!-- /Card 02 -->

                            <!-- Card 03 -->
                            <div
                                class="p-6 bg-gray rounded-xl shadow-md p-6 flex items-center space-x-4 w-full transform interactive-element book-card-glow">
                                <div>
                                    <div class="text-lg font-semibold text-white-900">Fiction & Fantasy</div>
                                    <p class="text-sm text-gray-400">A wide
                                        array of books to broaden horizons</p>
                                </div>
                            </div>
                            <!-- /Card 03 -->

                            <!-- Card 04 -->
                            <div
                                class="p-6 bg-gray rounded-xl shadow-md p-6 flex items-center space-x-4 w-full transform interactive-element book-card-glow">
                                <div>
                                    <div class="text-lg font-semibold text-white-900">Children's Books</div>
                                    <p class="text-sm text-gray-400">Engaging stories
                                        and content to spark early literacy</p>
                                </div>
                            </div>
                            <!-- /Card 04 -->
                        </div>
                    </section>
                </article>
            </main>
        </div>
        <!-- /About Section -->

        <!-- Contact Section -->
        <div id="Contact-section" class="content-section">
            <main class="container mx-auto p-6 md:p-10 lg:p-12 mt-2 mb-2 bg-gray-800 rounded-xl shadow-2xl max-w-7xl">
                <h2 class="text-3xl md:text-4xl font-bold text-white text-center mb-10">Contact US</h2>
                <div class="flex flex-col md:flex-row gap-8">
                    <section id="contact-quick"
                             class="w-full md:w-1/2 mb-2 p-8 bg-gray-800 rounded-xl shadow-lg border border-gray-700 text-white">
                        <h3 class="text-2xl font-bold text-white mb-4 text-center md:text-left">Contact Details</h3>
                        <div class="space-y-4 text-gray-300 text-lg">
                            <p class="flex items-center">
                                <i class="fa-solid fa-location-dot p-2" style="color: #c21004; font-size: 24px;"></i>
                                <strong class="p-3">Address:</strong> 155, S. De. S Jayasinghe Mawatha, <br> Western, Sri
                                Lanka.
                            </p>
                            <p class="flex items-center">
                                <i class="fa-solid fa-phone-volume p-2" style="color: #c21004; font-size: 24px;"></i>
                                <strong class="p-3">Hotline:</strong> (011) 230 7199
                            </p>
                            <p class="flex items-center">
                                <i class="fa-solid fa-phone p-2" style="color: #c21004; font-size: 24px;"></i>
                                <strong class="p-3">Phone:</strong> (075) 397 8978
                            </p>
                            <p class="flex items-center">
                                <i class="fa-solid fa-envelope p-2" style="color: #c21004; font-size: 24px;"></i>
                                <strong class="p-3">Email:</strong> Pahanaedu@info.com
                            </p>
                        </div>
                    </section>

                    <section id="map-view"
                             class="w-full md:w-1/2 p-8 bg-gray-800 rounded-xl shadow-lg border border-gray-700">
                        <h3 class="text-2xl font-bold text-white mb-4 text-center">Our Location</h3>
                        <div class="h-80 w-full">
                            <iframe
                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3961.17837510487!2d79.88469717478674!3d6.869217919049712!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae25a4513a6f0e1%3A0x19bcaec7785ee0be!2s155%20S.%20De%20S.%20Jayasinghe%20Mawatha%2C%20Nugegoda%2000500!5e0!3m2!1sen!2slk!4v1755624934205!5m2!1sen!2slk"
                                class="w-full h-full rounded-lg" style="border:0;" allowfullscreen="" loading="lazy"
                                referrerpolicy="no-referrer-when-downgrade" width="100%" height="100%" frameborder="0">
                            </iframe>
                        </div>
                    </section>
                </div>
            </main>
        </div>
        <!-- /Contact Section -->

        <!-- Logi Section -->
        <div id="Login-section" class="content-section active"> <!-- make active by default -->
            <main class="flex-grow flex items-center justify-center p-12">
                <div class="bg-gray-800 p-12 rounded-xl shadow-2xl w-full max-w-md border border-gray-700">
                    <h2 class="text-2xl font-semibold text-center mb-6 text-white">Sign in to your account</h2>

                    <div id="messageBox" class="hidden bg-[#2f8a9a] text-blue-100 p-3 rounded-lg mb-4 text-center"
                         role="alert">
                    </div>

                    <form id="loginForm" class="space-y-5">
                        <div>
                            <label for="email" class="block text-sm font-medium text-gray-300 mb-2">Username</label>
                            <input type="email" id="email" name="email"
                                   class="w-full px-4 py-3 bg-gray-700 rounded-lg border border-gray-600 focus:outline-none focus:ring-2 focus:ring-[#2f8a9a] text-white placeholder-gray-400 transition-all duration-300">
                        </div>
                        <div>
                            <label for="password" class="block text-sm font-medium text-gray-300 mb-2">Password</label>
                            <div class="relative">
                                <input type="password" id="password" name="password"
                                       class="w-full px-4 py-3 bg-gray-700 rounded-lg border border-gray-600 focus:outline-none focus:ring-2 focus:ring-[#2f8a9a] text-white placeholder-gray-400 pr-10 transition-all duration-300">
                                <button type="button" id="togglePassword"
                                        class="absolute inset-y-0 right-0 pr-3 flex items-center text-gray-400 hover:text-gray-300 focus:outline-none">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </div>
                        </div>

                        <button type="submit"
                                class="w-full bg-[#2f8a9a] hover:bg-[#287989] text-white font-bold py-3 px-4 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#2f8a9a] focus:ring-offset-2 focus:ring-offset-gray-800 transition-all duration-300 transform hover:scale-105">
                            Login
                        </button>
                    </form>

                    <button id="testUserBtn"
                            class="w-full bg-gray-700 hover:bg-gray-600 text-white font-bold py-3 px-4 rounded-lg mt-4 focus:outline-none focus:ring-2 focus:ring-gray-600 focus:ring-offset-2 focus:ring-offset-gray-800 transition-all duration-300 transform hover:scale-105">
                        Sign
                    </button>

                    <p class="text-center text-gray-400 text-sm mt-6">
                        Don't have an account yet?
                        <a href="#" class="text-blue-400 hover:text-blue-300 font-medium ml-1">Create Account</a>
                    </p>
                </div>
            </main>
        </div>
        <!-- /Logi Section -->

        <!-- Signup Section -->
        <div id="Signup-section" class="content-section">
            <main class="flex-grow flex items-center justify-center p-12">
                <div class="bg-[#2d3748] p-12 rounded-lg shadow-xl w-full max-w-md">
                    <h2 class="text-gray-100 text-2xl font-semibold mb-6 text-center">Create and account</h2>

                    <form class="space-y-4">
                        <div class="flex flex-col sm:flex-row gap-4">
                            <div class="w-full">
                                <label for="first-name" class="block text-gray-300 text-sm font-bold mb-2">First
                                    Name</label>
                                <input type="text" id="first-name" name="first-name"
                                       class="shadow appearance-none border border-[#4a5568] rounded-md w-full py-2 px-3 text-gray-100 leading-tight focus:outline-none focus:shadow-outline bg-[#4a5568]">
                            </div>
                            <div class="w-full">
                                <label for="last-name" class="block text-gray-300 text-sm font-bold mb-2">Last Name</label>
                                <input type="text" id="last-name" name="last-name"
                                       class="shadow appearance-none border border-[#4a5568] rounded-md w-full py-2 px-3 text-gray-100 leading-tight focus:outline-none focus:shadow-outline bg-[#4a5568]">
                            </div>
                        </div>

                        <div>
                            <label for="email" class="block text-gray-300 text-sm font-bold mb-2">Your email</label>
                            <input type="email" id="email" name="email"
                                   class="shadow appearance-none border border-[#4a5568] rounded-md w-full py-2 px-3 text-gray-100 leading-tight focus:outline-none focus:shadow-outline bg-[#4a5568]">
                        </div>

                        <div>
                            <label for="password" class="block text-gray-300 text-sm font-bold mb-2">Password</label>
                            <div class="relative">
                                <input type="password" id="password" name="password"
                                       class="shadow appearance-none border border-[#4a5568] rounded-md w-full py-2 px-3 pr-10 text-gray-100 leading-tight focus:outline-none focus:shadow-outline bg-[#4a5568]">
                                <i class="fas fa-eye-slash absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 cursor-pointer"
                                   id="togglePassword"></i>
                            </div>
                        </div>

                        <div>
                            <label for="confirm-password" class="block text-gray-300 text-sm font-bold mb-2">Confirm
                                password</label>
                            <div class="relative">
                                <input type="password" id="confirm-password" name="confirm-password"
                                       class="shadow appearance-none border border-[#4a5568] rounded-md w-full py-2 px-3 pr-10 text-gray-100 leading-tight focus:outline-none focus:shadow-outline bg-[#4a5568]">
                                <i class="fas fa-eye-slash absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 cursor-pointer"
                                   id="toggleConfirmPassword"></i>
                            </div>
                        </div>

                        <button type="submit"
                                class="w-full bg-[#20B2AA] text-white font-bold py-2 px-4 rounded-md hover:bg-[#1C9A93] focus:outline-none focus:shadow-outline transition">
                            Create Account
                        </button>
                    </form>

                    <p class="text-center text-gray-400 text-sm mt-6">
                        Already have an account?
                        <a href="#" class="text-blue-400 hover:text-blue-300 font-bold">Login</a>
                    </p>
                </div>
            </main>

            <script>
                // JavaScript for toggling password visibility
                document.addEventListener('DOMContentLoaded', function () {
                    const togglePassword = document.getElementById('togglePassword');
                    const password = document.getElementById('password');

                    if (togglePassword && password) {
                        togglePassword.addEventListener('click', function () {
                            // Toggle the type attribute
                            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                            password.setAttribute('type', type);

                            // Toggle the eye icon
                            this.classList.toggle('fa-eye');
                            this.classList.toggle('fa-eye-slash');
                        });
                    }

                    const toggleConfirmPassword = document.getElementById('toggleConfirmPassword');
                    const confirmPassword = document.getElementById('confirm-password');

                    if (toggleConfirmPassword && confirmPassword) {
                        toggleConfirmPassword.addEventListener('click', function () {
                            // Toggle the type attribute
                            const type = confirmPassword.getAttribute('type') === 'password' ? 'text' : 'password';
                            confirmPassword.setAttribute('type', type);

                            // Toggle the eye icon
                            this.classList.toggle('fa-eye');
                            this.classList.toggle('fa-eye-slash');
                        });
                    }
                });
            </script>
        </div>
        <!-- /Signup Section -->

        <!-- Footer -->
        <footer id="main-footer" class="footer-bg text-white p-2 rounded-t-lg shadow-inner">
            <div class="container mx-auto px-2 py-4">
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8 mb-10">

                    <!-- About US -->
                    <div class="flex flex-col items-center md:items-start text-center md:text-left">
                        <h3 class="text-3xl font-semibold mb-4 text-gray-200">PAHANA EDU</h3>
                        <p class="text-sm text-gray-400 leading-relaxed mb-4">
                            Pahana Book Edu has been inspiring minds since 2014, providing valuable resources to students,
                            parents, and lifelong learners across every academic field.
                        </p>
                        <div class="flex space-x-4">
                            <a href="#" class="footer-link"><i class="fab fa-facebook-f text-lg"></i></a>
                            <a href="#" class="footer-link"><i class="fab fa-twitter text-lg"></i></a>
                            <a href="#" class="footer-link"><i class="fab fa-instagram text-lg"></i></a>
                            <a href="#" class="footer-link"><i class="fab fa-linkedin-in text-lg"></i></a>
                        </div>
                    </div>

                    <!-- Quick Links -->
                    <div class="flex flex-col items-center md:items-start text-center md:text-left">
                        <h3 class="text-xl font-semibold mb-4 text-gray-200">Quick Links</h3>
                        <ul class="space-y-2">
                            <li><a href="#" class="footer-link">Home</a></li>
                            <li><a href="#" class="footer-link">Book</a></li>
                            <li><a href="#" class="footer-link">About</a></li>
                            <li><a href="#" class="footer-link">Contact</a></li>
                            <li><a href="#" class="footer-link">Login</a></li>
                        </ul>
                    </div>

                    <!-- Categories -->
                    <div class="flex flex-col items-center md:items-start text-center md:text-left">
                        <h3 class="text-xl font-semibold mb-4 text-gray-200">Categories</h3>
                        <ul class="space-y-2">
                            <li><a href="#" class="footer-link">Science Fiction</a></li>
                            <li><a href="#" class="footer-link">Historical Fiction</a></li>
                            <li><a href="#" class="footer-link">Business & Finance</a></li>
                            <li><a href="#" class="footer-link">Health & Fitness</a></li>
                            <li><a href="#" class="footer-link">Children</a></li>
                        </ul>
                    </div>

                    <!-- Contact Us -->
                    <div class="flex flex-col items-center md:items-start text-center md:text-left">
                        <h3 class="text-xl font-semibold mb-4 text-gray-200">Contact Us</h3>
                        <address class="not-italic text-sm text-gray-400 space-y-2">
                            <p class="flex items-center justify-center md:justify-start">
                                <i class="fas fa-map-marker-alt mr-2"></i>
                                Pahana Edu - 155, S. De. S Jayasinghe Mawatha, Nugegoda, Western, Sri
                                Lanka
                            </p>
                            <p class="flex items-center justify-center md:justify-start">
                                <i class="fas fa-envelope mr-2"></i>
                                Pahanaedu@info.com
                            </p>
                            <p class="flex items-center justify-center md:justify-start">
                                <i class="fas fa-phone mr-2"></i>
                                Hotline - 0753 978 978
                            </p>
                        </address>
                    </div>
                </div>

                <!-- Copyrighty -->
                <div class="text-center text-gray-500 text-sm mt-2 border-t border-gray-700 pt-6">
                    <p>&copy; 2025 Pahana Edu. All rights reserved.</p>
                    <p class="mt-1">Developed by <a href="#" class="text-blue-400 hover:underline">Nilujan</a></p>
                </div>
            </div>
        </footer>
        <!-- /Footer -->

       <script>
        // Navigations Menu
        document.addEventListener('DOMContentLoaded', () => {
            const navButtons = document.querySelectorAll('.nav-button');
            const contentSections = document.querySelectorAll('.content-section');
            const footer = document.getElementById('main-footer');

            // activate button
            function showSection(targetId) {
                navButtons.forEach(button => button.classList.remove('active'));
                contentSections.forEach(section => section.classList.remove('active'));

                const activeButton = document.querySelector(`.nav-button[data-target="${targetId}"]`);
                if (activeButton) {
                    activeButton.classList.add('active');
                }

                const targetSection = document.getElementById(targetId);
                if (targetSection) {
                    targetSection.classList.add('active');
                }

                // footer visibility
                if (targetId === 'Login-section' || targetId === 'Signup-section') {
                    footer.style.display = 'none';
                } else {
                    footer.style.display = 'block';
                }
            }

            // clicknavigation buttons
            navButtons.forEach(button => {
                button.addEventListener('click', (event) => {
                    const targetId = event.target.dataset.target;
                    showSection(targetId);
                });
            });
            showSection('Home-section');
        });

        // Book Slider
        const bookSlider = document.getElementById('book-slider');
        const bookPrevBtn = document.getElementById('book-prevBtn');
        const bookNextBtn = document.getElementById('book-nextBtn');
        const bookDotsContainer = document.getElementById('book-dots-container');
        const bookSlides = bookSlider.children;
        const totalBookSlides = bookSlides.length;
        let bookCurrentIndex = 0;

        function updateBookSlider() {
            bookSlider.style.transform = `translateX(-${bookCurrentIndex * 100}%)`;
            updateBookDots();
        }

        function updateBookDots() {
            bookDotsContainer.innerHTML = '';
            for (let i = 0; i < totalBookSlides; i++) {
                const dot = document.createElement('div');
                dot.classList.add('w-3', 'h-3', 'rounded-full', 'bg-gray-400', 'cursor-pointer', 'transition-colors', 'duration-300');
                if (i === bookCurrentIndex) {
                    dot.classList.remove('bg-gray-400');
                    dot.classList.add('bg-white');
                }
                dot.addEventListener('click', () => {
                    bookCurrentIndex = i;
                    updateBookSlider();
                });
                bookDotsContainer.appendChild(dot);
            }
        }

        bookNextBtn.addEventListener('click', () => {
            bookCurrentIndex = (bookCurrentIndex + 1) % totalBookSlides;
            updateBookSlider();
        });

        bookPrevBtn.addEventListener('click', () => {
            bookCurrentIndex = (bookCurrentIndex - 1 + totalBookSlides) % totalBookSlides;
            updateBookSlider();
        });

        // Publisher Slider
        const publisherSlider = document.getElementById('publisher-slider');
        const publisherPrevBtn = document.getElementById('publisher-prevBtn');
        const publisherNextBtn = document.getElementById('publisher-nextBtn');
        const publisherDotsContainer = document.getElementById('publisher-dots-container');
        const publisherSlides = publisherSlider.children;
        const totalPublisherSlides = publisherSlides.length;
        const slidesPerPage = 5;
        let publisherCurrentIndex = 0;

        function updatePublisherSlider() {
            publisherSlider.style.transform = `translateX(-${publisherCurrentIndex * (100 / slidesPerPage)}%)`;
            updatePublisherDots();
        }

        function updatePublisherDots() {
            publisherDotsContainer.innerHTML = '';
            const totalDots = Math.ceil(totalPublisherSlides / slidesPerPage);
            for (let i = 0; i < totalDots; i++) {
                const dot = document.createElement('div');
                dot.classList.add('w-3', 'h-3', 'rounded-full', 'cursor-pointer', 'transition-colors', 'duration-300');
                if (i === publisherCurrentIndex) {
                    dot.classList.add('bg-white');
                } else {
                    dot.classList.add('bg-gray-400', 'hover:bg-gray-500');
                }
                dot.addEventListener('click', () => {
                    publisherCurrentIndex = i;
                    updatePublisherSlider();
                });
                publisherDotsContainer.appendChild(dot);
            }
        }

        publisherNextBtn.addEventListener('click', () => {
            const totalDots = Math.ceil(totalPublisherSlides / slidesPerPage);
            publisherCurrentIndex = (publisherCurrentIndex + 1) % totalDots;
            updatePublisherSlider();
        });

        publisherPrevBtn.addEventListener('click', () => {
            const totalDots = Math.ceil(totalPublisherSlides / slidesPerPage);
            publisherCurrentIndex = (publisherCurrentIndex - 1 + totalDots) % totalDots;
            updatePublisherSlider();
        });

        // Initialize sliders and automatic sliding on load
        window.onload = function () {
            updateBookSlider();
            updatePublisherSlider();

            setInterval(() => {
                bookCurrentIndex = (bookCurrentIndex + 1) % totalBookSlides;
                updateBookSlider();
            }, 5000);

            setInterval(() => {
                const totalDots = Math.ceil(totalPublisherSlides / slidesPerPage);
                publisherCurrentIndex = (publisherCurrentIndex + 1) % totalDots;
                updatePublisherSlider();
            }, 5000);
        };
    </script>
    </body>


</html>