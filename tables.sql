-- 1. Вывести все уникальные названия продуктов
SELECT DISTINCT product_name
FROM Products;


-- 2. Вывести id, название и стоимость продуктов с содержанием клетчатки (fiber) более 5 граммов
SELECT p.product_id, p.product_name, p.price
FROM Products p
JOIN Nutritional_Information ni ON p.product_id = ni.product_id
WHERE ni.fiber > 5;

-- 3. Вывести название продукта с самым высоким содержанием белка (protein)
SELECT p.product_name
FROM Products p
JOIN Nutritional_Information ni ON p.product_id = ni.product_id
ORDER BY ni.protein DESC
LIMIT 1;

-- 4. Подсчитать общую сумму калорий для продуктов каждой категории, но не учитывать продукты с нулевым жиром
SELECT c.category_id, SUM(p.calories) AS total_calories
FROM Categories c
JOIN Products p ON c.category_id = p.category_id
JOIN Nutritional_Information ni ON p.product_id = ni.product_id
WHERE ni.fat > 0
GROUP BY c.category_id;

-- 5. Рассчитать среднюю цену товаров каждой категории
SELECT c.category_name, AVG(p.price) AS average_price
FROM Categories c
JOIN Products p ON c.category_id = p.category_id
GROUP BY c.category_name;