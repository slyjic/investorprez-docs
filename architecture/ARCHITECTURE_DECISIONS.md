# Architecture Decision Log

_Last Updated: August 12, 2025_
_Status: Current - Documentation Standards Update_

_This document contains important architecture decisions moved from CLAUDE.md for better organization._

## 2025-07-21: Route-Based Code Splitting Strategy

- **Decision**: Implement comprehensive lazy loading for all major routes and components
- **Rationale**: 1.7MB bundle was causing significant performance issues and poor user experience
- **Implementation**: React.lazy() + Suspense for Dashboard, Editor, Admin, Profile, and Public routes
- **Impact**: 94% bundle reduction (1.7MB → 147KB), ~70% faster initial page loads
- **Trade-offs**: Additional complexity but massive performance gains

## 2025-07-21: Error Boundary Coverage Strategy

- **Decision**: Add error boundaries around all critical application routes
- **Rationale**: Prevent component crashes from taking down entire application
- **Coverage**: Dashboard, Admin Panel, Editor, Public Presentations, Profile pages
- **Impact**: Production stability, graceful error handling, better user experience

## 2025-07-21: Component Compatibility Layer Approach

- **Decision**: Create wrapper components for API mismatches (SelectCompat)
- **Rationale**: Subframe components don't always match expected React patterns
- **Implementation**: Thin wrapper components bridging API differences
- **Impact**: Consistent component usage without major refactoring

## 2025-06-28: Dual UI System Approach

- **Decision**: Maintain both Subframe and shadcn/ui components
- **Rationale**: Subframe for complex dashboard layouts, shadcn/ui for form components
- **Impact**: Increased bundle size but better developer experience

## Previous: GrapesJS SDK Integration

- **Decision**: Use GrapesJS Studio SDK v1.0.51 with presentation isolation
- **Rationale**: Professional presentation editing capabilities
- **Impact**: Required React downgrade but enabled advanced features
