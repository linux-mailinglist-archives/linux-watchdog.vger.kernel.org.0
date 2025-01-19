Return-Path: <linux-watchdog+bounces-2738-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4D4A1622C
	for <lists+linux-watchdog@lfdr.de>; Sun, 19 Jan 2025 15:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01B51164769
	for <lists+linux-watchdog@lfdr.de>; Sun, 19 Jan 2025 14:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA2651DED55;
	Sun, 19 Jan 2025 14:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ACRY0o4e"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011002.outbound.protection.outlook.com [52.101.125.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19FE1CEE90;
	Sun, 19 Jan 2025 14:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737296928; cv=fail; b=Q5FefYfUl0lC0b47FLLJ0nS00d09mYJqNqfmGxaHJaqP160V0OAKptHq80817RtsM9BJ2iKsvDrVmiZg/fKNh9EVZU7XgDGWn33yORHDNqIe0J3l3lbgbwpcnRzvE7BorJbeUOcDSiULPtv6p0x/dDWHQYeZhVQgWJ4Mr/JxFhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737296928; c=relaxed/simple;
	bh=nprS1LtgUwVTuF2lA/SyEsWKjltz5cfJFaqaB+MW3SY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Xs9OTSthBGJbSxP5YQmNgeeNnzORc7iJo4vcwknWaXae/NmH1S8TrSkSMf1VhXprY5D5kZAiE96pps6SrVWGSPRRbTbP3QBMGo3UF1neh+4N1hbiRE50VPI7ZF0cyEWfTLRzSrMzZqfo8nWQlNhdJtz4cYlZP1aJSuwgLyhDpow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ACRY0o4e; arc=fail smtp.client-ip=52.101.125.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OlfvuFlUBHRoggbdF6wYrBDCrz4ByNlhvQEEyQuPwGLMeW0snlD+kNlT4ZpufewJUCBJkdog4mkAa85QJ9lO608cPzaV/JWf/yp4rLZCk+1Ai9q1RbdfCypaCUh5pLLmI53vvvQiU1dJJE48G2P8xIEtMq0jBla1a9MDzoEjux+X6FNHUZvhDn3o6NZ3FlITPXNtL+OXK3pouvbPMCvx6mbPL4hLyiLj2AsmrgtdFWI3/9eOc8Z1MnQwp4isL1suc4LByI+6Q0aZ3UE61Tr3/C/47ZmV7vIED+Qr0NF5EPkCxfIOeMdgHg+FRKcrLW4cpa4tEEADTvqq3Kztl6yp+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDdYPH0rgLj9SgrK5Ub34fHNf3ywhrxl/SETXpD3XVE=;
 b=vlWKnDvZt3BCzPB/fJkRaUk6qfFDFREZL7x93R3O1kPRFAquWIy62uwPfOK0jbj70bcAFrN+JadQcdR6XRyGD1ZQATUnNWi+u+XIEsb40qKtRbv7uGN3lqDXrnR2DMXBc84O0GI8FCk/mrF1ZZcVvgLZi65g7oN1hd7HKXfLTfZDLSGpDwvMVcIUOpoqogZIr4Rg0i5RxiTCXMOqmn/boYV5awik37f4D8HzUxbd8i0qWudOxc1YsTvkZo+arlRQsWcVF8iz53DYcjeaspCs7SDXhKora9yP6On0KkZYIhS6bFZenUjEVt9QtKy24czOFtXfKbJfPW3/91kYIZ3oeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDdYPH0rgLj9SgrK5Ub34fHNf3ywhrxl/SETXpD3XVE=;
 b=ACRY0o4eS74ztZMWWt9hWPcYhS+Da5jF4zEfpxV/afiUeqRIoDh2Rk2KOzI36FW03oMoVqvGs5J7zfHrO8Dx9FSL0PdzrjrjfKu0SE2fa+Nvz3K9Tbq0bT0v6x0SA9sD4iv7byO+tLdeEJwaBsewhSXO/XGu40FJ87lc3MmtEHU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYWPR01MB10322.jpnprd01.prod.outlook.com (2603:1096:400:1e6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Sun, 19 Jan
 2025 14:28:40 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8356.017; Sun, 19 Jan 2025
 14:28:40 +0000
Date: Sun, 19 Jan 2025 15:28:24 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH 0/5] Add support for RZ/G3E WDT
Message-ID: <Z40MCK3bJQ/lgrEr@tom-desktop>
References: <20250115103858.104709-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115103858.104709-1-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: FR2P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::20) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYWPR01MB10322:EE_
X-MS-Office365-Filtering-Correlation-Id: ee8af238-5474-4b5d-b2b6-08dd3895917c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BVuwUeLGI0OXoJWcr97RpiMhTECllq0LClqahMH2RrhkrbIWcT+szPUQlmoD?=
 =?us-ascii?Q?lEuQ2tInbrhTv8YrGFjoWGueFWXXbVX3yaZWLzv6MUQN0oR+0ey6RzxTaF86?=
 =?us-ascii?Q?PLUA5SGPtCxtXCwU3kOuBTVezOyo97Vpi5hjnxMgYlCSq1q+ayz/dTOgCx1k?=
 =?us-ascii?Q?XO1l/XFbqUijJf/Q+mvZdX9OIKOw8EbXidtBm45rAJDq8aweNq5Sc+cir8kN?=
 =?us-ascii?Q?N5C7jrmUgUVv+vzWBLM8JzbdXPwCaCf0RpJrOWi5t8OIwQBmK1nEdU4bEZR5?=
 =?us-ascii?Q?QVgLfAB5jyhE+fep70IgcZK07cA3pr9XeCxRGStlvsqTOpNdgFjPpupfCY5P?=
 =?us-ascii?Q?8J+jZX8ZA42tnR+nLWhD8iJDMSmBZAC1ppOygnqaWtAEqEJ+eWHBK57XPQoG?=
 =?us-ascii?Q?0nOglSNWXTbPHlSw49WsZ/oUZpXze8KPT8WSow7WUd9OacRDEs8a4UM2UGW1?=
 =?us-ascii?Q?AZuxfaNe6DaOu5B3T2MrcJi03O1EKLQ2vxMIXYVIIEcDl6W95mo7crxEkOf5?=
 =?us-ascii?Q?ltjoUPDa/v6DlfHRikH6SsMvBLm1NllvQzZtQSDcGlMwQa/cQNj38kynG+m4?=
 =?us-ascii?Q?k5GtUp5g1Li1W+4OEoLJYZMs8Zvq7PRgTSdcgkx+zfUBAFB4sGXtVRHv1mei?=
 =?us-ascii?Q?N9JM605scqbCsv2z96iKChf+bhb/esFKCuHnkjlc51ljHqtRxRRyXNDcNvEM?=
 =?us-ascii?Q?MUJjFvxSkB74uzS/CK50pD2BTG8kYxgBYw9qrXbX/vVSuQpZn71P3AIpCgX3?=
 =?us-ascii?Q?RizJ/HHDk+SgowVHiILoG653aXPf69DDu5mGYD6ZPT23ZBpZ/lkgnfnzking?=
 =?us-ascii?Q?9H6aLCqLsWcewqHX6fw8Um5hOaoyft8ocy+vVQpJTx8AwaqLZ1YAQonySUzR?=
 =?us-ascii?Q?0+miQEI0n6bhZNIlq0nLEffPgHq9rztjBhxKXNGZnw6VRZ1rHep2hE5lAOze?=
 =?us-ascii?Q?bl2e4A2jzpF8Wv3U1+QQKNyl2MGOH+yzAb770K1DTvQVDqPctSX41/gpj4d4?=
 =?us-ascii?Q?t34RAt5HJG9DrNrW/SUajUYAvi3ZekWRLQG5IhxS6tVJGiAP7YRcxqyz/h9U?=
 =?us-ascii?Q?m/qDcu93mNExQeoAgreIr8ekplrwyxr1gJlHSSBsL3kAq5dcf4ZmR3AAu9PT?=
 =?us-ascii?Q?LQqHipOEAZ2NxSaPS3MEe83Rv3TYp0H1vBHLrKzx+SobefYhsyQr222ulL6X?=
 =?us-ascii?Q?ftaS50dte6+C56pMR6CkI0YLqzAC18Yd0UuC45MVTHYXIDE6ClGMRc0AUKoE?=
 =?us-ascii?Q?BRPuaby0Vjnqlgb3aGJ1qheSeyBEI0XNYRB9YzD31bffbI5qlWo0h+0ZRuRV?=
 =?us-ascii?Q?MZ18+Ym0JHZF/8vAmNYkq7tszRSkvJtNt3MBm6nUSE/P7z1bN5x/eXC/rIRb?=
 =?us-ascii?Q?J8V0PsEFKEFtuqWgjNfcsrnfezEuQv0JRk3pDVcrwRy87Jxf/4tIh9JN6WAK?=
 =?us-ascii?Q?NobG8UQp3TZv4qdJ8XAsj6sGEmTr5AZy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fDZw/WCxOUh6xLwT0i7IZPfKSatugLr0gfSlLH9fsnTKkwTjoS8EDfqI4Nej?=
 =?us-ascii?Q?k3qC2PmXCmGWEXq7MifqXHBYemIiz84nrncSx9w54z7A4UZCUICIWRO/boUc?=
 =?us-ascii?Q?pKVqJgJEMBAk1XMtpxU0RaCy2hURUcJihXClzT20Zo01j83vDob0jbP+Jg7v?=
 =?us-ascii?Q?lhAfrhYvaTUGwDR3jUP5C5YhP0ib5XcAT+1Oj6pJvvFsgoGgpLIN7QIqdh9v?=
 =?us-ascii?Q?QxnTk096Isb6F8B6VlQ1LgILRFnpO/bI40wKVxo3MaFADx1dmpo9pGB26dt4?=
 =?us-ascii?Q?bQbS95OgE2Rv6DijskWfaRJdNgig1m/Sqak05IiTCnaYRzBdRUqKuWcYQwtA?=
 =?us-ascii?Q?EkmQgtK2mZIqezfQxJ7uNPGCIWwSK404ng0zSUYvbQp61q7Km9eZp/19nHbp?=
 =?us-ascii?Q?gdrQuFsHG0/Lc2zLKeww8khtwsC09wENoiaUAZFsqFGnhnQm21gIAI9p5/g8?=
 =?us-ascii?Q?qtLDOUI8UhexCpHeU2Xl8n/MXwm2diyeEbZb87u+D1VNcrHJZcWU5+QRtX2h?=
 =?us-ascii?Q?YNtJkiqBZ89lWQdaCmdIbD8DBSpeitJmzRHNOGRpws46OLRIzuJBX2xxsxzw?=
 =?us-ascii?Q?8qRW+uZATIUAtpB3YSjfI8Ht8/xj4EjuAZNaWca9OWdBPv7yb3HThQVNldCQ?=
 =?us-ascii?Q?Tf0dSDLLt1qrfbsmO+A9tuq17TGlPNWT07AskfLiLnfEQLK3k8Mcew6eWoLw?=
 =?us-ascii?Q?aXsUavoA+yNGnyIWKuITX6JQXyYzbYHc+AbCZ5jhPjtzEyUvMWgpaA93nQNX?=
 =?us-ascii?Q?Jd+EBF+M+tlgsxqRib6mmMXcT5bSxw3VTxS3/IBfxn70xEMBY8vtKWM53dIy?=
 =?us-ascii?Q?TJyzqunmBU1gEVsFMhqwNWVnT74jWcvSxzoVDew59SvBvT0wzKDZC7hk6+Kv?=
 =?us-ascii?Q?ipEJ1hj9/kcRE2FU/uQMot1C81qOciTEQkrbqSRU6dFwj11SeHply1ZI0Z3p?=
 =?us-ascii?Q?U2Zdvn5fmOS1VWZKCNA0Ieb5Nr/qHWaUloP1AFe1OEksBrFpx3TkgfUCPR2j?=
 =?us-ascii?Q?Zk5W+UwK/zx8EeoWTSDhvMj0TKG0nsyrCeyVvHUUIeSSjSmHTPrBOHhnhyZU?=
 =?us-ascii?Q?BY6ZVKezD8cbnHk80MONO6dub5WOxxr4l+lUHiu/+vmzH9D42a2zQjRM10k5?=
 =?us-ascii?Q?9jsnzu/o/cts/GiebmkDr6YxYUsDSQI+oc9LAlfD7nAEy6q2bLCIhjZk7Ldc?=
 =?us-ascii?Q?YOfBdKZkapoho4/wwz3gn+FhBSIVxOo8P8pG6gRXLaopmYNJmMXHs+F4SpgZ?=
 =?us-ascii?Q?n5h0EPoR3BCg8z22VicdBTnmIMbb7YvgFMQokp+SFimVosFbi337ps4jscKM?=
 =?us-ascii?Q?Ub6rMjJ81KqDYEdu0lz/7c0St3YutjPa4FbPMCDdrqJAxKVrhFfcEWD+ruVd?=
 =?us-ascii?Q?v73TahaJSu1boEhTLXvRJWkneAOJWkjoXso49Egu0eWMyOEsMo97JqAolsRa?=
 =?us-ascii?Q?l+pwg7oMcnixecDEo6j8HWfnUlHunnIbOqwMu5QaUwYvHvnW7rqIl/nawx53?=
 =?us-ascii?Q?5D/FgJjaFE2UBKEoQo/et6dkW3gPAtSyvcb0KJAuBd7nu0T3MKVPwpKrknrE?=
 =?us-ascii?Q?OsEiZsCzhPeAOXhg4zlwQikZDcz7eQ7WsI4oh0nCMuDqDFxJkgVtvPGf+pRd?=
 =?us-ascii?Q?jETeCY2qolwWIpMeNZrzTmg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8af238-5474-4b5d-b2b6-08dd3895917c
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2025 14:28:40.1801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QgOBe4wPBVXfcGPsIL5AH0SvRESLmrEaYzut2FvhmmVhYOAh0f2gVj8CjrLGLN3qy8IMoTbbPNKERFxktzn+0s6+X75qytcpUxpgZuqwzskgKlslTarVbK32L3SXR4hf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10322

Hi Biju,

On Wed, Jan 15, 2025 at 10:38:49AM +0000, Biju Das wrote:
> The RZ/G3E WDT IP is similar to RZ/V2H WDT. WDT0 can be used for CM33 cold
> reset, system reset and asserting WDTUDFCM pin where as WDT1 can be used
> for CA55 cold reset, system reset and asserting WDTUDFCA pin. Other 2
> watchdogs can be used for system reset. So define WDT{1..3} in SoC dtsi.

For all the series:
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> 
> Biju Das (5):
>   dt-bindings: watchdog: renesas,wdt: Document RZ/G3E support
>   clk: renesas: r9a09g047: Add WDT clocks/resets
>   watchdog: Make RZV2HWDT driver depend on ARCH_R9A09G47
>   arm64: dts: renesas: r9a09g047: Add WDT1-WDT3 nodes
>   arm64: dts: renesas: r9a09g047e57-smarc: Enable watchdog
> 
>  .../bindings/watchdog/renesas,wdt.yaml        |  4 +++
>  arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 30 +++++++++++++++++++
>  .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  4 +++
>  drivers/clk/renesas/r9a09g047-cpg.c           | 15 ++++++++++
>  drivers/watchdog/Kconfig                      |  7 +++--
>  5 files changed, 57 insertions(+), 3 deletions(-)
> 
> -- 
> 2.43.0
> 
> 

Thanks & Regards,
Tommaso

