<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Register</title>
    <meta charset="UTF-8">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: "Segoe UI", Arial, sans-serif; }
        body {
            min-height: 100vh;
            background:
                radial-gradient(circle at top left, rgba(59,130,246,0.22), transparent 28%),
                radial-gradient(circle at bottom right, rgba(168,85,247,0.16), transparent 24%),
                linear-gradient(135deg, #0f172a, #111827, #1e293b);
            color: #f8fafc;
        }
        .page-wrap {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px;
        }
        .glass-card {
            width: 100%;
            max-width: 430px;
            background: rgba(255,255,255,0.08);
            border: 1px solid rgba(255,255,255,0.12);
            border-radius: 24px;
            padding: 30px;
            backdrop-filter: blur(16px);
            box-shadow: 0 20px 45px rgba(0,0,0,0.28);
        }
        .badge {
            width: 64px; height: 64px; border-radius: 18px;
            background: rgba(255,255,255,0.12);
            border: 1px solid rgba(255,255,255,0.12);
            display: flex; align-items: center; justify-content: center;
            font-size: 26px; margin-bottom: 18px;
        }
        h2 { color: white; margin-bottom: 10px; }
        .subtitle { color: #cbd5e1; font-size: 14px; line-height: 1.7; margin-bottom: 22px; }
        .field { margin-bottom: 14px; }
        .field label { display: block; margin-bottom: 6px; color: #e2e8f0; font-size: 14px; font-weight: 600; }
        .field input, .field select {
            width: 100%; padding: 13px 14px; border-radius: 14px;
            border: 1px solid rgba(255,255,255,0.12);
            background: rgba(255,255,255,0.08); color: white; outline: none; font-size: 14px;
        }
        .field input::placeholder { color: #94a3b8; }
        .field input:focus, .field select:focus {
            border-color: rgba(96,165,250,0.65);
            box-shadow: 0 0 0 4px rgba(59,130,246,0.18);
        }
        .btn {
            width: 100%; padding: 13px; border: none; border-radius: 14px;
            cursor: pointer; font-weight: 600; font-size: 14px; margin-top: 8px;
            background: linear-gradient(135deg, #3b82f6, #8b5cf6); color: white;
        }
        .btn-secondary {
            background: rgba(255,255,255,0.1);
            color: #e2e8f0;
            border: 1px solid rgba(255,255,255,0.14);
        }
        .bottom-text {
            text-align: center; margin-top: 16px; color: #cbd5e1; font-size: 14px;
        }
        .bottom-text a { color: #93c5fd; text-decoration: none; }
    </style>
</head>
<body>
<div class="page-wrap">
    <div class="glass-card">
        <div class="badge">🎓</div>
        <h2>Student Register</h2>
        <p class="subtitle">Create your student account to access the learning portal and manage your details.</p>

        <form action="/student/register" method="post">
            <div class="field">
                <label>ID</label>
                <input type="number" name="id" placeholder="Enter student ID" required>
            </div>

            <div class="field">
                <label>Name</label>
                <input type="text" name="name" placeholder="Enter full name" required>
            </div>

            <div class="field">
                <label>Subject</label>
                <select name="subject" required>
                    <option value="">Select subject</option>
                    <option value="Java">Java</option>
                    <option value="Python">Python</option>
                    <option value="HTML">HTML</option>
                    <option value="SQL">SQL</option>
                </select>
            </div>
            
			<div class="field">
			    <label>Assign Trainer</label>
				<select name="trainerId" required>
				    <option value="">Select Trainer</option>
				    <c:forEach var="t" items="${trainers}">
				        <option value="${t.id}">${t.name} - ${t.subject}</option>
				    </c:forEach>
				</select>
			</div>
			
            <div class="field">
                <label>Email</label>
                <input type="email" name="email" placeholder="Enter email address" required>
            </div>

            <div class="field">
                <label>Password</label>
                <input type="password" name="password" placeholder="Create password" required>
            </div>

            <button class="btn" type="submit">Register</button>
        </form>

        <div class="bottom-text">
            Already have an account? <a href="/student/login">Login here</a>
        </div>
    </div>
</div>
</body>
</html>