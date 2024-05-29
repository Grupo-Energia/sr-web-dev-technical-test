# Sample API Documentation

## API de Veículos
- **GET /api/vehicles**: Get a list of all vehicles.
- **POST /api/vehicles**: Create a new vehicle.
- **GET /api/vehicles/:id**: Get details of a specific vehicle.
- **PUT /api/vehicles/:id**: Update a specific vehicle.
- **DELETE /api/vehicles/:id**: Delete a specific vehicle.

## API de Pneus
- **GET /api/vehicles/:vehicleId/tires**: Get a list of all tires for a specific vehicle.
- **POST /api/vehicles/:vehicleId/tires**: Create a new tire for a specific vehicle.
- **PUT /api/vehicles/:vehicleId/tires/:id**: Update a specific tire.
- **DELETE /api/vehicles/:vehicleId/tires/:id**: Delete a specific tire.

## API de Manutenção
- **GET /api/vehicles/:vehicleId/maintenance**: Get a list of all maintenance records for a specific vehicle.
- **POST /api/vehicles/:vehicleId/maintenance**: Create a new maintenance record for a specific vehicle.
- **PUT /api/vehicles/:vehicleId/maintenance/:id**: Update a specific maintenance record.
- **DELETE /api/vehicles/:vehicleId/maintenance/:id**: Delete a specific maintenance record.

## API de Usuários
- **POST /api/users/register**: Register a new user.
- **POST /api/users/login**: Login a user.
- **GET /api/users/me**: Get the current user's details (authentication required).
