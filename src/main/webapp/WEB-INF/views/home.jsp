<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Learning Management System</title>
    <meta charset="UTF-8">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Segoe UI", Arial, sans-serif;
        }

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
            max-width: 1100px;
            background: rgba(255,255,255,0.08);
            border: 1px solid rgba(255,255,255,0.12);
            border-radius: 28px;
            padding: 40px;
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            box-shadow: 0 20px 45px rgba(0,0,0,0.28);
        }

        .hero {
            display: grid;
            grid-template-columns: 1.2fr 1fr;
            gap: 28px;
            align-items: center;
        }

        .badge {
            width: 72px;
            height: 72px;
            border-radius: 20px;
            background: rgba(255,255,255,0.12);
            border: 1px solid rgba(255,255,255,0.12);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 30px;
            margin-bottom: 18px;
        }

        h1 {
            font-size: 44px;
            margin-bottom: 12px;
            color: white;
        }

        .subtitle {
            color: #cbd5e1;
            font-size: 16px;
            line-height: 1.8;
            max-width: 520px;
        }

        .roles {
            display: grid;
            gap: 18px;
        }

        .role-card {
            background: rgba(255,255,255,0.08);
            border: 1px solid rgba(255,255,255,0.12);
            border-radius: 22px;
            padding: 22px;
        }

        .role-card h3 {
            color: white;
            margin-bottom: 8px;
            font-size: 24px;
        }

        .role-card p {
            color: #cbd5e1;
            font-size: 14px;
            line-height: 1.7;
            margin-bottom: 14px;
        }

        .btn {
            width: 100%;
            padding: 13px;
            border: none;
            border-radius: 14px;
            cursor: pointer;
            font-weight: 600;
            font-size: 14px;
            transition: 0.25s ease;
            margin-top: 8px;
            background: linear-gradient(135deg, #3b82f6, #8b5cf6);
            color: white;
        }

        .btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 12px 24px rgba(59,130,246,0.28);
        }

        @media (max-width: 900px) {
            .hero {
                grid-template-columns: 1fr;
            }

            h1 {
                font-size: 34px;
            }
        }
    </style>
</head>
<body>
<div class="page-wrap">
    <div class="glass-card">
        <div class="hero">
            <div>
                <div class="badge">LMS</div>
                <h1>Learning Management System</h1>
                <p class="subtitle">
                    A modern portal for students and trainers to register, login, manage profiles,
                    update records, and access learning information through one unified platform.
                </p>
            </div>

            <div class="roles">
                <div class="role-card">
                    <h3>Student Portal</h3>
                    <p>Register, login, update your details, and access student records in a clean dashboard.</p>
                    <form action="/student/register" method="get">
                        <button class="btn" type="submit">Continue as Student</button>
                    </form>
                </div>

                <div class="role-card">
                    <h3>Trainer Portal</h3>
                    <p>Register, login, update your profile, and manage trainer information from one place.</p>
                    <form action="/trainer/register" method="get">
                        <button class="btn" type="submit">Continue as Trainer</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>