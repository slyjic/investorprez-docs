# API Endpoint: [Endpoint Name]

**Method**: `[GET|POST|PUT|DELETE]`  
**URL**: `/api/[endpoint-path]`  
**Authentication**: [Required|Optional|None]  
**Version**: v[X.X.X]  
**Last Updated**: [Date]

## Description

Brief description of what this endpoint does.

## Request

### URL Parameters

```
/api/presentations/:presentationId/comments
```

- `presentationId` (string, required): UUID of the presentation

### Query Parameters

| Parameter | Type    | Required | Description                | Example          |
| --------- | ------- | -------- | -------------------------- | ---------------- |
| `page`    | integer | No       | Page number for pagination | `?page=1`        |
| `limit`   | integer | No       | Items per page (max 100)   | `?limit=20`      |
| `status`  | string  | No       | Filter by status           | `?status=active` |

### Headers

```http
Authorization: Bearer <jwt-token>
Content-Type: application/json
```

### Request Body

```json
{
  "title": "string (required)",
  "content": "string (optional)",
  "status": "active|inactive",
  "metadata": {
    "tags": ["string"],
    "category": "string"
  }
}
```

## Response

### Success Response

**Status Code**: `200 OK` | `201 Created` | `204 No Content`

```json
{
  "success": true,
  "data": {
    "id": "uuid",
    "title": "string",
    "content": "string",
    "status": "active",
    "createdAt": "2025-01-01T00:00:00.000Z",
    "updatedAt": "2025-01-01T00:00:00.000Z",
    "metadata": {
      "tags": ["tag1", "tag2"],
      "category": "category-name"
    }
  },
  "pagination": {
    "page": 1,
    "limit": 20,
    "total": 100,
    "totalPages": 5
  }
}
```

### Error Responses

#### 400 Bad Request

```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid request data",
    "details": [
      {
        "field": "title",
        "message": "Title is required"
      }
    ]
  }
}
```

#### 401 Unauthorized

```json
{
  "success": false,
  "error": {
    "code": "UNAUTHORIZED",
    "message": "Invalid or expired token"
  }
}
```

#### 403 Forbidden

```json
{
  "success": false,
  "error": {
    "code": "FORBIDDEN",
    "message": "Insufficient permissions"
  }
}
```

#### 404 Not Found

```json
{
  "success": false,
  "error": {
    "code": "NOT_FOUND",
    "message": "Resource not found"
  }
}
```

#### 500 Internal Server Error

```json
{
  "success": false,
  "error": {
    "code": "INTERNAL_ERROR",
    "message": "An unexpected error occurred"
  }
}
```

## Authentication & Authorization

### Required Permissions

- **Read**: User must have access to the resource
- **Write**: User must be owner or have editor permissions
- **Admin**: Admin-only endpoint

### Token Requirements

- Valid JWT token in Authorization header
- Token must not be expired
- User must exist and be active

## Rate Limiting

- **Limit**: 100 requests per 15 minutes per user
- **Headers Returned**:
  - `X-RateLimit-Limit`: Maximum requests allowed
  - `X-RateLimit-Remaining`: Requests remaining
  - `X-RateLimit-Reset`: Time when limit resets (Unix timestamp)

## Database Operations

### Tables Affected

- `table_name`: Description of operations (SELECT, INSERT, UPDATE, DELETE)
- `related_table`: Description of related operations

### SQL Queries

```sql
-- Example query structure (sanitized)
SELECT id, title, status FROM table_name
WHERE user_id = $1 AND status = $2
ORDER BY created_at DESC
LIMIT $3 OFFSET $4;
```

## Business Logic

1. **Validation**: Describe validation rules
2. **Processing**: Describe main processing steps
3. **Side Effects**: Describe any side effects (emails, notifications, etc.)
4. **Cleanup**: Describe any cleanup operations

## Implementation Details

### File Location

- **Route**: `/backend/src/routes/[route-name].js`
- **Controller**: `/backend/src/controllers/[controller-name].js`
- **Service**: `/backend/src/services/[service-name].js`
- **Middleware**: List relevant middleware

### Dependencies

- External APIs called
- Third-party services used
- Internal services referenced

## Testing

### Test Files

- `/backend/src/routes/__tests__/[route-name].test.js`
- `/src/services/__tests__/[service-name].test.ts`

### Test Scenarios

- [ ] Successful request with valid data
- [ ] Request with invalid data (400)
- [ ] Unauthorized request (401)
- [ ] Forbidden request (403)
- [ ] Resource not found (404)
- [ ] Rate limiting (429)
- [ ] Server error handling (500)

## Example Usage

### cURL

```bash
curl -X POST \
  https://api.investorprez.com/api/endpoint \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Example Title",
    "content": "Example content"
  }'
```

### JavaScript (Frontend)

```javascript
const response = await apiService.post("/endpoint", {
  title: "Example Title",
  content: "Example content",
});

if (response.success) {
  console.log("Created:", response.data);
} else {
  console.error("Error:", response.error);
}
```

## Changelog

### v[X.X.X] - [Date]

- Initial endpoint implementation
- Added new parameters
- Fixed security issues
- Performance improvements

## Related Endpoints

- `GET /api/related-endpoint` - Description
- `POST /api/related-endpoint` - Description

## Notes

- Any special considerations
- Known limitations
- Future improvements planned
