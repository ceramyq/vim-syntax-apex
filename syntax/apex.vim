"
" vim-syntax-apex
"
" Language: Salesforce Apex


if exists("b:current_syntax")
    finish
endif


syn case ignore

syn keyword apexError           activate autonomous begin bigdecimal byte
syn keyword apexError           case cast char collect const default end exit
syn keyword apexError           export float goto hint import
syn keyword apexError           inner into loop number of outer parallel
syn keyword apexError           pragma retrieve returning short stat
syn keyword apexError           switch synchronized then transaction when
syn match apexError             "\""

syn keyword apexConditional     if else
syn keyword apexRepeat          while for do
syn keyword apexBoolean         true false
syn keyword apexConstant        null
syn keyword apexTypedef         this super
syn match   apexOperator        "\(\.\)\@<!new\>"
syn keyword apexOperator        insert update delete upsert merge
syn match   apexEscapeChar      contained "\(\\n\|\\r\|\\t\)"
syn keyword apexSoqlStatement   contained select where having and or like not in includes excludes from limit group order by asc desc
syn match   apexSoqlStatement   contained "for\s\+update"
syn match   apexSoqlStatement   contained "with\s\+data\s\+category"
syn keyword apexStatement       return instanceof
syn keyword apexType            String Integer Date Datetime Decimal Double Time Map List Blob Boolean Long sObject
syn match   apexType            "Set\(\s*\)<"me=s+3
syn keyword apexType            PageReference ApexPages Database System Crypto Cookie Document EncodingUtil Http HttpRequest HttpResponse UserInfo Test Trigger XmlNode XmlStreamReader XmlStreamWriter Site Schema
syn keyword apexSObject         Account AccountContactRole AccountFeed AccountHistory AccountOwnerSharingRule AccountPartner AccountShare AccountTag AccountTeamMember AccountTerritoryAssignmentRule AccountTerritoryAssignmentRuleItem AccountTerritorySharingRule ActivityHistory AdditionalNumber ApexClass Represents ApexComponent ApexLog ApexPage ApexTrigger Represents Approval Article Article Asset AssetFeed AssetTag AssignmentRule Attachment Bookmark BrandTemplate BusinessHours BusinessProcess
syn keyword apexSObject         CallCenter Campaign CampaignFeed CampaignMember CampaignMemberStatus CampaignOwnerSharingRule CampaignShare CampaignTag Case CaseArticle CaseComment CaseContactRole CaseFeed CaseHistory CaseMilestone CaseOwnerSharingRule CaseShare CaseSolution CaseStatus CaseTag CaseTeamMember CaseTeamRole CaseTeamTemplate CaseTeamTemplateMember CaseTeamTemplateRecord CategoryData CategoryNode CategoryNodeLocalization ChatterActivity ChatterConversation ChatterConversationMember
syn keyword apexSObject         ChatterMessage CollaborationGroup CollaborationGroupFeed CollaborationGroupMember CollaborationGroupMemberRequest CollaborationInvitation Community Contact ContactFeed ContactHistory ContactOwnerSharingRule ContactShare ContactTag ContentDocument ContentDocumentHistory ContentVersion ContentVersionHistory ContentWorkspace ContentWorkspaceDoc Contract ContractContactRole ContractFeed ContractHistory ContractLineItem ContractLineItemHistory ContractStatus
syn keyword apexSObject         ContractTag CronTrigger CurrencyType Custom Dashboard DashboardComponent DashboardComponentFeed DashboardFeed DashboardTag DatedConversionRate Division DivisionLocalization Document DocumentAttachmentMap DocumentTag EmailMessage EmailServicesAddress EmailServicesFunction EmailStatus EmailTemplate Entitlement EntitlementContact EntitlementHistory EntitlementFeed EntitlementTemplate EntityHistory EntitySubscription Event EventAttendee EventFeed EventTag
syn keyword apexSObject         FeedComment FeedItem FeedLike FeedTrackedChange FeedPost FiscalYearSettings Folder ForecastShare Group GroupMember Holiday Idea IdeaComment KnowledgeArticle KnowledgeArticleVersion KnowledgeArticleViewStat KnowledgeArticleVoteStat Lead LeadFeed LeadHistory LeadOwnerSharingRule LeadShare LeadStatus LeadTag LineitemOverride LoginHistory MailmergeTemplate MilestoneType Name NewsFeed Note NoteTag NoteAndAttachment OpenActivity Opportunity OpportunityCompetitor
syn keyword apexSObject         OpportunityContactRole OpportunityFeed OpportunityFieldHistory OpportunityHistory OpportunityLineItem OpportunityLineItemSchedule OpportunityOverride OpportunityOwnerSharingRule OpportunityPartner OpportunityShare OpportunityStage OpportunityTag OpportunityTeamMember Organization OrgWideEmailAddress Partner PartnerNetworkConnection PartnerNetworkRecordConnection PartnerRole Period PermissionSet PermissionSetAssignment Pricebook2 PricebookEntry ProcessInstance
syn keyword apexSObject         ProcessInstanceHistory ProcessInstanceStep ProcessInstanceWorkitem Product2 Product2Feed ProductEntitlementTemplate Profile PushTopic QuantityForecast QuantityForecastHistory Question QuestionDataCategorySelection QueueSobject Quote QuoteDocument QuoteLineItem RecordType RecordTypeLocalization Reply Report ReportFeed ReportTag RevenueForecast RevenueForecastHistory Scontrol ScontrolLocalization SelfServiceUser ServiceContract ServiceContractFeed
syn keyword apexSObject         ServiceContractHistory ServiceContractOwnerSharingRule ServiceContractShare Site SiteHistory SlaProcess Solution SolutionFeed SolutionHistory SolutionStatus SolutionTag StaticResource TagDefinition Task TaskFeed TaskPriority TaskStatus TaskTag Territory User UserAccountTeamMember UserFeed UserLicense UserPreference UserProfileFeed UserRole UserTeamMember UserTerritory Vote WebLink
syn keyword apexSObject         WebLinkLocalization
syn keyword apexType            void
syn keyword apexStorageClass    static transient final
syn keyword apexException       throw try catch finally
syn keyword apexClassDecl       extends implements interface
syn keyword apexClassDecl       enum virtual abstract
syn keyword apexBranch          break continue
syn keyword apexScopeDecl       public protected private abstract global
syn keyword apexScopeDecl       trigger on after before
syn keyword apexTodo            contained TODO FIXME
syn match   apexTypedef         "\.\s*\<class\>"ms=s+1
syn match   apexClassDecl       "^class\>"
syn match   apexClassDecl       "[^.]\s*\<class\>"ms=s+1
syn match   apexSharing         "\<with\(out\)\?\>\s\+\<sharing\>"
syn match   apexAnnotation      "@\([_$a-zA-Z][_$a-zA-Z0-9]*\.\)*[_$a-zA-Z][_$a-zA-Z0-9]*\>"
syn keyword apexAnnotation      testMethod webService override
syn match   apexClassDecl       "@interface\>"
syn match   apexBraces          "[{}]"
syn match   apexKeyword         "[<>]"
syn match   apexKeyword         "=>"
syn region  apexString          start=+'+ end=+'+ skip=+\(\\\\\|\\'\)+ contains=apexEscapeChar
syn region  apexSoql            start=+\[+ end=+]+ contains=apexSoqlStatement,apexNumber,apexString,apexSObject,apexObject,apexIdentifier,apexConstant,apexComment

syn case match

" Identifiers
syn match apexObject /\<\u\w*\>/ display
syn match apexConstant /\<\u[A-Z0-9_]\+\>/ display
syn match apexIdentifier /\<\l[A-Z0-9_]\+\>/ display

syn case ignore

" Comments
syn region  apexComment         start="/\*" end="\*/" contains=apexTodo
syn match   apexComment         "//.*" contains=apexTodo
syn match   apexComment         "/\*\*/"

" Numbers
syn match   apexNumber          "\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
syn match   apexNumber          "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
syn match   apexNumber          "\<\d\+[eE][-+]\=\d\+[fFdD]\=\>"
syn match   apexNumber          "\<\d\+\([eE][-+]\=\d\+\)\=[fFdD]\>"

syn match apexCommentStar contained "^\s*\*[^/]"me=e-1
syn match apexCommentStar contained "^\s*\*$"

if !exists("apex_ignore_javadoc")
    syn include @apexHtml <sfile>:p:h/html.vim
    unlet b:current_syntax

    syn spell default

    syn region apexDocComment       start="/\*\*" end="\*/" keepend contains=apexCommentTitle,apexHtml,apexDocTags,apexDocSeeTag,apexTodo,@Spell

    syn region apexCommentTitle     contained matchgroup=apexDocComment start="/\*\*" matchgroup=apexCommentTitle keepend end="\.$" end="\.[ \t\r<&]"me=e-1 end="[^{]@"me=s-2,he=s-1 end="\*/"me=s-1,he=s-1 contains=@apexHtml,apexCommentStar,apexTodo,@Spell,apexDocTags,apexDocSeeTag

    syn region apexDocTags contained start="{@\(code\|link\|linkplain\|inherit[Dd]oc\|doc[rR]oot\|value\)" end="}"
    syn match  apexDocTags         contained "@\(param\|exception\|throws\|since\)\s\+\S\+" contains=apexDocParam
    syn match  apexDocParam        contained "\s\S\+"
    syn match  apexDocTags         contained "@\(version\|author\|return\|deprecated\|serial\|serialField\|serialData\)\>"
    syn region apexDocSeeTag       contained matchgroup=apexDocTags start="@see\s\+" matchgroup=NONE end="\_."re=e-1 contains=apexDocSeeTagParam
    syn match  apexDocSeeTagParam  contained @"\_[^"]\+"\|<a\s\+\_.\{-}</a>\|\(\k\|\.\)*\(#\k\+\((\_[^)]\+)\)\=\)\=@ extend
endif


hi def link apexError           Error
hi def link apexConditional     Conditional
hi def link apexBranch          Conditional
hi def link apexRepeat          Repeat
hi def link apexBoolean         Boolean
hi def link apexConstant        Constant
hi def link apexIdentifier      Identifier
hi def link apexStatement       Statement
hi def link apexTypedef         Typedef
hi def link apexOperator        Operator
hi def link apexSoqlStatement   Operator
hi def link apexSoql            Special
hi def link apexType            Type
hi def link apexSObject         Type
hi def link apexObject          Structure
hi def link apexException       Exception
hi def link apexStorageClass    StorageClass
hi def link apexClassDecl       StorageClass
hi def link apexScopeDecl       Keyword
hi def link apexSharing         Keyword
hi def link apexKeyword         Keyword
hi def link apexAnnotation      PreProc
hi def link apexString          String
hi def link apexEscapeChar      SpecialChar
hi def link apexFuncDef         Function
hi def link apexComment         Comment
hi def link apexTodo            Todo
hi def link apexNumber          Number

hi def link apexDocComment Comment
hi def link apexCommentTitle SpecialComment
hi def link apexDocTags Special
hi def link apexDocParam Function
hi def link apexDocSeeTagParam Function
hi def link apexCommentStar apexComment
