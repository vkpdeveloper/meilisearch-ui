# Project Context

## Purpose

Meilisearch-UI is an open-source, pretty, simple and fast admin dashboard UI for managing Meilisearch instances. It provides a web-based interface for:

- Managing multiple Meilisearch instances
- Performing CRUD operations on indexes
- Searching and managing documents
- Configuring index settings
- Monitoring tasks and instance health
- Managing API keys

The application is designed as a Single Page Application (SPA) that stores instance configuration data in the browser's local storage, ensuring data privacy and security.

## Tech Stack

### Core Technologies

- **React** v18.3.1 - UI library
- **TypeScript** 5.8.2 - Type safety and development experience
- **Vite** 6.2.1 - Build tool and development server
- **Bun** - Package manager

### Routing & State Management

- **TanStack Router** v1.114.4 - Type-safe routing with file-based routing
- **TanStack Query** v5.67.2 - Server state management and data fetching
- **Zustand** 5.0.3 - Client-side state management
- **Immer** - Immutable state updates

### UI Frameworks & Components

- **TailwindCSS** 3.4.13 - Utility-first CSS framework
- **UnoCSS** 0.63.4 - Atomic CSS engine
- **Arco Design** - Enterprise design system (primary UI library)
- **Semi UI** - Design system by TikTok Frontend Team
- **Mantine UI** - Modern React components
- **Next UI** - Beautiful React UI library
- **Radix UI** - Unstyled, accessible components

### Forms & Validation

- **React Hook Form** - High-performance form library
- **Zod** - TypeScript-first schema validation
- **@hookform/resolvers** - Form validation resolvers

### Internationalization

- **i18next** - Internationalization framework
- **react-i18next** - React bindings for i18next
- **i18next-browser-languagedetector** - Language detection
- Supported languages: English (en), Chinese (zh-CN)

### Data & Utilities

- **Meilisearch** 0.49.0 - Official Meilisearch JavaScript client
- **Lodash** - Utility library
- **Day.js** - Date manipulation
- **Fuse.js** - Fuzzy search
- **ECharts** - Data visualization

### Development Tools

- **Biome** 1.9.4 - Code formatting and linting (primary)
- **ESLint** - Code quality tool
- **TypeScript ESLint** - TypeScript-specific linting rules

## Project Conventions

### Code Style

#### Formatting

- **Formatter**: Biome (primary), Prettier (secondary)
- **Indentation**: Tabs (not spaces)
- **Quote Style**: Double quotes for strings
- **Line Endings**: LF (Unix-style)

#### Naming Conventions

- **File Names**:
  - Use lowercase letters with hyphens (`-`) to separate words
  - Component files (TSX) use PascalCase (e.g., `IndexList.tsx`)
  - Exception: `index.tsx` files remain lowercase
  - File names should be in English
- **Variables & Functions**: camelCase
- **Components**: PascalCase
- **Constants**: UPPER_SNAKE_CASE or camelCase depending on context
- **Type/Interface**: PascalCase

#### Comments

- All code comments must be in English
- Use clear, descriptive comments for complex logic
- Prefer self-documenting code over excessive comments

#### Language Identifiers

- Use full locale format for i18n: `zh-CN`, `en-US` (not `zh`, `en`)

### Architecture Patterns

#### Component Organization

The project follows a layered component architecture:

```text
src/components/
├── biz/          # Business components (domain-specific)
├── common/       # Reusable UI components
└── block/        # Business block components (complete page units)
```

- **biz/**: Business logic components tied to specific features (e.g., `IndexList`, `CreateIndex`)
- **common/**: Generic, reusable components (e.g., `Loader`, `Breadcrumb`, `JsonEditor`)
- **block/**: Self-contained business units that represent complete functional blocks (e.g., `document/search`, `document/upload`)

#### Routing

- File-based routing using TanStack Router
- Routes are defined in `src/routes/` directory
- Route structure mirrors the application hierarchy
- Type-safe route definitions with TypeScript

#### Data Fetching

- **TanStack Query** for all server state management
- Custom hooks in `src/hooks/` for data fetching logic (e.g., `useMeiliClient`, `useIndexes`)
- Query keys follow a consistent naming pattern
- Automatic refetching configured (30s interval, on mount, on focus, on reconnect)

#### State Management

- **Zustand** for global client state (stored in `src/store/`)
- **TanStack Query** for server state
- **React Context** for provider-level state (error boundaries, toast, UI providers)
- Prefer local component state when possible

#### Custom Hooks

- Custom hooks in `src/hooks/` encapsulate reusable logic
- Naming: `use` prefix (e.g., `useCurrentIndex`, `useMeiliClient`)
- Hooks should be focused and single-purpose

#### Utilities & Libraries

- Utility functions in `src/utils/` (e.g., `array.ts`, `file.ts`, `text.ts`)
- Library code in `src/lib/` (e.g., `i18n.ts`, `toast.ts`, `cn.ts`)
- Path alias `@/` maps to `src/` directory

#### Providers

- App-level providers in `src/providers/`
- Providers handle: error boundaries, toast notifications, UI context

### Testing Strategy

**Current Status**: Testing infrastructure is not currently implemented or documented in the project. While testing libraries (Jest, Testing Library) appear in dependency trees, no test files or test configuration are present in the codebase.

**Recommendation**: Consider implementing:

- Unit tests for utility functions and hooks
- Component tests for critical UI components
- Integration tests for key user flows
- E2E tests for critical paths (optional)

### Git Workflow

#### Commit Conventions

- Follow **Conventional Commits** specification
- Format: `<type>(<scope>): <description>`
- Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`, etc.
- Examples:
  - `feat(index): add index creation form`
  - `fix(document): resolve search pagination issue`
  - `chore(deps): update dependencies`

#### Commit Message Language

- All commit messages must be in English
- Use imperative mood ("add" not "added" or "adds")

#### Branching Strategy

- Main branch: `main` (may be unstable during development)
- Stable releases: Use release tags/branches
- Feature branches: Create as needed for development

## Domain Context

### Meilisearch Concepts

- **Instance**: A Meilisearch server instance (can manage multiple)
- **Index**: A collection of documents in Meilisearch (similar to a table in SQL)
- **Document**: A JSON object stored in an index
- **Primary Key**: Unique identifier field for documents in an index
- **Task**: Asynchronous operation in Meilisearch (index creation, document addition, etc.)
- **API Key**: Authentication token for accessing Meilisearch instance

### Application Modes

- **Multi-Instance Mode**: Default mode, allows managing multiple Meilisearch instances
- **Singleton Mode**: Single-instance mode where one instance is pre-configured via environment variables

### Key Features

- Instance connection management (stored in browser localStorage)
- Index CRUD operations
- Document search with filters and pagination
- Document upload (JSON file or manual entry)
- Index settings configuration
- Task monitoring and filtering
- API key management
- Instance health and statistics monitoring

### Data Storage

- Instance configurations stored in browser's localStorage
- No backend server required - pure client-side application
- Data privacy: all data remains in user's browser

## Important Constraints

### Technical Constraints

- **Not Fully Responsive**: Application is designed primarily for desktop use. Mobile/responsive design is incomplete.
- **CORS Configuration Required**: Meilisearch instances must have CORS configured to allow requests from the UI domain.
- **Browser Storage Dependency**: Application relies on browser localStorage for instance configuration. Clearing browser data will remove saved instances.
- **Client-Side Only**: No backend server - all API calls are made directly from the browser to Meilisearch instances.

### Security Constraints

- **Singleton Mode Security**: When using singleton mode, API keys are embedded in the client bundle. Only use in trusted internal network environments.
- **API Key Exposure**: API keys stored in localStorage are accessible to JavaScript. Users should be aware of XSS risks.
- **CORS Limitations**: CORS must be properly configured on Meilisearch instances to prevent unauthorized access.

### Deployment Constraints

- **Base Path Configuration**: Supports custom base paths via `BASE_PATH` environment variable for subdirectory deployments.
- **Docker Support**: Provides both full and lite Docker images. Lite image excludes singleton mode and some advanced features.
- **Port**: Default development and preview port is 24900.

### Browser Compatibility

- Modern browsers with ES2020+ support required
- LocalStorage API required
- Fetch API required

## External Dependencies

### Meilisearch Instances

- **Primary Dependency**: External Meilisearch server instances
- **Communication**: HTTP REST API via official Meilisearch JavaScript client
- **Authentication**: API keys (master key, search key, etc.)
- **CORS**: Must be configured on Meilisearch server to allow UI domain

### Deployment Platforms

- **Vercel**: Primary deployment platform (supports one-click deployment)
- **Docker**: Containerized deployment with nginx
- **Netlify**: Supported via `netlify.toml` configuration

### External Services (Optional)

- No required external services beyond Meilisearch instances
- All functionality works offline once instances are configured (except for API calls to Meilisearch)
