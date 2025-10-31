<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration</title>
    <!-- Import Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Import Google Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        /* Use Inter as the default font */
        body {
            font-family: 'Inter', sans-serif;
        }
        
        /* Custom styles for Spring Form tags (radio/checkbox) */
        input[type="radio"], input[type="checkbox"] {
            @apply w-4 h-4 text-indigo-600 border-gray-300 focus:ring-indigo-500;
        }
    </style>
</head>
<body class="bg-gradient-to-br from-blue-50 to-indigo-100 min-h-screen py-12 px-4 sm:px-6 lg:px-8">

    <div class="max-w-2xl w-full mx-auto">
        
        <form:form action="save" modelAttribute="student" method="post" class="bg-white rounded-2xl shadow-xl overflow-hidden">
            <div class="p-6 sm:p-8">
                <!-- Form Header -->
                <div class="text-center">
                    <h1 class="text-3xl font-bold text-indigo-700">Student Registration</h1>
                    <p class="mt-2 text-sm text-gray-600">
                        Fill out the form to register a new student.
                    </p>
                    <!-- Success Message -->
                    <c:if test="${not empty msg}">
                        <div class="mt-4 text-sm font-medium text-green-700 bg-green-100 rounded-lg p-3">
                            ${msg}
                        </div>
                    </c:if>
                </div>
                
                <hr class="my-6 border-t border-gray-200" />
                
                <form:hidden path="id"/>
                
                <!-- Form Fields -->
                <div class="space-y-6">
                    <!-- Student Name -->
                    <div>
                        <label for="name" class="block text-sm font-medium text-gray-700 mb-1">Student Name:</label>
                        <form:input path="name" id="name" placeholder="Enter full name" class="block w-full px-4 py-2.5 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" />
                    </div>

                    <!-- Email -->
                    <div>
                        <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email:</label>
                        <form:input path="email" id="email" type="email" placeholder="Enter email address" class="block w-full px-4 py-2.5 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" />
                    </div>

                    <!-- Gender -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Gender:</label>
                        <div class="flex items-center gap-x-6">
                            <label class="flex items-center gap-2 text-sm text-gray-600 cursor-pointer">
                                <form:radiobutton path="gender" value="Male"/> Male
                            </label>
                            <label class="flex items-center gap-2 text-sm text-gray-600 cursor-pointer">
                                <form:radiobutton path="gender" value="Female"/> Female
                            </label>
                        </div>
                    </div>

                    <!-- City (Address) -->
                    <div>
                        <label for="address" class="block text-sm font-medium text-gray-700 mb-1">City:</label>
                        <form:select path="address" id="address" class="block w-full px-4 py-2.5 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm bg-white">
                            <form:option value="">-- Select City --</form:option>
                            <form:option value="Pune">Pune</form:option>
                            <form:option value="Mumbai">Mumbai</form:option>
                            <form:option value="Delhi">Delhi</form:option>
                            <form:option value="Hyderabad">Hyderabad</form:option>
                            <form:option value="Bangalore">Bangalore</form:option>
                        </form:select>
                    </div>

                    <!-- Course -->
                    <div>
                        <label for="course" class="block text-sm font-medium text-gray-700 mb-1">Course:</label>
                        <form:select path="course" id="course" class="block w-full px-4 py-2.5 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm bg-white">
                            <form:options items="${courses}" />
                        </form:select>
                    </div>

                    <!-- Available Timings -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Available Timings:</label>
                        <div class="grid grid-cols-2 sm:grid-cols-3 gap-x-6 gap-y-3">
                            <c:forEach var="timingOption" items="${timings}">
                                <label class="flex items-center gap-2 text-sm text-gray-600 cursor-pointer">
                                    <form:checkbox path="timing" value="${timingOption}"/> ${timingOption}
                                </label>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Form Actions -->
            <div class="bg-gray-50 px-6 sm:px-8 py-4 flex flex-col sm:flex-row-reverse items-center gap-4">
                <input type="submit" value="Register Student" class="w-full sm:w-auto flex justify-center py-2.5 px-6 border border-transparent rounded-lg shadow-md text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 cursor-pointer transition-all duration-300 ease-in-out">
                
                <a href="student" class="w-full sm:w-auto text-center py-2.5 px-6 text-sm font-medium text-gray-700 bg-white hover:bg-gray-100 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 transition-all duration-300 ease-in-out">
                    View All Students
                </a>
            </div>
        </form:form>
        
        <!-- Footer -->
        <footer class="text-center py-6 mt-4">
            <p class="text-sm text-gray-500">&copy; 2025 Student Management System | Designed by Mahesh Zalte</p>
        </footer>
    </div>

</body>
</html>
