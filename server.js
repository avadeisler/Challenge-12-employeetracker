const express = require('express');
// Import and require mysql2
const mysql = require('mysql2');

const PORT = process.env.PORT || 3001;
const app = express();

// Express middleware
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

// Connect to database
const db = mysql.createConnection(
  {
    host: 'localhost',
    // MySQL username, password, database
    user: 'root',
    password: '',
    database: 'employeetracker_db'
  },
  console.log(`Connected to the employeetracker_db database.`)
);

// Create an employee
app.post('/api/new-department', ({ body }, res) => {
  const sql = `INSERT INTO department (department_name)
    VALUES (?)`;
  const params = [body.department_name];
  
  db.query(sql, params, (err, result) => {
    if (err) {
      res.status(400).json({ error: err.message });
      return;
    }
    res.json({
      message: 'success',
      data: body
    });
  });
});

// Delete an employee
app.delete('/api/department/:id', (req, res) => {
  const sql = `DELETE FROM department WHERE id = ?`;
  const params = [req.params.id];
  
  db.query(sql, params, (err, result) => {
    if (err) {
      res.statusMessage(400).json({ error: res.message });
    } else if (!result.affectedRows) {
      res.json({
      message: 'department not found'
      });
    } else {
      res.json({
        message: 'deleted',
        changes: result.affectedRows,
        id: req.params.id
      });
    }
  });
});

// Read all department
app.get('/api/department', (req, res) => {
  const sql = `SELECT id, department_name AS name FROM department`;
  
  db.query(sql, (err, rows) => {
    if (err) {
      res.status(500).json({ error: err.message });
       return;
    }
    res.json({
      message: 'success',
      data: rows
    });
  });
});


// Read list of all roles and associated employee name using LEFT JOIN
app.get('/api/department-role', (req, res) => {
  const sql = `SELECT department.department_name AS department, role.role FROM role LEFT JOIN department ON role.department_id = department.id ORDER BY department.department_name;`;
  db.query(sql, (err, rows) => {
    if (err) {
      res.status(500).json({ error: err.message });
      return;
    }
    res.json({
      message: 'success',
      data: rows
    });
  });
});

// Default response for any other request (Not Found)
app.use((req, res) => {
  res.status(404).end();
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
