<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
	    <title>사칙연산 및 나머지 계산기</title>
	    <style>
	        body {
	            font-family: Arial, sans-serif;
	            max-width: 500px;
	            margin: 50px auto;
	            padding: 20px;
	        }
	        .calculator {
	            border: 2px solid #333;
	            padding: 20px;
	            border-radius: 10px;
	            background-color: #f5f5f5;
	        }
	        input[type="number"] {
	            width: 100px;
	            padding: 8px;
	            margin: 5px;
	            font-size: 16px;
	        }
	        select {
	            padding: 8px;
	            margin: 5px;
	            font-size: 16px;
	        }
	        button {
	            padding: 10px 20px;
	            background-color: #4CAF50;
	            color: white;
	            border: none;
	            border-radius: 5px;
	            cursor: pointer;
	            font-size: 16px;
	            margin: 5px;
	        }
	        button:hover {
	            background-color: #45a049;
	        }
	        .result {
	            margin-top: 20px;
	            padding: 15px;
	            background-color: #e8f5e9;
	            border-radius: 5px;
	            font-size: 18px;
	            font-weight: bold;
	        }
	        .error {
	            background-color: #ffebee;
	            color: #c62828;
	        }
	    </style>
	</head>
	<body>
	    <div class="calculator">
	        <h2>사칙연산 및 나머지 계산기 by hcy</h2>
	        <form action="/calculate" method="post">
	            <div>
	                <input type="number" name="num1" step="any" placeholder="첫 번째 숫자" required>
	                
	                <select name="operator" required>
	 
	                    <option value="+">+</option>
	                    <option value="-">-</option>
	                    <option value="*">×</option>
	                    <option value="/">÷</option>
						<option value="%">%</option>
	                </select>
	 
	               
	                <input type="number" name="num2" step="any" placeholder="두 번째 숫자" required>
	            </div>
	            
	            <button type="submit">계산하기</button>
	        </form>
	        
	        <% 
	 if(request.getAttribute("result") != null) { %>
	            <div class="result">
	                결과: <%= request.getAttribute("num1") %> 
	                <%= request.getAttribute("operator") %> 
	                <%= request.getAttribute("num2") %> 
	                = <%= request.getAttribute("result") %>
	      
	       </div>
	        <% } %>
	        
	        <% if(request.getAttribute("error") != null) { %>
	            <div class="result error">
	                오류: <%= request.getAttribute("error") %>
	            </div>
	        <% } %>
	        
	
	        <div style="margin-top: 20px;">
	            <a href="/">Intro 페이지로 이동</a>
	        </div>
	    </div>
	</body>
</html>