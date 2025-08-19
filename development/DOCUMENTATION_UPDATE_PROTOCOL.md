# Documentation Update Protocol

*Last Updated: July 24, 2025*  
*Status: Current - Enhanced with Reality Verification*  
*Version: v1.1*
*Previous Version Archived: /docs/04-archive/document-updates-2025-07-24/DOCUMENTATION_UPDATE_PROTOCOL_original_2025-07-24.md*

## 🎯 **Purpose**

This protocol establishes mandatory procedures for updating project documentation to ensure accuracy, preserve historical context, and maintain consistency across all documentation changes.

## 📋 **When This Protocol Applies**

### **Mandatory Use For:**
- ✅ Correcting factual inaccuracies in existing documents
- ✅ Major content updates or restructuring
- ✅ Status changes (features implemented, removed, or modified)
- ✅ Version-related updates (new releases, architectural changes)
- ✅ Priority or roadmap changes

### **Optional For:**
- ⚠️ Minor typo corrections (single words/phrases)
- ⚠️ Formatting improvements without content changes
- ⚠️ Adding new sections without modifying existing content

## 🔄 **MANDATORY UPDATE PROCEDURE**

### **Step 0: Reality Verification** ⚠️ **MANDATORY** (1-2 minutes)
**BEFORE ANY DOCUMENTATION WORK:**

1. **Verify Current Context**:
   - [ ] **Current Date**: What is today's actual date? (Check system, calendar, or ask user)
   - [ ] **Project Status**: What version is currently deployed? (Check package.json, CLAUDE.md)
   - [ ] **Feature Status**: What features are actually implemented? (Test or verify claims)
   - [ ] **Environment**: What's the current working state? (Run quick checks)

2. **Reality Check Questions**:
   - Am I using the correct current date for timestamps?
   - Do my claims about features/status match actual implementation?
   - Are the version numbers I'm referencing accurate?
   - Have I verified facts rather than assuming them?

3. **Cross-Reference Verification**:
   - [ ] Check package.json for current version
   - [ ] Verify dates against system/environment information
   - [ ] Test any feature claims being made
   - [ ] Confirm technical details are accurate

**🚨 CRITICAL**: If any reality verification fails, STOP and resolve discrepancies before proceeding.

### **Step 1: Pre-Update Assessment** (2-3 minutes)
1. **Document the Issue**:
   - What inaccuracies were found?
   - What needs to be corrected?
   - Why is the update necessary?

2. **Identify Update Type**:
   - **Minor**: Small corrections, updated dates
   - **Major**: Significant content changes, status updates
   - **Critical**: Fundamental inaccuracies affecting development decisions

### **Step 2: Archive Creation** (1-2 minutes)
1. **For Minor Updates**:
   - Create timestamped backup in same directory (filename_backup_YYYY-MM-DD.md)

2. **For Major/Critical Updates**:
   - Create archive in `/docs/04-archive/document-updates-YYYY-MM-DD/`
   - Include original document with preservation note

**Archive Naming Convention**:
```
/docs/04-archive/document-updates-2025-01-23/
├── CURRENT_STATUS_original_2025-01-23.md
├── README_original_2025-01-23.md
└── UPDATE_NOTES.md
```

### **Step 3: Create Update Documentation** (2-3 minutes)
**Always create UPDATE_NOTES.md in archive directory:**

```markdown
# Documentation Update Notes - [Date]

## Updated Documents
- [Document Name] - [Type of Update] - [Reason]

## Key Changes Made
- [Specific change 1] - Fixed inaccuracy about [topic]
- [Specific change 2] - Updated status from X to Y
- [Specific change 3] - Corrected version information

## Impact Assessment
- **Development Impact**: [How this affects current development]
- **Accuracy Improvement**: [What inaccuracies were resolved]
- **Future Prevention**: [Steps to prevent similar issues]

## Verification
- [✅/❌] Changes verified against actual implementation
- [✅/❌] Cross-references updated
- [✅/❌] Related documents checked for consistency
```

### **Step 4: Apply Updates with Metadata** (3-5 minutes)
**Required Metadata for ALL updated documents:**

```markdown
*Last Updated: [Month DD, YYYY]*  
*Status: Current - [Brief descriptor]*  
*Version: [App version if applicable]*
*Previous Version Archived: [Archive location if major update]*
```

**Content Update Requirements:**
- ✅ Verify all claims against actual implementation
- ✅ Update version numbers to match package.json
- ✅ Ensure consistency with other current documents
- ✅ Use precise, factual language

### **Step 5: Verification & Consistency Check** (2-3 minutes)
1. **Cross-Reference Check**:
   - Do other documents reference the updated information?
   - Are there conflicting claims in other files?
   - Do internal links still work?

2. **Implementation Verification**:
   - Are all claims about features/status actually true?
   - Do version numbers match reality?
   - Are technical details accurate?

## 📚 **Documentation Standards Compliance**

### **Required Metadata Fields**
Every current document MUST include:
```markdown
*Last Updated: [Date]*  
*Status: [Current/Archived/Historical]*  
*Version: [v1.4.0 or equivalent]*
```

### **Optional Metadata Fields**
For enhanced tracking:
```markdown
*Author: [Team/Individual]*  
*Review Date: [Next scheduled review]*  
*Dependencies: [Related documents]*
*Previous Version Archived: [Archive location]*
```

### **Status Indicator Standards**
- **Current**: Actively maintained, reflects current state
- **Archived**: Historical reference, no longer maintained
- **Historical**: Important for context but superseded
- **Draft**: Work in progress, not authoritative

## 🚨 **Quality Gates**

### **Before Publishing Updates:**
- [ ] **Reality Verification Complete**: Current date, versions, and facts confirmed
- [ ] **Accuracy Verified**: All claims tested against actual implementation
- [ ] **Archive Created**: Original version preserved with notes
- [ ] **Metadata Complete**: All required fields included with correct dates
- [ ] **Cross-References Updated**: Related documents checked for consistency
- [ ] **Version Correlation**: Document version matches app version
- [ ] **Date Accuracy**: All timestamps reflect actual current date

### **Red Flags - Stop and Reassess:**
- 🚫 **Using incorrect dates or timestamps**
- 🚫 **Making claims without reality verification**
- 🚫 Making claims about features without testing them
- 🚫 Updating without preserving previous version
- 🚫 Creating contradictions with other current documents
- 🚫 Missing required metadata fields
- 🚫 No explanation of what changed or why

## 📊 **Update Types & Examples**

### **Type 1: Accuracy Corrections**
**Example**: Fixing "17 controls" claim to "6 presets + 5 colors"
- **Archive**: Required
- **Update Notes**: Required  
- **Verification**: Mandatory code review
- **Impact**: High - affects development decisions

### **Type 2: Status Updates**
**Example**: Feature completed, priority changed, version updated
- **Archive**: Required for major status changes
- **Update Notes**: Required
- **Verification**: Test feature status
- **Impact**: Medium - affects current planning

### **Type 3: Content Enhancement**
**Example**: Adding details, improving explanations, new sections
- **Archive**: Optional (backup recommended)
- **Update Notes**: Optional but recommended
- **Verification**: Ensure accuracy of new content
- **Impact**: Low - improves clarity without changing facts

## 🔄 **Regular Maintenance Schedule**

### **Weekly Reviews** (Every Friday)
- Check for outdated "Last Updated" dates (>2 weeks old)
- Verify current priorities match actual development focus
- Update feature completion status

### **Release Reviews** (With each version bump)
- Major review of all current-state documents
- Update version numbers across all docs
- Archive any documents superseded by new version

### **Quarterly Audits** (Every 3 months)
- Comprehensive accuracy review
- Test all feature claims against implementation
- Reorganize archives if needed
- Update this protocol based on lessons learned

## 🛠️ **Tools & Automation**

### **Recommended Tools**
- **Date Tracking**: Use consistent date format (January 23, 2025)
- **Archive Organization**: Systematic folder structure
- **Change Tracking**: Git commits with descriptive messages
- **Cross-Reference Checking**: Manual review of related docs

### **Future Automation Opportunities**
- **Version Sync**: Auto-update version numbers from package.json
- **Link Checking**: Automated internal link validation
- **Date Reminders**: Automated alerts for stale documents
- **Cross-Reference Mapping**: Tool to identify document dependencies

## 📝 **Template: Update Notes**

```markdown
# Documentation Update - [Document Name] - [Date]

## Update Summary
**Type**: [Minor/Major/Critical]  
**Reason**: [Why update was needed]  
**Impact**: [Who/what is affected]

## Specific Changes
1. **[Section/Topic]**: Changed "[old info]" to "[new info]" because [reason]
2. **[Section/Topic]**: Added "[new content]" to address [gap/inaccuracy]
3. **[Section/Topic]**: Removed "[outdated info]" because [no longer valid/replaced]

## Verification Steps Taken
- [ ] Tested feature claims against actual implementation
- [ ] Checked cross-references in related documents
- [ ] Verified version numbers match package.json
- [ ] Confirmed no contradictions with other current docs

## Archive Information
**Original Version**: [Archive location]  
**Backup Created**: [Date and location]  
**Previous Last Updated**: [Previous date]

## Impact Assessment
**Development Impact**: [How this affects current work]  
**User Impact**: [How this affects documentation users]  
**Future Prevention**: [What will prevent similar issues]
```

## 🎯 **Success Metrics**

### **Process Compliance**
- **100%** of major updates follow this protocol
- **90%** of minor updates include basic metadata
- **0** contradictions between current documents

### **Quality Indicators**
- Documentation accuracy matches implementation reality
- Clear audit trail for all changes
- Consistent metadata across all documents
- No broken internal references

## 🚨 **Protocol Violations**

### **Common Violations**
1. **Direct editing without archiving** - Most serious violation
2. **Missing metadata updates** - Prevents tracking
3. **No verification of claims** - Perpetuates inaccuracies
4. **Inconsistent formatting** - Reduces professionalism
5. **No update documentation** - Lost context

### **Enforcement**
- **Self-enforcement**: Each contributor follows protocol
- **Peer review**: Changes reviewed before merge
- **Audit trail**: Git history shows compliance
- **Regular reviews**: Weekly checks for compliance

---

## 🎯 **Quick Reference Checklist**

**Before Any Documentation Update:**
- [ ] **Complete reality verification (Step 0)** - Verify current date, versions, facts
- [ ] Assess update type (Minor/Major/Critical)
- [ ] Create appropriate archive/backup
- [ ] Document what's changing and why
- [ ] Verify accuracy against actual implementation

**During Update:**
- [ ] Update all required metadata fields with correct current date
- [ ] Use precise, factual language verified against reality
- [ ] Maintain consistency with other docs
- [ ] Check cross-references

**After Update:**
- [ ] Create/update UPDATE_NOTES.md if required
- [ ] Verify no contradictions introduced
- [ ] Test any links or references
- [ ] Schedule next review if needed

---

*This protocol ensures documentation accuracy, preserves historical context, and maintains professional standards across all project documentation. Compliance is mandatory for maintaining reliable project documentation.*