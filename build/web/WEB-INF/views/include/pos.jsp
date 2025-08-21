<style>
    /* POS Layout */
    .pos-left-panel {
        flex: 2;
        display: flex;
        flex-direction: column;
        padding: 20px;
        border-right: 1px solid #eee;
        background-color: #f9fdf9;
        overflow: hidden;
        border-radius: 10px;
    }

    .pos-right-panel {
        flex: 1;
        display: flex;
        flex-direction: column;
        padding: 20px;
        background-color: #ffffff;
        overflow: hidden;
        border-radius: 10px;
        box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px;
    }

    /* Search Bar */
    .input-wrapper {
        position: relative;
        flex-grow: 1;
    }

    .input-wrapper input[type="text"] {
        width: 100%;
        padding: 10px 30px 10px 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }

    .clear-btn {
        position: absolute;
        right: 10px;
        top: 50%;
        transform: translateY(-50%);
        font-size: 18px;
        color: #999;
        cursor: pointer;
        display: none;
        user-select: none;
        z-index: 2;
    }

    .clear-btn:hover {
        color: #555;
    }

    .product-search-bar {
        display: flex;
        gap: 10px;
        margin-bottom: 20px;
    }

    .product-search-bar input[type="text"] {
        flex-grow: 1;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .product-search-bar button {
        padding: 10px 15px;
        background-color: #2196F3;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 1em;
        transition: background-color 0.3s ease;
    }

    .product-search-bar button:hover {
        background-color: #1976D2;
    }

    /* Product Grid */
    .product-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
        gap: 16px;
        padding: 10px 0;
        overflow-y: auto;
    }

    /* Product Item */
    .product-item {
        background-color: #e8f5e9;
        border-radius: 10px;
        padding: 10px;
        height: 120px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        align-items: center;
        text-align: center;
        transition: transform 0.3s ease;
        box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3) 0px 3px 7px -3px;
        cursor: pointer;
    }

    /* Hover Effect */
    .product-item:hover {
        transform: scale(1.03);
        border: 1px solid #5cb85c;
        box-shadow: 0 4px 8px rgba(0,0,0,0.2);
    }

    /* Product Image */
    .product-item img {
        height: 40px;
        width: 40px;
        object-fit: contain;
        margin-bottom: 5px;
    }

    /* Product Title */
    .product-item h3 {
        margin: 5px 0;
        font-size: 1.1em;
        color: #2e7d32;
        line-height: 1.2;
    }

    /* Product Price */
    .product-item p {
        font-weight: bold;
        margin: 0;
        color: #444;
    }

    /* Bill Area */
    .bill-items-list {
        flex-grow: 1;
        border: 1px dashed #ccc;
        border-radius: 5px;
        padding: 10px;
        margin-bottom: 15px;
        overflow-y: auto;
        background-color: #fafffa;
        display: flex;
        flex-direction: column;
    }

    .bill-list-header,
    .bill-item {
        display: grid;
        grid-template-columns: 2fr 0.8fr 1fr 1fr 0.8fr;
        gap: 5px;
        align-items: center;
    }

    .bill-list-header {
        font-weight: bold;
        padding-bottom: 8px;
        margin-bottom: 8px;
        border-bottom: 2px solid #eee;
    }

    .bill-item {
        padding: 8px 0;
        border-bottom: 1px solid #eee;
    }

    .bill-item:last-child {
        border-bottom: none;
    }

    .empty-bill-message {
        text-align: center;
        color: #888;
        padding: 20px;
    }

    .item-qty,
    .item-price,
    .item-total {
        text-align: center;
    }

    .remove-bill-item-btn {
        background-color: #ffcccb;
        color: #d32f2f;
        border: 1px solid #ff7979;
        padding: 4px 8px;
        border-radius: 3px;
        cursor: pointer;
        font-size: 0.8em;
        transition: background-color 0.2s ease, color 0.2s ease;
    }

    .remove-bill-item-btn:hover {
        background-color: #ff7979;
        color: white;
    }

    /* Summary */
    .bill-summary {
        margin-top: auto;
        padding-top: 15px;
        border-top: 2px solid #eee;
    }

    .summary-row {
        display: flex;
        justify-content: space-between;
        padding: 5px 0;
        font-size: 1.1em;
    }

    .total-row {
        font-size: 1.6em;
        font-weight: bold;
        color: #4CAF50;
        border-top: 1px dashed #ccc;
        margin-top: 10px;
        padding-top: 10px;
    }

    .editable-discount {
        display: flex;
        align-items: center;
        gap: 5px;
    }

    #applyDiscountBtn {
        background-color: #607d8b;
        color: white;
        border: none;
        padding: 4px 8px;
        border-radius: 3px;
        cursor: pointer;
        font-size: 0.8em;
    }

    #applyDiscountBtn:hover {
        background-color: #455a64;
    }

    /* Bill Buttons */
    .bill-actions {
        display: flex;
        gap: 10px;
        margin-top: 20px;
        flex-wrap: wrap;
    }

    .action-btn {
        flex: 1;
        min-width: 120px;
        padding: 12px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-size: 1.1em;
        font-weight: bold;
        text-align: center;
        transition: background-color 0.3s ease, transform 0.1s ease;
    }

    .clear-btn {
        background-color: #ff9800;
        color: white;
    }

    .clear-btn:hover {
        background-color: #fb8c00;
        transform: translateY(-1px);
    }

    .add-btn {
        background-color: #4CAF50;
        color: white;
    }

    .add-btn:hover {
        background-color: #388E3C;
        transform: translateY(-1px);
    }

    .print-btn {
        background-color: #2196F3;
        color: white;
    }

    .print-btn:hover {
        background-color: #1976D2;
        transform: translateY(-1px);
    }

    /* Responsive Design */
    @media (max-width: 900px) {
        .container {
            flex-direction: column;
        }

        .pos-left-panel,
        .pos-right-panel {
            width: 100%;
            border-right: none;
            border-bottom: 1px solid #eee;
            padding-bottom: 20px;
        }

        .pos-right-panel {
            padding-top: 20px;
        }
    }

    @media (max-width: 600px) {
        .bill-list-header,
        .bill-item {
            grid-template-columns: 2fr 1fr 1fr 0.8fr;
            font-size: 0.9em;
        }

        .bill-list-header span:nth-child(3),
        .bill-item .item-price {
            display: none;
        }

        .summary-row {
            font-size: 1em;
        }

        .total-row {
            font-size: 1.4em;
        }

        .action-btn {
            font-size: 1em;
            padding: 10px 8px;
            min-width: unset;
        }
    }
</style>

<div class="max-w-7xl mx-auto pt-4 container">
    <div class="flex flex-col lg:flex-row gap-2">

        <!-- Left Side - Table -->
        <div class="lg:w-2/3">
            <div class="bg-white rounded-xl shadow-lg p-6">
                <h2 class="text-2xl font-semibold text-gray-800">Book Store</h2>
                <div class="pos-left-panel">
                    <!--search Box-->
                    <div class="product-search-bar">
                        <div class="input-wrapper">
                            <input type="text" id="productSearch" placeholder="Search Book...">
                            <span id="clearSearchBtn" class="clear-btn">&times;</span>
                        </div>
                        <button id="searchBtn">
                            <i class="fas fa-search" style="margin-right: 6px;"></i>Search
                        </button>
                    </div>
                    <!--End search Box-->

                    <div class="product-grid" id="productGrid">
                        <div
                            class="product-item p-2 rounded-xl shadow-lg border  hover:scale-105 transition duration-300 transform hover:border-gray-500">
                            <img src="images/book/01.png">
                            <h3>Robin Harper</h3>
                            <p>Rs.800.00</p>
                        </div>

                        <div
                            class="product-item p-2 rounded-xl shadow-lg border  hover:scale-105 transition duration-300 transform hover:border-gray-500">
                            <img src="images/book/14.png">
                            <h3>Elon Musk</h3>
                            <p>Rs.400.00</p>
                        </div>

                        <div class="product-item p-2 rounded-xl shadow-lg border  hover:scale-105 transition duration-300 transform hover:border-gray-500"
                             data-id="3" data-name="book" data-price="5.75">
                            <img src="images/book/02.png">
                            <h3>Fairy Tale</h3>
                            <p>Rs.1600.00</p>
                        </div>

                        <div class="product-item p-2 rounded-xl shadow-lg border  hover:scale-105 transition duration-300 transform hover:border-gray-500"
                             data-id="4" data-name="book" data-price="3.20">
                            <img src="images/book/05.png">
                            <h3>End of Watch</h3>
                            <p>Rs.800.00</p>
                        </div>

                        <div class="product-item p-2 rounded-xl shadow-lg border  hover:scale-105 transition duration-300 transform hover:border-gray-500"
                             data-id="1" data-name="book" data-price="2.50">
                            <img src="images/book/20.png">
                            <h3>Einstein</h3>
                            <p>Rs.1100.00</p>
                        </div>

                        <div class="product-item" data-id="2" data-name="book" data-price="2.00">
                            <img src="images/book/07.png">
                            <h3>The Unwilling</h3>
                            <p>Rs.800.00</p>
                        </div>
                        <div class="product-item" data-id="3" data-name="book" data-price="5.75">
                            <img src="images/book/013.png">
                            <h3>Deep Horizons</h3>
                            <p>Rs.700.00</p>
                        </div>
                        <div class="product-item" data-id="4" data-name="book" data-price="3.20">
                            <img src="images/book/18.png">
                            <h3>Alexander Hamilton</h3>
                            <p>Rs.1300.00</p>
                        </div>

                        <div class="product-item" data-id="2" data-name="book" data-price="2.00">
                            <img src="images/book/07.png">
                            <h3>The Unwilling</h3>
                            <p>Rs.800.00</p>
                        </div>
                        <div class="product-item" data-id="3" data-name="book" data-price="5.75">
                            <img src="images/book/013.png">
                            <h3>Deep Horizons</h3>
                            <p>Rs.700.00</p>
                        </div>
                        <div class="product-item" data-id="4" data-name="book" data-price="3.20">
                            <img src="images/book/18.png">
                            <h3>Alex Hamilton</h3>
                            <p>Rs.1300.00</p>
                        </div>




                    </div>
                </div>
            </div>
        </div>

        <!-- Right Side - Form -->
        <div class="lg:w-1/3 mt-8 lg:mt-0">
            <div class="bg-white rounded-xl shadow-lg p-6 h-fit sticky top-6">
                <!--Current Bill-->
                <div class="pos-right-panel">
                    <h2>Current Bill</h2>
                    <div class="bill-items-list" id="billItemsList">
                        <div class="bill-list-header">
                            <span>Item</span>
                            <span>Qty</span>
                            <span>Price</span>
                            <span>Total</span>
                            <span>Action</span>
                        </div>
                        <p class="empty-bill-message">No items on bill.</p>
                    </div>

                    <div class="bill-summary">
                        <div class="summary-row">
                            <span>Subtotal:</span>
                            <span>Rs.<span id="subTotal">0.00</span></span>
                        </div>
                        <div class="summary-row">
                            <span>Discount:</span>
                            <span class="editable-discount"><span id="discountAmount">0.00</span> <button
                                    id="applyDiscountBtn">Apply</button></span>
                        </div>
                        <div class="summary-row total-row">
                            <span>Total:</span>
                            <span>Rs.<span id="grandTotal">0.00</span></span>
                        </div>
                    </div>

                    <div class="bill-actions">
                        <button id="clearBillBtn" class="action-btn clear-btn">Clear Bill</button>
                        <button id="addBillBtn" class="action-btn add-btn">Add Bill</button>
                        <button id="printBillBtn" class="action-btn print-btn">Print Bill</button>
                    </div>
                </div>
                <!--Current Bill-->
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', () => {
    // --- Product Grid & Search ---
    const productGrid = document.getElementById('productGrid');
            const productSearchInput = document.getElementById('productSearch');
            const searchBtn = document.getElementById('searchBtn');
            const clearSearchBtn = document.getElementById('clearSearchBtn');
            productSearchInput.addEventListener('input', () => {
            clearSearchBtn.style.display = productSearchInput.value ? 'block' : 'none';
            });
            clearSearchBtn.addEventListener('click', () => {
            productSearchInput.value = '';
                    clearSearchBtn.style.display = 'none';
                    // Reset product grid view
                    const allProducts = productGrid.querySelectorAll('.product-item');
                    allProducts.forEach(product => {
                    product.style.display = '';
                    });
                    productSearchInput.focus();
            });
            productSearchInput.addEventListener('keyup', (event) => {
            const searchTerm = event.target.value.toLowerCase();
                    const allProducts = productGrid.querySelectorAll('.product-item');
                    allProducts.forEach(product => {
                    const productName = product.dataset.name.toLowerCase();
                            product.style.display = productName.includes(searchTerm) ? '' : 'none';
                    });
            });
            // --- Bill Panel Elements ---
            const billItemsList = document.getElementById('billItemsList');
            const subTotalSpan = document.getElementById('subTotal');
            const discountAmountSpan = document.getElementById('discountAmount');
            const grandTotalSpan = document.getElementById('grandTotal');
            const applyDiscountBtn = document.getElementById('applyDiscountBtn');
            // Initialize bill items and discount
            let currentBillItems = [];
            let discountPercentage = 0;
            // --- Bill Display Update ---
                    function updateBillDisplay() {
                    billItemsList.innerHTML = `
            <div class="bill-list-header">
                <span>Item</span>
                <span>Qty</span>
                <span>Price</span>
                <span>Total</span>
                <span>Action</span>
            </div>
        `;
                            if (currentBillItems.length === 0) {
                    billItemsList.innerHTML += '<p class="empty-bill-message">No items on bill.</p>';
                            subTotalSpan.textContent = '0.00';
                            discountAmountSpan.textContent = '0.00';
                            grandTotalSpan.textContent = '0.00';
                            return;
                    }

                    let subtotal = 0;
                            currentBillItems.forEach(item => {
                            const itemTotal = item.price * item.quantity;
                                    subtotal += itemTotal;
                                    const billItemDiv = document.createElement('div');
                                    billItemDiv.classList.add('bill-item');
                                    billItemDiv.innerHTML = `
                <span class="item-name">${item.name}</span>
                <span class="item-qty">${item.quantity}</span>
                <span class="item-price">${item.price.toFixed(2)}</span>
                <span class="item-total">${itemTotal.toFixed(2)}</span>
                <span class="item-actions">
                    <button class="remove-bill-item-btn" data-id="${item.id}">X</button>
                </span>
            `;
                                    billItemsList.appendChild(billItemDiv);
                            });
                            const discountValue = subtotal * (discountPercentage / 100);
                            const grandTotal = subtotal - discountValue;
                            subTotalSpan.textContent = subtotal.toFixed(2);
                            discountAmountSpan.textContent = discountValue.toFixed(2);
                            grandTotalSpan.textContent = grandTotal.toFixed(2);
                    }

            // --- Add Item from Product Grid ---
            productGrid.addEventListener('click', (event) => {
            const productItem = event.target.closest('.product-item');
                    if (productItem) {
            const id = parseInt(productItem.dataset.id);
                    const name = productItem.dataset.name;
                    const price = parseFloat(productItem.dataset.price);
                    const existingItem = currentBillItems.find(item => item.id === id);
                    if (existingItem) {
            existingItem.quantity++;
            } else {
            currentBillItems.push({id, name, price, quantity: 1});
            }
            updateBillDisplay();
            }
            });
                    // --- Remove Item from Bill ---
                    billItemsList.addEventListener('click', (event) => {
                    const target = event.target;
                            if (target.classList.contains('remove-bill-item-btn')) {
                    const id = parseInt(target.dataset.id);
                            currentBillItems = currentBillItems.filter(item => item.id !== id);
                            updateBillDisplay();
                    }
                    });
                    // --- Apply Discount ---
                    applyDiscountBtn.addEventListener('click', () => {
                    let inputDiscount = prompt("Enter discount percentage (e.g., 10 for 10%):", discountPercentage);
                            if (inputDiscount !== null) {
                    inputDiscount = parseFloat(inputDiscount);
                            if (!isNaN(inputDiscount) && inputDiscount >= 0 && inputDiscount <= 100) {
                    discountPercentage = inputDiscount;
                            updateBillDisplay();
                    } else {
                    alert("Invalid discount percentage. Please enter a number between 0 and 100.");
                    }
                    }
                    });
                    // --- Bill Action Buttons ---
                    const clearBillBtn = document.getElementById('clearBillBtn');
                    const addBillBtn = document.getElementById('addBillBtn');
                    const printBillBtn = document.getElementById('printBillBtn');
                    // --- Clear Bill ---
                    clearBillBtn.addEventListener('click', () => {
                    if (confirm('Are you sure you want to clear the current bill?')) {
                    currentBillItems = [];
                            discountPercentage = 0;
                            updateBillDisplay();
                    }
                    });
                    // --- Add Bill ---
                    addBillBtn.addEventListener('click', () => {
                    if (currentBillItems.length === 0) {
                    alert('No items on the bill to add. Please add products first.');
                            return;
                    }
                    const totalAmount = parseFloat(grandTotalSpan.textContent);
                            alert(`Bill added successfully for $${totalAmount.toFixed(2)}. This would typically save to a database.`);
                            currentBillItems = [];
                            discountPercentage = 0;
                            updateBillDisplay();
                    });
                    // --- Print Bill ---
                    printBillBtn.addEventListener('click', () => {
                    if (currentBillItems.length === 0) {
                    alert('No items on the bill to print.');
                            return;
                    }
                    alert('Printing bill... (This would typically open a print dialog or send to a printer service)');
                    });
                    // --- Initial Setup ---
                    updateBillDisplay();





</script>