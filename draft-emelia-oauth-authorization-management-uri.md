---
title: "OAuth Authorization Management URI"
abbrev: "oauth-auth-management-uri"
category: std

docname: draft-emelia-oauth-authorization-management-uri-latest
submissiontype: IETF
number:
date:
consensus: true
v: 3
area: "Security"
workgroup: "Web Authorization Protocol"
keyword:
  - oauth
venue:
  group: "Web Authorization Protocol"
  type: "Working Group"
  mail: "oauth@ietf.org"
  github: "ThisIsMissEm/draft-oauth-authorization-management-uri"
  latest: "https://drafts.thisismissem.social/draft-emelia-oauth-user-authorization-management-uri/draft-emelia-oauth-authorization-management-uri.html"

author:
  - fullname: Emelia Smith
    email: emelia@brandedcode.com
    uri: https://thisismissem.social

normative:
  RFC6749:
  RFC8414:

informative:
...
---

abstract

This specification defines a `authorization_management_uri` property for the OAuth Authorization Server Metadata ({{RFC8414}}), which allows an authorization server to specify a URI through which the user may manage the authorized clients that have access to their account.

--- middle

# Introduction

An OAuth 2.0 [RFC6749] client may wish to provide access to a web-based UI at which a user can manage the applications authorized to access their account with the Authorization Server. This is a feature many Authorization Servers already support, however, when you don't have a primary service for the Authorization Server, there may be no clear path for a user to access this management page. This is especially true for decentralized social web applications where the mapping between Authorization Servers and Clients is many to many.

This specification defines the new property of `authorization_management_uri` for the OAuth Authorization Server Metadata, as defined in [RFC8414]. This URI should point to a website at which the user can manage the authorizations that they have granted with their Authorization Server (for example, to revoke any client or active session, or review the security history of their account).

# Conventions and Definitions

{::boilerplate bcp14-tagged}

# Authorization Management UI

An Authorization Server may provide a user interface through which users can manage the OAuth Clients that have access to their account, such that users can manage their account security with the Authorization Server. This user interface is typically at an URI specific to the Authorization Server implementation, and requires authentication to access.

This specification does not define specifics of the user interface, however, recommends that the user interface allows a user to manage their account security and authorized clients with the Authorization Server, for example, allowing them to see all authorized clients that have access to their account.

To allow OAuth Clients to discover the URI of this user interface, this specification defines the new property `authorization_management_uri` for the OAuth Authorization Server Metadata, as defined in [RFC8414].

# Security Considerations

This specification does not define how the Authorization Server should secure the authorization management UI. Authorization Servers should take appropriate measures to ensure that the user is authenticated and authorized to view the authorization management UI.

The OAuth Client MUST NOT open the `authorization_management_uri` in a webview or similar embedded browser, and instead delegate that to the users' default browser, such that the OAuth Client has no access to the account credentials or to other sensitive data.

# IANA Considerations

## OAuth Authorization Server Metadata Registry

The following authorization server metadata value is defined by this specification and registered in the IANA "OAuth Authorization Server Metadata" registry established in OAuth 2.0 Authorization Server Metadata [RFC8414].

- Metadata Name: authorization_management_uri
- Metadata Description: URI of the authorization management user interface provided by the Authorization Server.
- Change Controller: IETF
- Specification Document: [draft-emelia-oauth-authorization-management-uri-latest]

--- back
