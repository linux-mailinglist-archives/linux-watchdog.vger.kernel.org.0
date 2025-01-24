Return-Path: <linux-watchdog+bounces-2751-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFFBA1B444
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Jan 2025 11:57:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B24571881392
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Jan 2025 10:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4411CEEAA;
	Fri, 24 Jan 2025 10:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="WpvG3TYF"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011001.outbound.protection.outlook.com [52.101.125.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FE71CDFC1;
	Fri, 24 Jan 2025 10:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737716241; cv=fail; b=CH5ptBz7cRjwJem5aCZefXBErekV4VcZ11vAFAIUlQ0jxrv1P1qkzdvF6uCnJW9z9ej2wb8EkVn2DtgOuQXPITehqMjYyIiC+fDgTQYkf1yNs9F7pUJcJMxr27n2lVeLKRTdbOMtx4N8Wn1aHJDucpx+sRfPNVzvmdPdJAKwM8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737716241; c=relaxed/simple;
	bh=GnfNUz4sN1VFZt022VwCRLNZkFjQWKbVZVilVfBQt+U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eb8JbSfQVobyoH8x43+LiRi7+NzPMOmDi7K27kN4E4fkgt5ig14qujn/gqshtUTHouhfHsMfV1FtF0m69fIlwjJlCeqkBJ9236DyXE93uBpYARGnkgIoZcRsw8L/vS6eD2m4hSTqCwTAAmoTOCIJX/HQp3WvZ18coAAnK4w/Euo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=WpvG3TYF; arc=fail smtp.client-ip=52.101.125.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OnaMqIhiyvsd2fwphRDp1GPtpP4t2bIyTFFTpx3w82YzvRcHj7k8EE4+xfnRk2Oa28c65RklpIsVXjFWrrgxDPM5ZERrEnf8+HOdmyLedRnFei1Iv7Tb8pVhLZehGInxeHoCY08Wk1TJ7Axx8pIY0FvwPAq3ZQwDWoef+bvGvvByIJBb5g/32Xrk5+KE8vLWzmGlQ6hcqsLRbOMpQWkP1xqScqwZdKDrurInnF28lfU3TJ2ew+NJN6dvFmtTPjIOn+ad4dSgAm/ICYyb/W1MIqiZc4suflkGe0l9zr73yMMXpN472qBpKq3pTaTXiRpWr6tR24lsg+Tq4RD8IvIGeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GnfNUz4sN1VFZt022VwCRLNZkFjQWKbVZVilVfBQt+U=;
 b=Muis7acUsgt0RcXrQFiWDsxrxgJ53ufwwOt1thO0IHRsEtBtFYBqAjAuEgDMzH1rq1nBqefkdUq737Tr5EdlQxhgY84wDJu0sem/1T81piQmEK3E/Gs1r0HhVA+SBtKwWaM6ayHeNx7DKx5ZX3DhlNcOwWKOdPZU36hJ7Nay2/Ram9CtEiv9PAhvBE8+e5Q2ey+uUV9N3Odr/O/t3VEpPq4s2Y+m1ujMEwKrDwXIkWRbJGdRSUe5nVv6BkjpewLw2wOGqpa1VGrfV95YdPO9z2QClj3kE7sEEWCIcr/mvH46rwminywlXMRUBp+6dSLrfPJvBPDiwzgy882pPPk6Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GnfNUz4sN1VFZt022VwCRLNZkFjQWKbVZVilVfBQt+U=;
 b=WpvG3TYFrwZsdqDTKjulzAMDlR/gUULjwrivlsTxYOBjz8fVE0tyX7eSpYe33stU+tkWAlhM4K+FVXWyhF8vYNdHflhtczUK+XkJTvRzGUGUDI5i0pOyZFxwspOCFIwX2SI6S/ax8apcGGMSpezbD4CepweyGd+K1yNgPiIpVe8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB6096.jpnprd01.prod.outlook.com (2603:1096:400:49::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Fri, 24 Jan
 2025 10:57:15 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 10:57:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/5] watchdog: Make RZV2HWDT driver depend on
 ARCH_R9A09G47
Thread-Topic: [PATCH 3/5] watchdog: Make RZV2HWDT driver depend on
 ARCH_R9A09G47
Thread-Index: AQHbZznBkfvGK/9M9kaeTTHwnLvzBrMcszgAgAkPAuCAAAaOgIAAA5vA
Date: Fri, 24 Jan 2025 10:57:15 +0000
Message-ID:
 <TY3PR01MB11346D1E5B190101E7F474BEB86E32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250115103858.104709-1-biju.das.jz@bp.renesas.com>
 <20250115103858.104709-4-biju.das.jz@bp.renesas.com>
 <20250118-trout-of-luxurious-inquire-aae9aa@krzk-bin>
 <TY3PR01MB11346DC4A22A2EC0CB0DAF61186E32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <f4cdcb9e-ae30-45ad-87f4-7395db0ab995@kernel.org>
In-Reply-To: <f4cdcb9e-ae30-45ad-87f4-7395db0ab995@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB6096:EE_
x-ms-office365-filtering-correlation-id: e1140dfd-1d10-4373-e5f3-08dd3c65dd31
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?d1UwSm9KMGxZek5MemU0U29IV0w4RU5hUElTdnlOMDl1WTNGQkNUMkRWSEFJ?=
 =?utf-8?B?a21yQ0ZlaTFIMlhrcndQUmxmdG8zUDJmeHl0ZHF5Si9NWWNYUWpLODY4djdB?=
 =?utf-8?B?Ymkra2xreXEvMitIL2hOb2dpTW45SnZXbzFBTEFjOVYzUEMvWXZSRTZ2NzBI?=
 =?utf-8?B?YUx3ZkdWRSsyOThQYVoybWozM3pIZkFQWlFxMG1TM2UrbXZsRE5FNzR2dGEv?=
 =?utf-8?B?WTVzd0F0RkNab2J2NlRNVExxMVg1NG1OVUkrbE1TUDRVVlRVVmtZdml0OTlF?=
 =?utf-8?B?dVczaXRRVUlpclQydUl1ZDZXL0ExRXR1ZVVVT29ZcCtMVXVxMFNjWlh6dk10?=
 =?utf-8?B?R0UvUTFtQUpON2l3UFJQMzRjRCtIbnZWcEdiL1Boc3RmeXlPVWVzYnBXSGJ0?=
 =?utf-8?B?THhjZjBvdVZRRmV5MHB4NklYU1drd0JXY2RQMkVMOWtVdFcwcHFQOFBOYU00?=
 =?utf-8?B?dDd3OGIwN3A4VjkwQjJ0TkxtcXVwSWltc1hmQUdTZWwzT2tjOGVFVDVHcENw?=
 =?utf-8?B?SXlHZTgvQnpVRWVJR0pBMTM2TmRuQTNqbXZPTGRpUmY1RzJlWVozRFBGS3dO?=
 =?utf-8?B?L1VaYThYQmU2TDF5eGoyQUpiaWVja0x0cERIV0JhVllCclBpT0xYM0c4cXd0?=
 =?utf-8?B?dVRWQ3FBT3NDR2tTZDhMVE9lb1lCbUhLVGt2TkdGWEZUK3RONG1iRFU5Q2dx?=
 =?utf-8?B?MEd0Y3FQU041TE8vdW9tTFlwZkl5R1QrNE5MaG5Fa1lBVjR6NEVobk5telJv?=
 =?utf-8?B?NThMdllyTFVWcDc1SzBqb1FhQllNZXUycW1RTERwd3lIbzZTZzhCaEhVV3Ri?=
 =?utf-8?B?SmkyWE9wcUwxbG5WenBsY3Z5S21CdVpscmtuWkpDbEJ1OHU4TDF6bkJFV3Y3?=
 =?utf-8?B?T2VvdHhjQTNXbUkrWSs5UXkzNEJyMmlmMTk4eWpMOVRWQWhFa0I4Zk45bFZm?=
 =?utf-8?B?cW5MRnE5WFhFMjhYYlhOUTlGWTdxS1lKUTY3cVRtNHJhQkJsNjNLN3MrdHJE?=
 =?utf-8?B?QzNicmhhTTZNK2NrQlVHOUErTHR4YW5WeFd3SGVyZmhHVVo2ejNFbVo4OUVu?=
 =?utf-8?B?ZnJ4M1QrdVhLWWNjWktwK3dyelJCS3ZyY005TU5nekFFcGZQUjJ3dWU3VU5S?=
 =?utf-8?B?RHU3bFo2Z24rRDNkSWxHZTdwM0J5ZURrYlpQanpTQnd0enVmbjExNWQ5Z2xJ?=
 =?utf-8?B?dkI1SDdwRnh0YWxrYSt5djEycGZ6RmcvdWwxUnQvUDBpaFJ3NUFySUJmaHNs?=
 =?utf-8?B?NVVYWWZKTi84TnhDMExKL3lKdENMbGlJUjVoY09FMFR6dklzcDBxaklLT1k3?=
 =?utf-8?B?QTNxa1NjVnhLNUJjelRBTWQyNFJMTmhsTEZvSWNHTFRlNUFhdnFmOEFmaDBq?=
 =?utf-8?B?QTZDVzUrN09ITzI1a3Myaks3T1lyYmhjSTdIQ0FGRXhWcjQxbkJPR3JQNnVR?=
 =?utf-8?B?RmlwMXl6NXJ3SEtNTEhqTHhJRXJka3F6VnVVMkdJMnZpdjRPdDNBMkxtRGcz?=
 =?utf-8?B?b1RuVGRzRWxXeFJvWDVHazA2UCtQdjRlWXE5VnN4Sk8ycDc4SlAvVS91RWJw?=
 =?utf-8?B?MC9TRjl3Q1o3M2pDQzNGT3UvbWlwU3BGRno0OVN2RmVZZk11akh1a3BYMDVI?=
 =?utf-8?B?MlpndEMxRDZxUDFQa1d3NEdMZnY3bG5KUDdtTm01WklrdHM5Mi9UMjFDRHVF?=
 =?utf-8?B?MzJoRVdjK205SHphMFZyV0lrWUpMdERmTTlZY0ZqMXY5ZVh5SzV1cFlHUEkr?=
 =?utf-8?B?Rzk0V2F1S3RzMnc5ZHNnUkJDTUhZMEV4dWpTdXZoa042OXhoOFZDanoyU3gw?=
 =?utf-8?B?RSt3SjJUMDB6ajQrZ0M1aU9xQVFpK0pvS0ZHeFhQMXBtZ08xOHN4cjJDZVRU?=
 =?utf-8?B?dGtoRmIvcVpBTFI0WDZHZ3gzRVdDelJ2UDVNQjlTd1BiSE5NUVZQWGlPT2Y4?=
 =?utf-8?Q?WSrRiO0bAtW6EzrGOjTkIsTxMY+OmGJ5?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K1U0VmhVRlJaams0V1A4dEd1UllZd0JNbVg4WUZvdm9wTFpLUHhtRGE1bTQv?=
 =?utf-8?B?aXBLdnJHRmtGWHNaNHZ3Si9hdlEyRnJ1U0VPNjNnYVV2Q3RSQmtabDhwa0xK?=
 =?utf-8?B?WnNleTc3YTRwOVBySFBreSsxRDdsd1JsNmljejB5bkZDeW8yOEtCeVFNNS9R?=
 =?utf-8?B?WVVWT1BLbnFoVDg5Yms2VU5CYVBqeFVNL3lmT2ZNL3lqZXd5SXczSE9RRnhE?=
 =?utf-8?B?TGFqV3d5SGlYMERUU0FNNktuNEVOODR6Z1FZL0IyWTZjMmFLYXVGbGFCbkYv?=
 =?utf-8?B?Sm0yTmorbGtGM3ZUaUx1UkZsYkNFbGlDK2V2YzVUUjFtS09xQTFJYVIwVnYv?=
 =?utf-8?B?RU02cVV6Q1BuK09aeE5LNnhGTnJXbmdaeXlmSndCZWl2QWVMSUI2YTQ0V1Vm?=
 =?utf-8?B?RnBJSU9qcXpaN1c4ekV5TWN0bnVrTVRQcnBpZGJPaFRCUlJMa005Z09sSjdo?=
 =?utf-8?B?aTJEcVhXSkFNMVRIZnc4TDREbXcyM2lGUG4wZW52UGV6TUpXYjB6SllrMXUy?=
 =?utf-8?B?aXBtNllCQlVTa1dHenJTZENVejFDSzhybVh0N0tiS01kVWptK0RaWFVlbjVF?=
 =?utf-8?B?RUI5VjRNMVBBYXZqMkFMTWNIRFA2bWlVRTNIVVpXUnNONG5BTnRPSDRVTTNR?=
 =?utf-8?B?QWx0OW42YW9Jb042K3pyK2gvak83Q21nbDQrYlpGeUl5cGpQYmtnOXJzbXEw?=
 =?utf-8?B?SXBXNHh0Mm9SbDdQS2s2RlM2NUI0TEZBOHJsUXRCK0VPYjNsbzJSdkhpSWZC?=
 =?utf-8?B?cmYyb0tFWHFpMFNqOXovK3lSaTZGUzJFQjk0SW94eDRMRWZqZmFma1dvOFZ4?=
 =?utf-8?B?N01lRkd4WXF4QmNscFRDNkFEWVNhNExKcjk4clBBb3h2eWVrbWh2YXlmYjBZ?=
 =?utf-8?B?a0N4UXhYSTBZNHhJSWZLaXo1MFIrdDVtL3hXMTZ4Q1krZCtpa3g3NmNWblMv?=
 =?utf-8?B?Ykt1WmdWdXd0TW5oaUJRaEFpUGF1RHJLZ0NJN3VGc3kyZzl6VUt3c3p3cWR5?=
 =?utf-8?B?OENWT3FRbEFFa2RndmUzaXNxWWUxenltaXJOaXZCN0RnYXNhcGFPOWZtV05u?=
 =?utf-8?B?bSs2eWlBTVQvUGd2NGRqTytyRTRDYWkwN05vUGF0VWtOU3NvYzlZMCtmVjJO?=
 =?utf-8?B?SXNJK054WW9uMFVSbG9Hb0syZkYzVTMvOHQ0SUtZaDdKbmNRVGxJLzIxN2Qr?=
 =?utf-8?B?QlE1Q0kzbDhVemFOWVBCZWNLZFlFdytvZ0tJRjdqdU9oRjloSy9GUC9keU5B?=
 =?utf-8?B?amxGVTRRYllOWHlpd2R3dklnaFN5L3FxWC90SzBaMzVSSkFUZUNYZGYvbVpy?=
 =?utf-8?B?cVpDNjIwQ010L3hobncwSks4d09Ic2pHSnpVZzBZZS80MVRLanJTM3c0d0NH?=
 =?utf-8?B?YXM1LzdmNjFJUURZeEsreVhtajFDWDFtTEJQWGtSano2a1VPSXZjUUZNZC82?=
 =?utf-8?B?Rld1SHFId3hLdzlMZ3Z2dytDdHlOR1pmQm9yUWtZZzRReDhJeEZnaVVzWHkw?=
 =?utf-8?B?SVhnbE5OalovZUV0bkhGbExvN2lORU0yN0poQTVrSkZwR0J6aXJXUDhPWWpv?=
 =?utf-8?B?M083Zml0bWl1OTRjK3BxdkZWMXd3MzI3M3N6YXBnYXArMExIUVJvUDdLWFV0?=
 =?utf-8?B?T0c3ekhxQWU2endPaVpYdkFiK3Y2WCtpbGdJcXYrK3NjdVZWWHR5aC9BcHR0?=
 =?utf-8?B?NE1vVjFteCt5aVo0eEdTSEsyeDg5UDZCd1dUWHpOa0QzWUo0NC9aeWVZUmky?=
 =?utf-8?B?Q2tkUGt3VDNvR0tJZm52aWo4U2ZWcGJFbGV5Z0l5OU1NWWxVcS9oZU12SEMw?=
 =?utf-8?B?R05UZTFDZTNmQmRrNVU4ZVFvYXdhbUx2WlJEMXl1V3NGbFpYZ0Z6dmg4K0ll?=
 =?utf-8?B?VUZZZmhYT1JWUkVhanB0SXFZYXJua3A4MUl6UWJaWGgrNWZTcExKV2xadFV5?=
 =?utf-8?B?czBWOUZsNFNOTHNwbUZQc2VwWWV3U3Ircm00dHlYUnNvbG9icC8zQThubXFJ?=
 =?utf-8?B?NHRBNVo2cStqUkZnU3pBVm00VEpIUlk5bU1GRlJjNWpWVmh5K2Y4ZzN5c0gx?=
 =?utf-8?B?UDQzUFN1WXYvM1IxNU90Q09lTXlicVd1anVvZWlRblVZWUtmUDRmQTFTVUdU?=
 =?utf-8?B?YkZnazN2eXhtdUNqWVhvdnBVTTZRamR4dXBsQTE2VW1JL09ySEJ1c0Vtblcv?=
 =?utf-8?B?UXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1140dfd-1d10-4373-e5f3-08dd3c65dd31
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 10:57:15.6322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QegmXylXSgtJeFZOt3VdtZ++EFHqK1gl3xwKaiG5EJ7TdnQzeLvrlvmx8huTOz1/dAFIkfRPVjT2nlxVWYDDay2p3/kv9RH54NpvWllYWuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6096

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDI0
IEphbnVhcnkgMjAyNSAxMDozNQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMvNV0gd2F0Y2hkb2c6
IE1ha2UgUlpWMkhXRFQgZHJpdmVyIGRlcGVuZCBvbiBBUkNIX1I5QTA5RzQ3DQo+IA0KPiBPbiAy
NC8wMS8yMDI1IDExOjIwLCBCaWp1IERhcyB3cm90ZToNCj4gPj4NCj4gPj4+ICsJZGVwZW5kcyBv
biBBUkNIX1I5QTA5RzA0NyB8fCBBUkNIX1I5QTA5RzA1NyB8fCBDT01QSUxFX1RFU1QNCj4gPj4N
Cj4gPj4gQnV0IHRoaXMgaXMganVzdCB3cm9uZy4gWW91IGFyZSBzdXBwb3NlZCB0byBkZXBlbmQg
b24gcmVuZXNhcyBBUkhDLA0KPiA+PiBub3QgeW91ciBpbmRpdmlkdWFsIFNvQyAoYW5kIHRoaXMg
aXMgd2hhdCB5b3UgY2FsbGVkIGhlcmUgIkFSQ0hfUjlBLi4uIikuDQo+ID4+DQo+ID4+IEdyZWcg
bWFueSB0aW1lcyBnYXZlIHN0cm9uZyBvcGluaW9uIHRoYXQgZXZlbiBmdWxsIEFSQ0ggaXMgd3Jv
bmcgYW5kDQo+ID4+IHdlIG1hbmFnZWQgdG8gY29udmluY2UgaGltIHRoYXQgaXQgaGFzIGEgbWVh
bmluZyAob3IgaGUgZGlkIG5vdCB3YW50DQo+ID4+IHRvIGtlZXAgZGlzY3Vzc2luZykuIEJ1dCBy
ZXN0cmljdGluZyBpdCBwZXIgc29jIGlzIHBvaW50bGVzcyBhbmQgaW1wb3NzaWJsZSB0byBkZWZl
bmQgaW4NCj4gZGlzY3Vzc2lvbi4NCj4gPg0KPiA+IEN1cnJlbnRseSBmb3IgYnVpbGRpbmcgUlov
RzNFIFdEVCwgSSBuZWVkIHRvIGFsd2F5cyBoYXZlIFJaL1YySCBTb0MgY29uZmlnLg0KPiA+IHdo
aWNoIGlzIHBvaW50bGVzcy4gTWF5IGJlIEFSQ0hfUkVORVNBUyBzaG91bGQgb2sgaW4gdGhpcyBj
YXNlPz8NCj4gQXNzdW1pbmcgQVJDSF9SRU5FU0FTIGNvdmVycyB5b3VyIGluZGl2aWR1YWwgU29D
cyBhYm92ZSwgeWVzLCB0aGF0J3MgdGhlIHdheSBmb3IgZHJpdmVyIHRvIGxpbWl0DQo+IHRoZW1z
ZWx2ZXMgdG8gdXNhYmxlIGZhbWlseS4NCg0KQVJDSF9SRU5FU0FTIGhhcyBBUk0sIEFSTTY0IGFu
ZCBSSVNDIGJhc2VkIFNvQ3MuDQoNCkN1cnJlbnRseSBpdCBjb3ZlcnMgQVJDSF9SQ0FSX0dFTjEs
IEFSQ0hfUkNBUl9HRU4yLA0KIEFSQ0hfUkNBUl9HRU4zLCBBUkNIX1JDQVJfR0VONCwgQVJDSF9S
TU9CSUxFLCBBUkNIX1JaRzJMLCBBUkNIX1JaTjENCkZhbWlseSBTT0NzIGFuZCByZXN0IG9mIHRo
ZSBpbmRpdmlkdWFsIFNvQ3Mgc3VjaCBhcyBSWi9WMkggYWJuZCBSWi9nM0UuDQoNClNpbmNlIG1v
c3Qgb2YgSVAncyBpbiBSWi9WMkggYW5kIFJaL0czRSBhcmUgaWRlbnRpY2FsIHdlIGNvdWxkIGlu
dHJvZHVjZSANCmEgbmV3IGZhbWlseSBTb0MgQVJDSF9SWkczRV9SWlYySCB0byBjb3ZlciBib3Ro
IG9yIHRvcCBsZXZlbCBBUkNIX1JFTkVTQVM/Pw0KDQpDaGVlcnMsDQpCaWp1DQoNCgkNCg==

