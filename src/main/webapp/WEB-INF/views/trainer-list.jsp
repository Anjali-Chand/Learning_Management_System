<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>All Trainers</title>
    <meta charset="UTF-8">
    <style>
        * {
            margin: 0; padding: 0; box-sizing: border-box; font-family: "Segoe UI", Arial, sans-serif;
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
            min-height: 100vh; display: flex; justify-content: center; align-items: center; padding: 30px;
        }
        .glass-card {
            width: 100%; max-width: 1150px; background: rgba(255,255,255,0.08);
            border: 1px solid rgba(255,255,255,0.12); border-radius: 24px; padding: 30px;
            backdrop-filter: blur(16px); box-shadow: 0 20px 45px rgba(0,0,0,0.28);
        }
        .badge {
            width: 64px; height: 64px; border-radius: 18px; background: rgba(255,255,255,0.12);
            border: 1px solid rgba(255,255,255,0.12); display: flex; align-items: center; justify-content: center;
            font-size: 26px; margin-bottom: 18px;
        }
        h1 { color: white; margin-bottom: 10px; }
        .subtitle { color: #cbd5e1; font-size: 14px; line-height: 1.7; margin-bottom: 22px; }
        .top-actions { display: flex; gap: 10px; flex-wrap: wrap; margin-bottom: 18px; }
        .btn {
            padding: 10px 16px; border: none; border-radius: 14px; cursor: pointer; font-weight: 600; font-size: 14px;
        }
        .btn-primary { background: linear-gradient(135deg, #3b82f6, #8b5cf6); color: white; }
        .btn-secondary { background: rgba(255,255,255,0.1); color: #e2e8f0; border: 1px solid rgba(255,255,255,0.14); }
        .btn-danger { background: linear-gradient(135deg, #ef4444, #dc2626); color: white; }
        .table-wrap { overflow-x: auto; margin-top: 12px; }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 14px; text-align: left; border-bottom: 1px solid rgba(255,255,255,0.08); }
        th { color: #93c5fd; font-size: 14px; }
        td { color: #e2e8f0; font-size: 14px; }
        .pill {
            display: inline-block; padding: 6px 12px; border-radius: 999px;
            background: rgba(59,130,246,0.18); color: #bfdbfe; font-size: 12px; font-weight: 600;
        }
    </style>
</head>
<body>
<div class="page-wrap">
    <div class="glass-card">
        <div class="badge">👩‍🏫</div>
        <h1>All Trainers</h1>
        <p class="subtitle">View and manage all registered trainers in one place.</p>

        <div class="top-actions">
            <button class="btn btn-secondary" onclick="window.location.href='/trainer/dashboard'">Back</button>
            <button class="btn btn-primary" onclick="window.location.href='/trainer/register'">Add Trainer</button>
        </div>

        <div class="table-wrap">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Subject</th>
						<th>Students</th>
                        <th>Email</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="t" items="${trainers}">
                        <tr>
                            <td>${t.id}</td>
                            <td>${t.name}</td>
                            <td><span class="pill">${t.subject}</span></td>
							<td>${t.students.size()}</td>
                            <td>${t.email}</td>
                            <td>
                                <form action="/trainer/fetchTrainer" method="post" style="display:inline;">
                                    <input type="hidden" name="id" value="${t.id}">
                                    <button type="submit" class="btn btn-secondary">View</button>
                                </form>

                                <form action="/trainer/update" method="get" style="display:inline;">
                                    <input type="hidden" name="id" value="${t.id}">
                                    <button type="submit" class="btn btn-primary">Update</button>
                                </form>

                                <form action="/trainer/deleteTrainer" method="post" style="display:inline;">
                                    <input type="hidden" name="id" value="${t.id}">
                                    <button type="submit" class="btn btn-danger">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>