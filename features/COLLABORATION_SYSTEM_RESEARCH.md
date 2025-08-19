# Collaboration & Commenting System - Research & Planning

_Last Updated: August 12, 2025_
_Status: Current - Documentation Standards Update_

**Date**: July 29, 2025  
**Status**: Research & Planning Phase  
**Priority**: High - User-Requested Feature

## Overview

Research and planning for a comprehensive collaboration system that allows multiple users to work together on presentations with commenting, role-based permissions, and real-time collaboration features.

## User Requirements Analysis

### 1. Slide Comments System

- **Feature**: Users can leave comments on specific slides
- **UI**: Comments panel showing list of pages/slides with their comments
- **Scope**: Slide-level commenting (not element-level to avoid previous complexity issues)

### 2. Collaborator Management

- **Feature**: "Collaborators" button next to Settings in editor header
- **Modal Features**:
  - Email invitation field for new collaborators
  - List of existing collaborators with status (pending/accepted/rejected)
  - Role assignment during invitation

### 3. Role-Based Permissions

- **Reviewers**: Comment-only access, no editing permissions
- **Editors**: Full editing access with optional owner-defined restrictions
- **Owner**: Full control including collaborator management

## Technical Architecture Research

### Database Schema Design

```sql
-- Collaborators table
CREATE TABLE collaborators (
    id SERIAL PRIMARY KEY,
    presentation_id INTEGER REFERENCES presentations(id) ON DELETE CASCADE,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    role ENUM('owner', 'editor', 'reviewer') NOT NULL,
    permissions JSON DEFAULT '{}', -- Custom permission overrides
    invited_by INTEGER REFERENCES users(id),
    invited_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pending', 'accepted', 'rejected') DEFAULT 'pending',
    accepted_at TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(presentation_id, user_id)
);

-- Slide comments table
CREATE TABLE slide_comments (
    id SERIAL PRIMARY KEY,
    presentation_id INTEGER REFERENCES presentations(id) ON DELETE CASCADE,
    slide_index INTEGER NOT NULL,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    status ENUM('open', 'resolved') DEFAULT 'open',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    resolved_by INTEGER REFERENCES users(id),
    resolved_at TIMESTAMP
);

-- Comment threads (replies to comments)
CREATE TABLE comment_replies (
    id SERIAL PRIMARY KEY,
    comment_id INTEGER REFERENCES slide_comments(id) ON DELETE CASCADE,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Collaboration invitations
CREATE TABLE collaboration_invitations (
    id SERIAL PRIMARY KEY,
    presentation_id INTEGER REFERENCES presentations(id) ON DELETE CASCADE,
    email VARCHAR(255) NOT NULL,
    role ENUM('editor', 'reviewer') NOT NULL,
    invited_by INTEGER REFERENCES users(id),
    token VARCHAR(255) UNIQUE NOT NULL,
    expires_at TIMESTAMP NOT NULL,
    status ENUM('pending', 'accepted', 'rejected', 'expired') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### API Endpoints Design

```typescript
// Collaborator Management
POST   /api/presentations/:id/collaborators/invite
GET    /api/presentations/:id/collaborators
PUT    /api/presentations/:id/collaborators/:userId/role
DELETE /api/presentations/:id/collaborators/:userId
POST   /api/collaborations/accept/:token
POST   /api/collaborations/reject/:token

// Comments System
GET    /api/presentations/:id/comments
POST   /api/presentations/:id/comments
PUT    /api/comments/:id
DELETE /api/comments/:id
POST   /api/comments/:id/replies
PUT    /api/comments/:id/resolve

// Real-time Collaboration
WebSocket /ws/presentations/:id/collaborate
```

### UI/UX Component Architecture

```typescript
// Main collaboration components
interface CollaborationComponents {
  // Header integration
  CollaboratorsButton: React.FC<{ presentationId: string }>;
  CollaboratorsModal: React.FC<{
    isOpen: boolean;
    onClose: () => void;
    presentationId: string;
  }>;

  // Comments system
  CommentsPanel: React.FC<{
    presentationId: string;
    slides: Slide[];
    currentSlide: number;
  }>;
  SlideCommentsList: React.FC<{
    comments: Comment[];
    slideIndex: number;
  }>;
  CommentThread: React.FC<{
    comment: Comment;
    replies: Reply[];
  }>;

  // Permission management
  PermissionGate: React.FC<{
    requiredRole: Role;
    children: React.ReactNode;
  }>;
}
```

## Implementation Strategy

### Phase 1: Foundation (Week 1-2)

**Goal**: Basic collaboration infrastructure

**Backend Tasks**:

- [ ] Database schema implementation
- [ ] Basic collaborator CRUD APIs
- [ ] Permission middleware system
- [ ] Email invitation service integration

**Frontend Tasks**:

- [ ] Collaborators button in editor header
- [ ] Basic collaborators modal
- [ ] Permission gate component
- [ ] Role-based UI conditionals

**Deliverables**:

- Users can invite collaborators via email
- Basic role assignment (editor/reviewer)
- Invitation acceptance flow

### Phase 2: Comments System (Week 3-4)

**Goal**: Slide-level commenting functionality

**Backend Tasks**:

- [ ] Comments API implementation
- [ ] Comment thread support
- [ ] Comment status management (open/resolved)
- [ ] Comment permissions enforcement

**Frontend Tasks**:

- [ ] Comments panel in editor sidebar
- [ ] Slide-specific comment lists
- [ ] Comment creation and editing
- [ ] Comment resolution workflow

**Deliverables**:

- Complete slide commenting system
- Comment threads and replies
- Comment status management

### Phase 3: Real-time Collaboration (Week 5-6)

**Goal**: Live collaboration features

**Backend Tasks**:

- [ ] WebSocket server setup
- [ ] Real-time comment updates
- [ ] Collaborative editing conflict resolution
- [ ] Live user presence indicators

**Frontend Tasks**:

- [ ] WebSocket client integration
- [ ] Real-time comment updates
- [ ] Live collaboration indicators
- [ ] Conflict resolution UI

**Deliverables**:

- Real-time comment updates
- Live collaboration presence
- Basic conflict resolution

### Phase 4: Advanced Features (Week 7-8)

**Goal**: Production-ready features

**Backend Tasks**:

- [ ] Advanced permission customization
- [ ] Notification system
- [ ] Collaboration analytics
- [ ] Performance optimization

**Frontend Tasks**:

- [ ] Advanced permission controls
- [ ] Notification system
- [ ] Collaboration history
- [ ] Mobile responsiveness

**Deliverables**:

- Custom permission controls
- Notification system
- Mobile-optimized collaboration

## Technical Research Findings

### Real-time Technology Options

#### Option 1: Socket.IO + Redis

```typescript
// Pros: Mature, reliable, auto-reconnection
// Cons: Additional Redis dependency
const io = new Server(server, {
  cors: { origin: process.env.FRONTEND_URL },
  adapter: createAdapter(redisClient, redisClient.duplicate()),
});
```

#### Option 2: Native WebSockets + In-Memory

```typescript
// Pros: No additional dependencies, simpler
// Cons: Single server limitation, manual reconnection
const wss = new WebSocketServer({ port: 8080 });
```

#### Option 3: Server-Sent Events (SSE)

```typescript
// Pros: Simple, unidirectional updates
// Cons: Limited to server->client communication
app.get("/api/presentations/:id/events", (req, res) => {
  res.writeHead(200, {
    "Content-Type": "text/event-stream",
    "Cache-Control": "no-cache",
    Connection: "keep-alive",
  });
});
```

**Recommendation**: Start with Socket.IO for robust real-time features.

### Comment Storage Strategies

#### Option 1: Relational (PostgreSQL)

```sql
-- Pros: ACID compliance, complex queries, existing infrastructure
-- Cons: Potential performance issues with large comment trees
SELECT c.*, u.name, u.avatar
FROM slide_comments c
JOIN users u ON c.user_id = u.id
WHERE c.presentation_id = $1 AND c.slide_index = $2
ORDER BY c.created_at DESC;
```

#### Option 2: Hybrid (PostgreSQL + JSON)

```sql
-- Pros: Flexibility for comment metadata, structured queries
-- Cons: Limited JSON query capabilities in older PostgreSQL
CREATE TABLE slide_comments (
    id SERIAL PRIMARY KEY,
    presentation_id INTEGER,
    slide_index INTEGER,
    data JSONB NOT NULL -- {user, content, replies, metadata}
);
```

**Recommendation**: Pure relational approach for consistency with existing architecture.

### Permission System Architecture

#### Role-Based Access Control (RBAC)

```typescript
interface Role {
  name: "owner" | "editor" | "reviewer";
  permissions: Permission[];
}

interface Permission {
  resource: "presentation" | "slide" | "comment";
  action: "create" | "read" | "update" | "delete";
  conditions?: {
    ownResource?: boolean;
    slideIndex?: number[];
  };
}

// Example: Reviewer permissions
const reviewerPermissions: Permission[] = [
  { resource: "presentation", action: "read" },
  { resource: "slide", action: "read" },
  { resource: "comment", action: "create" },
  { resource: "comment", action: "read" },
  { resource: "comment", action: "update", conditions: { ownResource: true } },
];
```

#### Attribute-Based Access Control (ABAC) - Future Extension

```typescript
// For custom permission overrides
interface CustomPermission {
  userId: number;
  resource: string;
  action: string;
  allowed: boolean;
  conditions?: Record<string, any>;
}
```

## Integration with Existing System

### GrapesJS Studio SDK Integration

```typescript
// Comments overlay in GrapesJS
export class CommentsPlugin {
  init(editor: Editor) {
    // Add comments panel to editor
    editor.Panels.addPanel({
      id: "comments",
      content: '<div id="comments-panel"></div>',
      buttons: [
        {
          id: "comments-toggle",
          className: "fa fa-comments",
          command: "toggle-comments",
        },
      ],
    });

    // Register comments commands
    editor.Commands.add("toggle-comments", {
      run: () => this.toggleCommentsPanel(),
      stop: () => this.hideCommentsPanel(),
    });
  }
}
```

### Authentication Integration

```typescript
// Extend existing JWT middleware for collaboration
export const collaborationAuth = async (
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  try {
    // Existing auth check
    const user = await verifyJWT(req.headers.authorization);

    // Collaboration permission check
    const collaboration = await getCollaborationPermissions(
      user.id,
      req.params.presentationId,
    );

    req.user = user;
    req.collaboration = collaboration;
    next();
  } catch (error) {
    res.status(401).json({ error: "Unauthorized" });
  }
};
```

## Security Considerations

### Data Access Control

- Presentation-level isolation (users only see presentations they have access to)
- Role-based comment visibility and editing permissions
- Secure invitation token generation and validation
- Rate limiting on comment creation and invitations

### Input Validation

```typescript
// Comment content validation
const commentSchema = z.object({
  content: z
    .string()
    .min(1, "Comment cannot be empty")
    .max(1000, "Comment too long")
    .refine((content) => !containsProfanity(content), "Inappropriate content"),
  slideIndex: z.number().min(0),
  presentationId: z.string().uuid(),
});

// Invitation validation
const invitationSchema = z.object({
  email: z.string().email(),
  role: z.enum(["editor", "reviewer"]),
  presentationId: z.string().uuid(),
});
```

### Audit Trail

```sql
-- Track all collaboration activities
CREATE TABLE collaboration_audit (
    id SERIAL PRIMARY KEY,
    presentation_id INTEGER,
    user_id INTEGER,
    action VARCHAR(50), -- 'comment_created', 'user_invited', 'role_changed'
    details JSONB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## Performance Considerations

### Comment Loading Optimization

- Paginated comment loading (20 comments per page)
- Lazy loading of comment threads
- Efficient database indexing on frequently queried columns

### Real-time Scaling

- WebSocket connection pooling
- Room-based message distribution (per presentation)
- Connection cleanup on user disconnect

### Caching Strategy

```typescript
// Redis caching for frequently accessed data
const cacheKeys = {
  collaborators: (presentationId: string) => `collab:${presentationId}`,
  comments: (presentationId: string, slideIndex: number) =>
    `comments:${presentationId}:${slideIndex}`,
  permissions: (userId: number, presentationId: string) =>
    `perms:${userId}:${presentationId}`,
};
```

## Testing Strategy

### Unit Tests

- Permission system logic
- Comment CRUD operations
- Invitation token generation/validation
- WebSocket message handling

### Integration Tests

- End-to-end collaboration workflows
- Real-time comment synchronization
- Permission enforcement across API endpoints
- Email invitation delivery

### Load Testing

- Concurrent users in single presentation
- Comment creation under load
- WebSocket connection limits
- Database performance with large comment volumes

## Deployment Considerations

### Infrastructure Requirements

- WebSocket support in deployment environment
- Redis instance for real-time features (if using Socket.IO)
- Email service configuration (Resend or similar)
- Increased database connections for real-time features

### Environment Variables

```bash
# Collaboration-specific config
COLLABORATION_MAX_USERS_PER_PRESENTATION=50
COLLABORATION_COMMENT_MAX_LENGTH=1000
COLLABORATION_INVITATION_EXPIRE_HOURS=168
WEBSOCKET_CORS_ORIGIN=https://app.investorprez.com
```

## Migration Strategy

### Existing Presentations

- All existing presentations automatically assign owner role to creator
- No migration needed for core presentation data
- Comments start fresh (no historical comment migration)

### User Onboarding

- Feature introduction tutorial
- Email templates for collaboration invitations
- Help documentation for collaboration features

## Success Metrics

### User Engagement

- Percentage of presentations using collaboration features
- Average number of collaborators per presentation
- Comment resolution time
- Invitation acceptance rate

### Technical Performance

- WebSocket connection stability
- Comment loading performance
- Real-time update latency
- System availability during collaboration sessions

## Future Enhancements

### Advanced Features (Post-MVP)

- Version history and rollback
- Advanced commenting (element-level annotations)
- Integration with external communication tools (Slack, Teams)
- Advanced permission granularity
- Collaborative cursor positions
- Voice/video calling integration

### Enterprise Features

- Single Sign-On (SSO) integration
- Audit logging and compliance
- Advanced analytics and reporting
- Bulk user management
- Custom approval workflows

## Conclusion

This collaboration system builds upon InvestorPrez's existing robust infrastructure to provide professional-grade collaboration features. The phased implementation approach ensures systematic development with clear milestones and deliverables.

The design prioritizes:

- **User Experience**: Intuitive collaboration workflows
- **Security**: Robust permission system and data protection
- **Performance**: Efficient real-time updates and scaling
- **Maintainability**: Clean architecture and comprehensive testing

By implementing this system, InvestorPrez will provide best-in-class collaboration features that differentiate it from competitors and drive user engagement and retention.
