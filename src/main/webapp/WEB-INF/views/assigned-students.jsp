<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>LMS | Assigned Students</title>
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
            border-radius: 24px;
            padding: 30px;
            backdrop-filter: blur(16px);
            box-shadow: 0 20px 45px rgba(0,0,0,0.28);
        }

        .badge {
            width: 64px;
            height: 64px;
            border-radius: 18px;
            background: rgba(255,255,255,0.12);
            border: 1px solid rgba(255,255,255,0.12);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 26px;
            margin-bottom: 18px;
        }

        h1 {
            color: white;
            margin-bottom: 10px;
        }

        .subtitle {
            color: #cbd5e1;
            font-size: 14px;
            margin-bottom: 20px;
        }

        .top-actions {
            margin-bottom: 20px;
        }

        .btn {
            padding: 10px 16px;
            border: none;
            border-radius: 14px;
            cursor: pointer;
            font-weight: 600;
            background: rgba(255,255,255,0.1);
            color: #e2e8f0;
            border: 1px solid rgba(255,255,255,0.14);
        }

        .table-wrap {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

		.table-wrap {
		    width: 100%;
		    overflow-x: auto;
		}

		table {
		    width: 100%;
		    border-collapse: collapse;
		    table-layout: fixed; 
		}

		th, td {
		    padding: 14px;
		    text-align: center;
		    word-wrap: break-word;
		}

		th {
		    color: #93c5fd;
		    font-weight: 600;
		}

		td {
		    color: #e2e8f0;
		}

		th:nth-child(1), td:nth-child(1) { width: 10%; }
		th:nth-child(2), td:nth-child(2) { width: 25%; }
		th:nth-child(3), td:nth-child(3) { width: 20%; }
		th:nth-child(4), td:nth-child(4) { width: 45%; }

        .pill {
            padding: 6px 12px;
            border-radius: 999px;
            background: rgba(59,130,246,0.18);
            color: #bfdbfe;
            font-size: 12px;
        }

        .empty {
            text-align: center;
            padding: 20px;
            color: #94a3b8;
        }

    </style>
</head>

<body>

<div class="page-wrap">
    <div class="glass-card">

        <div class="badge">👩‍🏫</div>

        <h1>Assigned Students</h1>

        <p class="subtitle">
            Trainer: <b>${trainer.name}</b> | Subject: ${trainer.subject}
        </p>

        <div class="top-actions">
            <button class="btn"
                onclick="window.location.href='/trainer/dashboard'">
                Back to Dashboard
            </button>
        </div>

        <div class="table-wrap">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Subject</th>
                        <th>Email</th>
                    </tr>
                </thead>

                <tbody>

                    <c:forEach var="s" items="${students}">
                        <tr>
                            <td>${s.id}</td>
                            <td>${s.name}</td>
                            <td><span class="pill">${s.subject}</span></td>
                            <td>${s.email}</td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty students}">
                        <tr>
                            <td colspan="4" class="empty">
                                No students assigned to this trainer
                            </td>
                        </tr>
                    </c:if>

                </tbody>
            </table>
        </div>

    </div>
</div>

</body>
</html>