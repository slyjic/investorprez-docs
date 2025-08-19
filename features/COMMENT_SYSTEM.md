# Comment System

_Last Updated: July 29, 2025_  
_Status: Active - v1.8.0_  
_Feature Type: Core Platform Feature_

## Overview

The InvestorPrez Comment System provides a comprehensive visual feedback platform for published presentations, enabling stakeholders to leave precise, slide-specific comments with visual positioning, threaded discussions, and workflow management.

## Key Features

### 🎯 Visual Comment Positioning

- **Slide-Specific Comments**: Comments tied to specific slides with precise X/Y coordinates
- **Visual Comment Pins**: Interactive markers that appear on presentation slides
- **Double-Click Interface**: Intuitive comment creation by double-clicking anywhere on slides
- **Real-Time Positioning**: Accurate visual feedback and pin placement

### 💬 Comment Functionality

- **Threaded Discussions**: Nested reply system with unlimited depth
- **Reaction System**: Like/dislike functionality with real-time counts
- **Anonymous Commenting**: Name and optional email-based commenting
- **Content Sanitization**: HTML sanitization using DOMPurify for security
- **Rate Limiting**: 5 comments per hour per IP address

### ✅ Workflow Management

- **Comment Resolution**: Presentation owners can mark comments as resolved/unresolved
- **Status Indicators**: Visual indicators for resolved, unresolved, and unread comments
- **Admin Moderation**: Complete admin workflow for comment approval and management
- **Audit Trail**: Comprehensive logging for all comment-related activities

## Technical Architecture

### Database Schema

The comment system uses four main database tables:

#### `presentation_comments`

```sql
CREATE TABLE presentation_comments (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  presentation_id UUID NOT NULL REFERENCES presentations(id),
  parent_comment_id UUID REFERENCES presentation_comments(id),
  author_name VARCHAR(100) NOT NULL,
  author_email VARCHAR(255),
  content TEXT NOT NULL,
  slide_index INTEGER DEFAULT 0,
  position_x DECIMAL(5,2),
  position_y DECIMAL(5,2),
  comment_type VARCHAR(20) DEFAULT 'general',
  is_approved BOOLEAN DEFAULT false,
  is_resolved BOOLEAN DEFAULT false,
  is_deleted BOOLEAN DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
```

#### `comment_reactions`

```sql
CREATE TABLE comment_reactions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  comment_id UUID NOT NULL REFERENCES presentation_comments(id),
  reaction_type VARCHAR(20) NOT NULL,
  author_name VARCHAR(100),
  author_email VARCHAR(255),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
```

#### `comment_moderation_queue`

```sql
CREATE TABLE comment_moderation_queue (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  comment_id UUID NOT NULL REFERENCES presentation_comments(id),
  action_type VARCHAR(20) NOT NULL,
  moderator_id UUID REFERENCES users(id),
  processed_at TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
```

#### `comment_notifications`

```sql
CREATE TABLE comment_notifications (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  presentation_id UUID NOT NULL REFERENCES presentations(id),
  comment_id UUID NOT NULL REFERENCES presentation_comments(id),
  recipient_email VARCHAR(255) NOT NULL,
  notification_type VARCHAR(20) NOT NULL,
  is_sent BOOLEAN DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
```

### API Endpoints

#### Public Comment API

**Get Comments**

```http
GET /api/comments/:presentationSlug
```

Returns all approved comments for a published presentation with nested reply structure.

**Submit Comment**

```http
POST /api/comments/:presentationSlug
Content-Type: application/json

{
  "authorName": "John Doe",
  "authorEmail": "john@example.com",
  "content": "This is a great slide!",
  "slideIndex": 2,
  "positionX": 45.5,
  "positionY": 30.2,
  "commentType": "slide_pin"
}
```

**Add Reaction**

```http
POST /api/comments/:commentId/react
Content-Type: application/json

{
  "reactionType": "like",
  "authorName": "Jane Doe",
  "authorEmail": "jane@example.com"
}
```

**Resolve Comment** (Authenticated - Presentation Owner)

```http
PATCH /api/comments/:commentId/resolve
Authorization: Bearer <token>
Content-Type: application/json

{
  "isResolved": true
}
```

#### Admin Moderation API

**Get Pending Comments**

```http
GET /api/comments/admin/pending
Authorization: Bearer <admin-token>
```

**Approve Comment**

```http
POST /api/comments/admin/:commentId/approve
Authorization: Bearer <admin-token>
```

**Delete Comment**

```http
DELETE /api/comments/admin/:commentId
Authorization: Bearer <admin-token>
Content-Type: application/json

{
  "reason": "Inappropriate content"
}
```

### Frontend Components

#### CommentSystem

Main integration component that handles all comment functionality:

```tsx
<CommentSystem presentationSlug={slug} isOwner={false} isEnabled={true} />
```

#### CommentPin

Visual comment markers with positioning:

```tsx
<CommentPin
  id="comment-pin-1"
  positionX={45.5}
  positionY={30.2}
  commentCount={3}
  isResolved={false}
  hasUnread={true}
  onClick={handlePinClick}
/>
```

#### CommentThread

Comment dialog with threaded discussions:

```tsx
<CommentThread
  comments={commentList}
  isOpen={isThreadOpen}
  onClose={handleClose}
  onReply={handleReply}
  onReact={handleReaction}
  onResolve={handleResolve}
  canResolve={isOwner}
/>
```

#### CommentForm

Comment submission form with positioning:

```tsx
<CommentForm
  isOpen={isFormOpen}
  onClose={handleClose}
  onSubmit={handleSubmit}
  slideIndex={2}
  positionX={45.5}
  positionY={30.2}
/>
```

## User Experience

### For Viewers

1. **View Published Presentation** → See existing comment pins on slides
2. **Double-click Anywhere** → Opens comment form at clicked position
3. **Fill Comment Form** → Enter name, email (optional), and comment
4. **Submit Comment** → Creates visual pin at clicked location (pending approval if enabled)
5. **Click Existing Pins** → View comment threads and discussions
6. **React to Comments** → Like/dislike comments and replies
7. **Reply to Comments** → Engage in threaded discussions

### For Presentation Owners

1. **All Viewer Capabilities** → Full commenting functionality
2. **Resolve Comments** → Mark feedback as addressed with resolution workflow
3. **Manage Discussions** → Oversight of all comments on their presentations
4. **Visual Status Tracking** → See resolved vs. unresolved comments at a glance

### For Administrators

1. **All Owner Capabilities** → Full comment management
2. **Moderation Queue** → Review and approve pending comments
3. **Content Management** → Delete inappropriate comments with audit trail
4. **System Settings** → Configure comment system parameters

## Configuration

### System Settings

Comments can be configured via system_settings table:

```sql
-- Enable/disable comments globally
INSERT INTO system_settings (key, value, description)
VALUES ('comments_enabled', 'true', 'Enable comments on published presentations');

-- Require admin approval for new comments
INSERT INTO system_settings (key, value, description)
VALUES ('comments_require_approval', 'true', 'Require admin approval for new comments');

-- Allow anonymous comments
INSERT INTO system_settings (key, value, description)
VALUES ('comments_allow_anonymous', 'true', 'Allow anonymous comments with name + email');

-- Maximum comment length
INSERT INTO system_settings (key, value, description)
VALUES ('comments_max_length', '1000', 'Maximum character length for comments');

-- Rate limiting
INSERT INTO system_settings (key, value, description)
VALUES ('comments_rate_limit', '5', 'Maximum comments per IP per hour');
```

### Security Features

#### Content Sanitization

All comment content is sanitized using DOMPurify with strict settings:

```javascript
const sanitizedContent = DOMPurify.sanitize(content, {
  ALLOWED_TAGS: ["p", "br", "strong", "em", "u", "a"],
  ALLOWED_ATTR: ["href"],
  FORBID_ATTR: ["style", "class", "id", "onclick"],
  ALLOW_DATA_ATTR: false,
});
```

#### Rate Limiting

- **Comment Submission**: 5 comments per hour per IP
- **Comment Retrieval**: 100 requests per 15 minutes per IP
- **Admin Actions**: No rate limiting for authenticated admins

#### Input Validation

- **Author Name**: 1-100 characters, escaped
- **Email**: Valid email format, normalized
- **Content**: 1-1000 characters, sanitized
- **Position**: X/Y coordinates between 0-100%
- **Slide Index**: Integer between 0-999

## Performance Considerations

### Database Optimization

- **Indexes**: Optimized indexes for slide-based and position-based queries
- **Recursive CTEs**: Efficient comment tree queries for nested replies
- **Statistics Views**: Pre-computed comment statistics for dashboards

### Frontend Optimization

- **Lazy Loading**: Comments loaded on-demand when pins are clicked
- **Efficient Rendering**: React optimizations for large comment threads
- **Position Caching**: Comment positions cached for smooth interactions

## Testing

### Component Testing

- **CommentPin**: Position rendering, click handling, status indicators
- **CommentThread**: Thread rendering, reply functionality, reactions
- **CommentForm**: Form validation, submission, positioning
- **CommentSystem**: Integration testing, event handling

### API Testing

- **Endpoint Testing**: All API endpoints tested for correct responses
- **Security Testing**: Input validation, content sanitization, rate limiting
- **Performance Testing**: Large comment sets, nested threads

### Database Testing

- **Migration Testing**: Schema changes, data integrity
- **Query Performance**: Indexed query performance, recursive CTE efficiency
- **Constraint Testing**: Foreign key constraints, data validation

## Future Enhancements

### Phase 2 Features

- **Email Notifications**: Real-time notifications for comment activity
- **Advanced Reactions**: Extended reaction types (love, laugh, angry)
- **Comment Analytics**: Detailed analytics for comment engagement
- **Mobile Optimizations**: Enhanced mobile comment experience

### Phase 3 Features

- **Real-time Updates**: WebSocket-based real-time comment updates
- **Comment Mentions**: @mention functionality in comments
- **File Attachments**: Image and file attachments in comments
- **Advanced Moderation**: Auto-moderation with keyword filtering

## Troubleshooting

### Common Issues

**Comments Not Appearing**

- Check if comments are enabled in system settings
- Verify presentation is published and accessible
- Check if comments require approval and are pending

**Comment Pins Not Clickable**

- Ensure comment system is enabled for the presentation
- Check for JavaScript errors in browser console
- Verify proper event handling in CommentSystem component

**Positioning Issues**

- Validate X/Y coordinates are within 0-100% range
- Check slide container data attributes
- Verify CSS positioning calculations

### Debug Information

- **Database Queries**: Enable query logging for comment-related operations
- **Component State**: Use React DevTools to inspect comment component state
- **API Responses**: Monitor network tab for comment API calls

## Related Documentation

- [Third-Party Integrations](../03-reference/THIRD_PARTY_INTEGRATIONS.md) - DOMPurify and security libraries
- [API Reference](../03-reference/API_REFERENCE.md) - Complete API documentation
- [Database Schema](../03-reference/DATABASE_SCHEMA.md) - Full database structure
- [Testing Procedures](../03-reference/TESTING_PROCEDURES.md) - Testing guidelines

---

**Note**: This comment system represents a major enhancement to the InvestorPrez platform, providing professional-grade feedback capabilities for published presentations. For technical support or feature requests, please refer to the issue tracking system.
