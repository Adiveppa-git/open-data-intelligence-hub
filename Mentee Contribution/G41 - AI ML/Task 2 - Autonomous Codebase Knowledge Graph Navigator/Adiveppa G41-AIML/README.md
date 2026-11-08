# Adiveppa G41-AIML

## AI/ML Internship Project

This repository contains my AI/ML internship project work and contributions.

---

# Task 2: Autonomous Codebase Knowledge Graph Navigator

## Project Overview

The **Autonomous Codebase Knowledge Graph Navigator** is an AI-assisted architecture analysis application designed to help developers understand software architecture, explore dependencies, identify circular dependencies, and assess the potential impact of architectural changes.

The application combines a Python-based graph analysis backend with a React-based interactive dashboard.

It allows users to ask architecture-related questions in natural language and receive structured analysis reports.

## Objectives

- Understand relationships between architecture components.
- Identify direct and indirect dependencies.
- Analyze the blast radius of architectural components.
- Detect circular dependencies.
- Explore architectural coupling and potential risks.
- Generate structured architecture analysis reports.
- Provide an interactive dashboard for architecture exploration.

## Technologies Used

| Category | Technologies |
|---|---|
| Programming Language | Python, JavaScript |
| Backend | FastAPI |
| Frontend | React.js |
| Frontend Build Tool | Vite |
| Graph Analysis | NetworkX |
| API Communication | REST API |
| Data Format | JSON |
| Styling | CSS |
| Testing | Pytest |

## System Architecture

The project consists of the following components:

### 1. Graph Analysis Backend

The backend represents architecture components and their dependencies using a graph structure.

It supports:
- Architecture graph exploration
- Dependency analysis
- Circular dependency detection
- Blast-radius analysis
- Component information retrieval

### 2. Natural Language Architecture Navigator

Users can submit questions such as:

- What is the blast radius of `legacy-auth-module`?
- Which circular dependencies exist?
- Which services depend on `order-service`?
- What happens if a component is deprecated?

The navigator processes the query and returns an architecture analysis report using the existing graph analysis backend.

### 3. React Dashboard

The frontend provides an interactive architecture assistant interface.

Features include:
- Architecture dashboard
- AI Architecture Chat interface
- Natural-language question input
- Blast-radius analysis
- Circular dependency exploration
- Architecture component browsing
- Analysis report display
- Suggested architecture questions
- Report history
- Copy and Markdown download options
- Responsive interface

## Key Features

### Architecture Graph Analysis

The system uses a sample architecture graph containing components and relationships.

Current sample graph:
- 22 nodes
- 35 relationships
- 7 node categories

### Blast-Radius Analysis

The system identifies components affected by changes to a selected architecture component.

Example:

For `legacy-auth-module`, the sample graph reports:
- 15 downstream affected components
- 5 direct dependents
- 10 indirect dependents

These values are based on the demonstration graph.

### Circular Dependency Detection

The graph analysis identifies circular dependency patterns.

Example cycles in the sample architecture:

1. `inventory-service → order-service → inventory-service`
2. `inventory-service → order-service → route-inventory-reserve → inventory-service`

### Natural-Language Architecture Chat

The chat interface allows users to ask questions about architecture dependencies and risks.

It sends queries to the FastAPI backend and displays the returned analysis report.

### Architecture Reports

The application generates structured reports containing architecture analysis results, affected components, and relevant findings.

## Project Structure

```text
Task 2 - Autonomous Codebase Knowledge Graph Navigator/
│
├── data/
│   └── mock_graph_seed.json
│
├── src/
│   ├── api/
│   │   └── app.py
│   ├── agent/
│   │   └── navigator.py
│   ├── graph/
│   ├── tools/
│   └── cli.py
│
├── tests/
│
├── frontend/
│   ├── src/
│   │   ├── App.jsx
│   │   ├── api.js
│   │   ├── main.jsx
│   │   └── styles.css
│   ├── index.html
│   ├── package.json
│   └── vite.config.js
│
├── README.md
└── requirements.txt
```

*The structure above summarizes the main project components.*

## Installation and Setup

### Prerequisites

- Python 3.10+
- Node.js and npm

### Backend Setup

Navigate to the project directory:

```bash
cd "Task 2 - Autonomous Codebase Knowledge Graph Navigator"
```

Install Python dependencies:

```bash
pip install -r requirements.txt
```

Start the backend:

```bash
python -m uvicorn src.api.app:app --reload
```

Backend API:

```text
http://127.0.0.1:8000
```

API documentation:

```text
http://127.0.0.1:8000/docs
```

### Frontend Setup

Open another terminal:

```bash
cd frontend
```

Install dependencies:

```bash
npm install
```

Start the frontend:

```bash
npm run dev
```

Frontend:

```text
http://localhost:5173
```

Ensure the backend is running before using architecture analysis features.

## API Endpoints

| Endpoint | Purpose |
|---|---|
| `GET /health` | Check backend health |
| `GET /schema` | Retrieve graph schema information |
| `GET /nodes` | List architecture nodes |
| `GET /nodes/{node_id}` | Retrieve component details |
| `GET /cycles` | Detect circular dependencies |
| `POST /blast-radius` | Analyze component blast radius |
| `POST /navigate` | Process natural-language architecture queries |

## Testing and Validation

The project has undergone backend and frontend validation.

Completed checks include:
- Backend API testing
- Graph analysis testing
- Blast-radius verification
- Circular dependency verification
- Natural-language navigation testing
- Frontend production build
- API communication verification

The backend test suite previously reported **63 passing tests**. Additional targeted API tests reported **8 passing tests**.

The frontend production build completed successfully using:

```bash
npm run build
```

## Current Implementation Status

**Important:** This project currently uses a local mock architecture graph for demonstration and analysis.

The current implementation includes:
- NetworkX-based graph analysis
- Deterministic natural-language query processing
- Generated Cypher query representations
- A local JSON-RPC-style tool adapter
- FastAPI endpoints
- React frontend integration

The current version does **not** execute queries against a live Neo4j database and does not include a fully integrated external LLM or official MCP server connection.

These integrations remain potential future enhancements.

## Future Enhancements

- Integrate a real Neo4j architecture database.
- Implement an official MCP server and tool integration.
- Add LLM-powered natural-language reasoning.
- Improve architecture graph visualization.
- Support importing real codebase architecture data.
- Enhance dependency and risk analysis.
- Add automated architecture recommendations.

## Conclusion

The Autonomous Codebase Knowledge Graph Navigator demonstrates how graph-based architecture analysis, backend APIs, and an interactive frontend can be combined to explore software dependencies and architectural risks.

The project provides a foundation for developing more advanced AI-driven architecture intelligence tools.

---

**Developed as part of my AI/ML internship project work.**
