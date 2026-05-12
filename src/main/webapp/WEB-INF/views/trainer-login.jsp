<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Trainer Login</title>
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
            min-height: 100vh; display: flex; justify-content: center; align-items: center; padding: 30px;
        }
        .glass-card {
            width: 100%; max-width: 430px; background: rgba(255,255,255,0.08);
            border: 1px solid rgba(255,255,255,0.12); border-radius: 24px; padding: 30px;
            backdrop-filter: blur(16px); box-shadow: 0 20px 45px rgba(0,0,0,0.28);
        }
        .badge {
            width: 64px; height: 64px; border-radius: 18px; background: rgba(255,255,255,0.12);
            border: 1px solid rgba(255,255,255,0.12); display: flex; align-items: center; justify-content: center;
            font-size: 26px; margin-bottom: 18px;
        }
        h2 { color: white; margin-bottom: 10px; }
        .subtitle { color: #cbd5e1; font-size: 14px; line-height: 1.7; margin-bottom: 22px; }
        .msg {
            margin-bottom: 16px; padding: 12px; border-radius: 12px;
            background: rgba(239,68,68,0.14); border: 1px solid rgba(239,68,68,0.25);
            color: #fecaca; text-align: center; font-size: 14px;
        }
        .field { margin-bottom: 14px; }
        .field label { display: block; margin-bottom: 6px; color: #e2e8f0; font-size: 14px; font-weight: 600; }
        .field input {
            width: 100%; padding: 13px 14px; border-radius: 14px;
            border: 1px solid rgba(255,255,255,0.12); background: rgba(255,255,255,0.08);
            color: white; outline: none; font-size: 14px;
        }
        .field input::placeholder { color: #94a3b8; }
        .btn {
            width: 100%; padding: 13px; border: none; border-radius: 14px;
            cursor: pointer; font-weight: 600; font-size: 14px; margin-top: 8px;
            background: linear-gradient(135deg, #3b82f6, #8b5cf6); color: white;
        }
        .bottom-text { text-align: center; margin-top: 16px; color: #cbd5e1; font-size: 14px; }
        .bottom-text a { color: #93c5fd; text-decoration: none; }
    </style>
</head>
<body>
<div class="page-wrap">
    <div class="glass-card">
        <div class="badge">👩‍🏫</div>
        <h2>Trainer Login</h2>
        <p class="subtitle">Login to access your trainer dashboard and manage your records.</p>

        <c:if test="${not empty msg}">
            <div class="msg">${msg}</div>
        </c:if>

        <form action="/trainer/login" method="post">
            <div class="field">
                <label>Email</label>
                <input type="email" name="email" placeholder="Enter email address" required>
            </div>

            <div class="field">
                <label>Password</label>
                <input type="password" name="password" placeholder="Enter password" required>
            </div>

            <button class="btn" type="submit">Login</button>
        </form>

        <div class="bottom-text">
            Don’t have an account? <a href="/trainer/register">Register here</a>
        </div>
    </div>
</div>
</body>
</html>