<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Student</title>
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
		        max-width: 430px;
		        background: rgba(255,255,255,0.08);
		        border: 1px solid rgba(255,255,255,0.12);
		        border-radius: 24px;
		        padding: 30px;
		        backdrop-filter: blur(16px);
		        -webkit-backdrop-filter: blur(16px);
		        box-shadow: 0 20px 45px rgba(0,0,0,0.28);
		    }

		    .glass-wide {
		        max-width: 1150px;
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

		    h1, h2, h3 {
		        color: #ffffff;
		        margin-bottom: 10px;
		    }

		    .subtitle {
		        color: #cbd5e1;
		        font-size: 14px;
		        line-height: 1.7;
		        margin-bottom: 22px;
		    }

		    .msg {
		        margin-bottom: 16px;
		        padding: 12px;
		        border-radius: 12px;
		        background: rgba(239,68,68,0.14);
		        border: 1px solid rgba(239,68,68,0.25);
		        color: #fecaca;
		        text-align: center;
		        font-size: 14px;
		    }

		    .field {
		        margin-bottom: 14px;
		    }

		    .field label {
		        display: block;
		        margin-bottom: 6px;
		        color: #e2e8f0;
		        font-size: 14px;
		        font-weight: 600;
		    }

		    .field input,
		    .field select {
		        width: 100%;
		        padding: 13px 14px;
		        border-radius: 14px;
		        border: 1px solid rgba(255,255,255,0.12);
		        background: rgba(255,255,255,0.08);
		        color: white;
		        outline: none;
		        font-size: 14px;
		    }

		    .field input::placeholder {
		        color: #94a3b8;
		    }

		    .field input:focus,
		    .field select:focus {
		        border-color: rgba(96,165,250,0.65);
		        box-shadow: 0 0 0 4px rgba(59,130,246,0.18);
		    }

		    .readonly {
		        background: rgba(255,255,255,0.14) !important;
		        color: #cbd5e1;
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
		    }

		    .btn-primary {
		        background: linear-gradient(135deg, #3b82f6, #8b5cf6);
		        color: white;
		    }

		    .btn-primary:hover {
		        transform: translateY(-1px);
		        box-shadow: 0 12px 24px rgba(59,130,246,0.28);
		    }

		    .btn-secondary {
		        background: rgba(255,255,255,0.1);
		        color: #e2e8f0;
		        border: 1px solid rgba(255,255,255,0.14);
		    }

		    .btn-danger {
		        background: linear-gradient(135deg, #ef4444, #dc2626);
		        color: white;
		    }

		    .grid {
		        display: grid;
		        grid-template-columns: repeat(2, 1fr);
		        gap: 20px;
		    }

		    .action-card {
		        background: rgba(255,255,255,0.08);
		        border: 1px solid rgba(255,255,255,0.12);
		        border-radius: 22px;
		        padding: 24px;
		    }

		    .action-card p {
		        color: #cbd5e1;
		        font-size: 14px;
		        line-height: 1.6;
		        margin-bottom: 16px;
		    }

		    .top-actions {
		        display: flex;
		        gap: 10px;
		        flex-wrap: wrap;
		        margin-bottom: 18px;
		    }

		    .table-wrap {
		        overflow-x: auto;
		        margin-top: 12px;
		    }

		    table {
		        width: 100%;
		        border-collapse: collapse;
		    }

		    th, td {
		        padding: 14px;
		        text-align: left;
		        border-bottom: 1px solid rgba(255,255,255,0.08);
		    }

		    th {
		        color: #93c5fd;
		        font-size: 14px;
		    }

		    td {
		        color: #e2e8f0;
		        font-size: 14px;
		    }

		    .pill {
		        display: inline-block;
		        padding: 6px 12px;
		        border-radius: 999px;
		        background: rgba(59,130,246,0.18);
		        color: #bfdbfe;
		        font-size: 12px;
		        font-weight: 600;
		    }

		    .detail-box {
		        background: rgba(255,255,255,0.08);
		        border: 1px solid rgba(255,255,255,0.12);
		        border-radius: 16px;
		        padding: 14px 16px;
		        margin-bottom: 12px;
		        color: #e2e8f0;
		        font-size: 15px;
		    }

		    .label {
		        color: #93c5fd;
		        font-weight: 700;
		    }

		    @media (max-width: 900px) {
		        .grid {
		            grid-template-columns: 1fr;
		        }
		    }
		</style>
</head>
<body>
<div class="page-wrap">
    <div class="glass-card">
        <div class="badge">🎓</div>
        <h2>Update Student</h2>
        <p class="subtitle">Edit student details and save changes in your portal.</p>

        <form action="/student/update" method="post">
            <div class="field">
                <label>ID</label>
                <input type="number" name="id" value="${student.id}" readonly class="readonly">
            </div>

            <div class="field">
                <label>Name</label>
                <input type="text" name="name" value="${student.name}" required>
            </div>

            <div class="field">
                <label>Subject</label>
                <select name="subject" required>
                    <option value="Java" ${student.subject=='Java'?'selected':''}>Java</option>
                    <option value="Python" ${student.subject=='Python'?'selected':''}>Python</option>
                    <option value="HTML" ${student.subject=='HTML'?'selected':''}>HTML</option>
                    <option value="SQL" ${student.subject=='SQL'?'selected':''}>SQL</option>
                </select>
            </div>
            
			<div class="field">
			    <label>Trainer</label>
			    <select name="trainerId" required>
			        <option value="">Select Trainer</option>
			        <c:forEach var="t" items="${trainers}">
			            <option value="${t.id}" ${student.trainer.id == t.id ? 'selected' : ''}>
			                ${t.name} - ${t.subject}
			            </option>
			        </c:forEach>
			    </select>
			</div>
			
            <div class="field">
                <label>Email</label>
                <input type="email" name="email" value="${student.email}" required>
            </div>

            <div class="field">
                <label>Password</label>
                <input type="password" name="password" value="${student.password}" required>
            </div>

            <button type="submit" class="btn btn-primary">Save Changes</button>
            <button type="button" class="btn btn-secondary" onclick="window.location.href='/student/dashboard'">Back</button>
        </form>
    </div>
</div>
</body>
</html>