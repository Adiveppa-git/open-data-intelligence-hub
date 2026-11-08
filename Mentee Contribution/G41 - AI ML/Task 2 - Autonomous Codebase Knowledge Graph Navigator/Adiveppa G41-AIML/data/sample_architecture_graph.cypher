// ==============================================================================
// Autonomous Codebase Knowledge Graph Navigator
// Enterprise Microservice Architecture Seed Script
// Source: Mentee Contribution/G41 - AI ML/Task 2 - Autonomous Codebase Knowledge Graph Navigator/data/mock_graph_seed.json
// ==============================================================================

// ------------------------------------------------------------------------------
// 1. Create Constraints / Indexes
// ------------------------------------------------------------------------------
CREATE CONSTRAINT unique_component_id IF NOT EXISTS FOR (c:Component) REQUIRE c.id IS UNIQUE;

// ------------------------------------------------------------------------------
// 2. Create Nodes
// ------------------------------------------------------------------------------

// Frontend Components
CREATE (:FrontendComponent:Component {
  id: 'web-portal',
  name: 'Web Checkout Portal',
  type: 'Frontend component',
  framework: 'React',
  description: 'Customer-facing web ecommerce storefront application.'
});

CREATE (:FrontendComponent:Component {
  id: 'mobile-app',
  name: 'Mobile Shopping App',
  type: 'Frontend component',
  framework: 'Flutter',
  description: 'iOS and Android customer shopping application.'
});

CREATE (:FrontendComponent:Component {
  id: 'admin-console',
  name: 'Backoffice Admin Console',
  type: 'Frontend component',
  framework: 'Vue.js',
  description: 'Operations and administration management dashboard.'
});

// API Gateways
CREATE (:ApiGateway:Component {
  id: 'edge-api-gateway',
  name: 'Edge API Gateway',
  type: 'API gateway',
  language: 'Go',
  description: 'Central reverse proxy routing client traffic and handling edge rate limiting.'
});

// API Routes
CREATE (:ApiRoute:Component {
  id: 'route-auth-login',
  name: '/api/v1/auth/login',
  type: 'API route',
  method: 'POST',
  description: 'User login endpoint issuing session authentication tokens.'
});

CREATE (:ApiRoute:Component {
  id: 'route-auth-verify',
  name: '/api/v1/auth/verify',
  type: 'API route',
  method: 'POST',
  description: 'Internal token verification route invoked to validate credentials.'
});

CREATE (:ApiRoute:Component {
  id: 'route-orders-checkout',
  name: '/api/v1/orders/checkout',
  type: 'API route',
  method: 'POST',
  description: 'Checkout endpoint orchestrating order placement and billing.'
});

CREATE (:ApiRoute:Component {
  id: 'route-payments-charge',
  name: '/api/v1/payments/charge',
  type: 'API route',
  method: 'POST',
  description: 'Payment processing endpoint handling credit card charges.'
});

CREATE (:ApiRoute:Component {
  id: 'route-inventory-reserve',
  name: '/api/v1/inventory/reserve',
  type: 'API route',
  method: 'POST',
  description: 'Stock reservation endpoint holding items during order processing.'
});

CREATE (:ApiRoute:Component {
  id: 'route-user-profile',
  name: '/api/v1/users/profile',
  type: 'API route',
  method: 'GET',
  description: 'Customer profile and address retrieval endpoint.'
});

// Microservices
CREATE (:Microservice:Component {
  id: 'auth-service',
  name: 'Authentication Service',
  type: 'Microservice',
  language: 'Python',
  description: 'Core authentication microservice handling session state and token validation.'
});

CREATE (:Microservice:Component {
  id: 'order-service',
  name: 'Order Service',
  type: 'Microservice',
  language: 'Python',
  description: 'Manages shopping carts, order status, and checkout workflows.'
});

CREATE (:Microservice:Component {
  id: 'payment-service',
  name: 'Payment Service',
  type: 'Microservice',
  language: 'Java',
  description: 'Handles payment transactions, invoicing, and gateway integrations.'
});

CREATE (:Microservice:Component {
  id: 'inventory-service',
  name: 'Inventory Service',
  type: 'Microservice',
  language: 'Go',
  description: 'Tracks warehouse stock quantities, allocations, and restocks.'
});

CREATE (:Microservice:Component {
  id: 'user-service',
  name: 'User Service',
  type: 'Microservice',
  language: 'Python',
  description: 'Manages user account records, personal data, and preferences.'
});

CREATE (:Microservice:Component {
  id: 'notification-service',
  name: 'Notification Service',
  type: 'Microservice',
  language: 'Node.js',
  description: 'Dispatches transactional emails, SMS notifications, and push alerts.'
});

// Shared Modules
CREATE (:SharedModule:Component {
  id: 'legacy-auth-module',
  name: 'Legacy Auth Module',
  type: 'Shared module',
  status: 'deprecated',
  description: 'Deprecated shared token verification and cryptographic utility library.'
});

CREATE (:SharedModule:Component {
  id: 'common-logger-lib',
  name: 'Common Logging Library',
  type: 'Shared module',
  status: 'active',
  description: 'Shared JSON structured logging and distributed tracing library.'
});

// Databases
CREATE (:Database:Component {
  id: 'shared-customer-db',
  name: 'Shared Customer PostgreSQL DB',
  type: 'Database',
  engine: 'PostgreSQL',
  description: 'Relational database storing user credentials, profiles, and billing records.'
});

CREATE (:Database:Component {
  id: 'order-document-db',
  name: 'Order Document Database',
  type: 'Database',
  engine: 'MongoDB',
  description: 'NoSQL document store holding customer purchase orders.'
});

CREATE (:Database:Component {
  id: 'inventory-sql-db',
  name: 'Inventory SQL Database',
  type: 'Database',
  engine: 'PostgreSQL',
  description: 'Relational database maintaining stock levels and SKU metadata.'
});

// Caches
CREATE (:Cache:Component {
  id: 'shared-session-cache',
  name: 'Shared Redis Session Cache',
  type: 'Cache',
  engine: 'Redis',
  description: 'Distributed in-memory cache holding active user authentication sessions.'
});

// ------------------------------------------------------------------------------
// 3. Create Relationships
// ------------------------------------------------------------------------------

// Frontend Component API Calls
MATCH (s:Component {id: 'web-portal'}), (t:Component {id: 'route-orders-checkout'}) CREATE (s)-[:CALLS]->(t);
MATCH (s:Component {id: 'web-portal'}), (t:Component {id: 'route-auth-login'}) CREATE (s)-[:CALLS]->(t);
MATCH (s:Component {id: 'mobile-app'}), (t:Component {id: 'route-orders-checkout'}) CREATE (s)-[:CALLS]->(t);
MATCH (s:Component {id: 'mobile-app'}), (t:Component {id: 'route-auth-login'}) CREATE (s)-[:CALLS]->(t);
MATCH (s:Component {id: 'admin-console'}), (t:Component {id: 'route-user-profile'}) CREATE (s)-[:CALLS]->(t);

// API Gateway Dependencies
MATCH (s:Component {id: 'edge-api-gateway'}), (t:Component {id: 'route-auth-login'}) CREATE (s)-[:DEPENDS_ON]->(t);
MATCH (s:Component {id: 'edge-api-gateway'}), (t:Component {id: 'route-auth-verify'}) CREATE (s)-[:DEPENDS_ON]->(t);
MATCH (s:Component {id: 'edge-api-gateway'}), (t:Component {id: 'route-orders-checkout'}) CREATE (s)-[:DEPENDS_ON]->(t);
MATCH (s:Component {id: 'edge-api-gateway'}), (t:Component {id: 'route-payments-charge'}) CREATE (s)-[:DEPENDS_ON]->(t);
MATCH (s:Component {id: 'edge-api-gateway'}), (t:Component {id: 'route-user-profile'}) CREATE (s)-[:DEPENDS_ON]->(t);
MATCH (s:Component {id: 'edge-api-gateway'}), (t:Component {id: 'legacy-auth-module'}) CREATE (s)-[:AUTHENTICATES_WITH]->(t);

// API Routes to Microservices
MATCH (s:Component {id: 'route-auth-login'}), (t:Component {id: 'auth-service'}) CREATE (s)-[:DEPENDS_ON]->(t);
MATCH (s:Component {id: 'route-auth-verify'}), (t:Component {id: 'auth-service'}) CREATE (s)-[:DEPENDS_ON]->(t);
MATCH (s:Component {id: 'route-orders-checkout'}), (t:Component {id: 'order-service'}) CREATE (s)-[:DEPENDS_ON]->(t);
MATCH (s:Component {id: 'route-payments-charge'}), (t:Component {id: 'payment-service'}) CREATE (s)-[:DEPENDS_ON]->(t);
MATCH (s:Component {id: 'route-inventory-reserve'}), (t:Component {id: 'inventory-service'}) CREATE (s)-[:DEPENDS_ON]->(t);
MATCH (s:Component {id: 'route-user-profile'}), (t:Component {id: 'user-service'}) CREATE (s)-[:DEPENDS_ON]->(t);

// Microservices using Legacy Auth Module
MATCH (s:Component {id: 'auth-service'}), (t:Component {id: 'legacy-auth-module'}) CREATE (s)-[:USES]->(t);
MATCH (s:Component {id: 'user-service'}), (t:Component {id: 'legacy-auth-module'}) CREATE (s)-[:USES]->(t);
MATCH (s:Component {id: 'payment-service'}), (t:Component {id: 'legacy-auth-module'}) CREATE (s)-[:AUTHENTICATES_WITH]->(t);
MATCH (s:Component {id: 'order-service'}), (t:Component {id: 'legacy-auth-module'}) CREATE (s)-[:AUTHENTICATES_WITH]->(t);

// Inter-Service Dependencies & Calls
MATCH (s:Component {id: 'order-service'}), (t:Component {id: 'route-payments-charge'}) CREATE (s)-[:CALLS]->(t);
MATCH (s:Component {id: 'order-service'}), (t:Component {id: 'route-inventory-reserve'}) CREATE (s)-[:CALLS]->(t);
MATCH (s:Component {id: 'order-service'}), (t:Component {id: 'inventory-service'}) CREATE (s)-[:DEPENDS_ON]->(t);
MATCH (s:Component {id: 'inventory-service'}), (t:Component {id: 'order-service'}) CREATE (s)-[:DEPENDS_ON]->(t);
MATCH (s:Component {id: 'order-service'}), (t:Component {id: 'notification-service'}) CREATE (s)-[:DEPENDS_ON]->(t);

// Database and Cache Storage Connections
MATCH (s:Component {id: 'auth-service'}), (t:Component {id: 'shared-customer-db'}) CREATE (s)-[:CONNECTS_TO]->(t);
MATCH (s:Component {id: 'user-service'}), (t:Component {id: 'shared-customer-db'}) CREATE (s)-[:CONNECTS_TO]->(t);
MATCH (s:Component {id: 'auth-service'}), (t:Component {id: 'shared-session-cache'}) CREATE (s)-[:CONNECTS_TO]->(t);
MATCH (s:Component {id: 'order-service'}), (t:Component {id: 'shared-session-cache'}) CREATE (s)-[:CONNECTS_TO]->(t);
MATCH (s:Component {id: 'order-service'}), (t:Component {id: 'order-document-db'}) CREATE (s)-[:CONNECTS_TO]->(t);
MATCH (s:Component {id: 'inventory-service'}), (t:Component {id: 'inventory-sql-db'}) CREATE (s)-[:CONNECTS_TO]->(t);

// Common Library Usages
MATCH (s:Component {id: 'order-service'}), (t:Component {id: 'common-logger-lib'}) CREATE (s)-[:USES]->(t);
MATCH (s:Component {id: 'payment-service'}), (t:Component {id: 'common-logger-lib'}) CREATE (s)-[:USES]->(t);
MATCH (s:Component {id: 'inventory-service'}), (t:Component {id: 'common-logger-lib'}) CREATE (s)-[:USES]->(t);

