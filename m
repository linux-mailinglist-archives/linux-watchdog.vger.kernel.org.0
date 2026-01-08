Return-Path: <linux-watchdog+bounces-4772-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 231F2D034A3
	for <lists+linux-watchdog@lfdr.de>; Thu, 08 Jan 2026 15:20:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67E823248BCC
	for <lists+linux-watchdog@lfdr.de>; Thu,  8 Jan 2026 13:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16642435301;
	Thu,  8 Jan 2026 13:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="tv5eWuRQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazon11020072.outbound.protection.outlook.com [52.101.188.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665AC42E4B8;
	Thu,  8 Jan 2026 13:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.188.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767879311; cv=fail; b=NuQanCgJcRrLugZzcDkIr/yCj8UOQGKyA/SlbOaVTs5wYX02AQRLy/Ayzxwvfnj+K/4RZuIzqyGhOqf+jEgBZJ2CK/SLl15AqCez0sU+0DYpAqnp2qqkhS9umSmkQ559AcPS0Em1sIeLZaXMQQlp7A+ad3S5+L3vC0A262q6hII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767879311; c=relaxed/simple;
	bh=E86pHIFTLdezTwMmLm+ogEiy7oZ0PUXfgeJfOKICG2c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CQEwk2I5upQHiWZ55CDcDmOuYKJEhycWJQlHgutqK395Z4Mp24g1f2RHk7Nk5WvDEGEzkX/Yl7yCSIeSOKo68qcpxr89nln+R6AA4P/GCJn5QJFMU+o0Kq2bSiOEzoVTfOJuKg8K7jrV/5VXS/4TZzH45JRLBwvi9wCyhGmJBsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=tv5eWuRQ; arc=fail smtp.client-ip=52.101.188.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCIpjfx5ai57WTxOdVU0YGospXLog0q+OEEqg4LUVpE4spNyT3jasDCZ4vl/jv27cH8mDkfagoe8Wq9XiddLIzszXF0k5qJ03eRCpRHdAX9CQWwJPY/I2lYRsiR63bDGx44RkbdQ0+qVHXAkVaw/6RPIkzMMrfgJukPbAsL7uwATFPmykziFkpXUQleNfV5J8k9iYv/ZZMFyGS4BsaXBTzcLtQmQOjt0rdehdAYIFNL3e0LjA3YrdTc4Csmg+5wHuQumFC6vyeuiEu8iccsJuh9PbQcz1GikW+2bd8hsf7cBLRQdYReEHR1mSd/bo789nNqVUtLolbexIQf7cozx9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E86pHIFTLdezTwMmLm+ogEiy7oZ0PUXfgeJfOKICG2c=;
 b=PJRnTh0EIm+5/ivNXY9GSnJU8x8A65ntpSyGmDYQl4h1ZKZlSohhoL3RXlnb8LzUttvoSMgWDzAV4qDE8hnxqLivBBwk968bu6lBBsuD18POF8Kxy8lOZMwZ7q9MLnBvbt0kioyV64ZBMkP2JTWhYUiqgCfuPWNlSgpWXHLETQeiUJcSvJZJEGlVSyOW+usrP3X3VJQbHxlt+BTd6tN2Quwpvb+8hx3zB50hVBO9qihEyrz75QESKPafiI80FHxGgq53iucKeZiYGcHTi6D4Tj4AK0DQn9iuFXK5JrYWinfnvSQY0xrJWTEWZAmhZSR6dXTXGOESMnVR+M0tUmLynw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.85.4) smtp.rcpttodomain=intel.com smtp.mailfrom=duagon.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=duagon.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E86pHIFTLdezTwMmLm+ogEiy7oZ0PUXfgeJfOKICG2c=;
 b=tv5eWuRQ/5AkDpPHXWW8CtRX+0CDPzGu1XZtIGMg/4s3uRm6F3Ykiac+9c2K6mqjGFyi+m70hthghHI44YmY+Dd0mKqpTwtPib9ErubfZ7Q2NkZ4OZFk27RhUVEorcJhwhJJsSnpDj/e4QK8qDV8LqfAzHoWdM90AVotNdhogjU=
Received: from DU7PR01CA0026.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::22) by ZR2PPFF0D59E377.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:918::2f1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 13:35:00 +0000
Received: from DU6PEPF0000B621.eurprd02.prod.outlook.com
 (2603:10a6:10:50e:cafe::f3) by DU7PR01CA0026.outlook.office365.com
 (2603:10a6:10:50e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 13:35:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.85.4)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.85.4 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.85.4; helo=ZRAP278CU002.outbound.protection.outlook.com; pr=C
Received: from hz-deliver01.de.seppmail.cloud (2a01:4f8:a0:900b::219) by
 DU6PEPF0000B621.mail.protection.outlook.com (2603:10a6:18:3::20a) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 13:34:58 +0000
Received: from hz-glue05.de.seppmail.cloud (unknown [10.11.0.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver01.de.seppmail.cloud (Postfix) with ESMTPS id 4dn5Vp2nYnz4wvs;
	Thu,  8 Jan 2026 14:34:58 +0100 (CET)
Received: from hz-glue05.de.seppmail.cloud (unknown [172.18.0.4])
	by hz-glue05.de.seppmail.cloud (Postfix) with SMTP id 4dn5Vp2XBsz1yNh;
	Thu,  8 Jan 2026 14:34:58 +0100 (CET)
X-SEPP-Suspect: 025877b5af0344b2892b1e9f801dbf5f
Received: from hz-scan01.de.seppmail.cloud (unknown [10.11.0.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hz-glue03.de.seppmail.cloud (Postfix) with ESMTPS id 4dn5Vp1zwwz1yDk;
	Thu,  8 Jan 2026 14:34:58 +0100 (CET)
Received: from hz-scan01 (localhost [127.0.0.1])
	by hz-scan01.de.seppmail.cloud (Postfix) with SMTP id 4dn5Vp1NP4z4HkN;
	Thu, 08 Jan 2026 14:34:58 +0100 (CET)
Received: from hz-m365gate03.de.seppmail.cloud (unknown [10.11.0.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan01.de.seppmail.cloud (Postfix) with ESMTPS;
	Thu, 08 Jan 2026 14:34:55 +0100 (CET)
Received: from ZRAP278CU002.outbound.protection.outlook.com (mail-switzerlandnorthazlp17010004.outbound.protection.outlook.com [40.93.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by hz-m365gate03.de.seppmail.cloud (Postfix) with ESMTPS id 4dn5Vk1JBxz1wR1;
	Thu,  8 Jan 2026 14:34:54 +0100 (CET)
Received: from DU6P191CA0020.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::27)
 by GV0P278MB1640.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:65::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 13:34:52 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:540:cafe::bd) by DU6P191CA0020.outlook.office365.com
 (2603:10a6:10:540::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 13:34:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.79.222.204)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 20.79.222.204 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.79.222.204; helo=de2-emailsignatures-cloud.codetwo.com; pr=C
Received: from de2-emailsignatures-cloud.codetwo.com (20.79.222.204) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 13:34:51 +0000
Received: from ZR1P278CU001.outbound.protection.outlook.com (40.93.85.55) by de2-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Thu, 08 Jan 2026 13:34:50 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=duagon.com;
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6) by
 ZRZP278MB1826.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:b8::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.3; Thu, 8 Jan 2026 13:34:48 +0000
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e]) by ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e%7]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 13:34:48 +0000
From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
To: jth@kernel.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net
CC: andriy.shevchenko@intel.com,
	dev-jorge.sanjuangarcia@duagon.com,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Subject: [PATCH v2 1/1] watchdog: menz069_wdt: drop unneeded MODULE_ALIAS
Date: Thu, 8 Jan 2026 14:33:32 +0100
Message-ID: <20260108133332.24560-2-dev-josejavier.rodriguez@duagon.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108133332.24560-1-dev-josejavier.rodriguez@duagon.com>
References: <20260108133332.24560-1-dev-josejavier.rodriguez@duagon.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MA4P292CA0004.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::10) To ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:34::6)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR0P278MB0523:EE_|ZRZP278MB1826:EE_|DB1PEPF000509FC:EE_|GV0P278MB1640:EE_|DU6PEPF0000B621:EE_|ZR2PPFF0D59E377:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c428187-f45a-44f3-3912-08de4ebab7ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?rpUhAQWQYEuyknSjOlsFrXYFuKq4Nio9wjbzfn9L8QQlPuP8/Y7G+YL43RQ3?=
 =?us-ascii?Q?ps2qCh67lUphVMluORS5igCsgEgXVeqnNndGXcWUKu3q+H1n4gTg4KRvR1So?=
 =?us-ascii?Q?xS6TipZyHHRy0sO27bAvja3q7iOiVL5FxPU0I9zM7SMtH88KEMtrz484wlz/?=
 =?us-ascii?Q?xbN8ALWOHpm05NBcGg05I9BQp5V4LJF8rqPbU0Tnvc7R2thoagrrI1jtkuZQ?=
 =?us-ascii?Q?sQMukjV5dHlX7N7zprB++uvm5mhdP0SQ3Zt4yd8CgabBGBg7tzbqs2LVt4TL?=
 =?us-ascii?Q?d/cE3SvvXVS/9Gq4YI15IsJK6KtSZLvqGQyjeexpFYSSepSyU7ccaI/1ELmN?=
 =?us-ascii?Q?MTQs02PJbYcsNmcMKbypuaOgOFPL1cJJDNiMasgh9adTKeK6KitjaH7qrc3O?=
 =?us-ascii?Q?7T9kvpgnsKAjq+MJfJJnnDAWyP5rUgYbtkU7uL0BaI1glGLmitxf3Kx6nKpF?=
 =?us-ascii?Q?hQfRJJHj2e4qtNCzkPG6kDPDdGGs7p1zssRPMch8xzHSw+NkkcASZn4VdMvJ?=
 =?us-ascii?Q?uVEcZ2NQo1+HjUBoOcMw+5ddUPiVrl4RithI763i0bSTYtiPejIjaLF8XGVh?=
 =?us-ascii?Q?p+3XKtjUqnIFvkUg4gyUbkt1sJ2G91GddMNzuOa0MyZ6S+UfqxevsUDqE6My?=
 =?us-ascii?Q?eD+o4udYdFzk6d23pzmCQmBrXvu+Ix7jWsy+Zr74ZnGLJ6nUWVi8iDBFRr90?=
 =?us-ascii?Q?HacYnPoyQRkN6HsQqHENtYm/GL3VjnXbSYiSN/wd0IIilneyiMB01J/pDItb?=
 =?us-ascii?Q?LcCaCQ8+l0T1lLe0SCzpvRCrW3TAw/Zngz7r+994ZNhxGpZ8nKFEMHQte7V7?=
 =?us-ascii?Q?HYvyzbEwJ1LxoEc6Ju0VLc1w4sf47dlkmveodfu6tsehidLWlzkvr0RErilw?=
 =?us-ascii?Q?giv8toTXuGlA4L65uX0jHvaB7hI4u5jPn2ltVi/jiwGK/RC1XgZMogGcDpjB?=
 =?us-ascii?Q?nFR0RjlJxkytvqKvVcxVPiL7H35TvrmNDNhzn4RIeE+17Nz0YNkRIHv4p1p1?=
 =?us-ascii?Q?5Eqj2fZDH9TbHI+cEDV4et5X0+Wd+0s9KftxaFceBFrWHk6f/TyzeonLe3Zz?=
 =?us-ascii?Q?sXL7b1eW1EPA02tX4af9yQupk6Gcurh5GHxNr6zJuDfrzne480XowIFbNwQ8?=
 =?us-ascii?Q?QylruMvJGoEMb00xK8RqXbE6gOLzwgUlwoEiIzyzSGUh5Px8Y13wJ/HzAk0o?=
 =?us-ascii?Q?KN7kpKfX8nrhI+S93K8VhslaDrhH629qiP7QnMz3b/W0op/nInytSrampX4e?=
 =?us-ascii?Q?cBJdz9wGifr3YroQnVJnIqnyvoZxUri00I7CcAvnBXrr+dFY5CMmbpc8Ceh2?=
 =?us-ascii?Q?/LTjYps6Pzf10Dw0ork5isySG9/9tp7DeIdBb0/Z/gQOIFSm2Ja1MDXJjL9Z?=
 =?us-ascii?Q?jPx/Wc8r4FdoXAA5vXtnnL0PQ9NVDE3CfCxZJq3Swouj7fEaa2+m2eLBrE7z?=
 =?us-ascii?Q?d3sUcPOopSnbrF94hPn+kjuVjVF1K/usadpo6bsOiisOGT3qo+M0e6BTb92b?=
 =?us-ascii?Q?WHedEvEAP/S93dB5F8Gvui72GN9XwYqOIgbO?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRZP278MB1826
X-CodeTwo-MessageID: d1e4e4a6-ee3c-4d5b-8356-030bd09afc2c.20260108133450@de2-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 1
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
 ee6fabfa-a79c-4cc1-10da-08de4ebab1d3
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|36860700013|376014|1800799024|14060799003|82310400026|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?MGW3zkI80f6+Hfe3zyHfFkceoOk058wx0fyR8vZw8ll0aQXpqSAtXzrOn7Pw?=
 =?us-ascii?Q?8ck0Z91Q8h6tIOx8Ynl1m8tDFbSYjw+MaONj5v43NxvfMR7ayoxZQ7T493hX?=
 =?us-ascii?Q?TifxqOYWAx/wLtc4ePSjqf9+Oa7DcR05puOpGhunLwbgcnK5I50oQsobjIc/?=
 =?us-ascii?Q?Sfbwe3MS81C3IYdE7m6V+ukjFjQ/9FB8XbUrFwnT27KomzOQgxelnBgHeA78?=
 =?us-ascii?Q?bVb0xmfIo63QiWQDCQ4m9yiXLk5YEdHHWyTrB0O0bzBZIcq8mVy/vdUJzwnL?=
 =?us-ascii?Q?Nq8KG6/rvJjWA5/aWL+AApb9XX8yN18CorX6pUrUFthLtVHtr7hdNBs1UuFJ?=
 =?us-ascii?Q?9j3ySMzdp2ea7HCIwd/Kti/4TyEGoUtpgdaJUBGCDd9SCDrfdpEeHHM1xBjx?=
 =?us-ascii?Q?AfK7QuASBefsClbRnaBLrLrfI69isiNE9fSwvEpvOjyz1LYcfiULTUmYUxnk?=
 =?us-ascii?Q?321ZRscpem8sddvwQy4RNUQxjBO+VvbPhmUQbHYX8LH7TsT/OtNl7PPKUeL+?=
 =?us-ascii?Q?vLIcWrhfcspRnmxW8AYDLFuwfuCpLL31MotBjiS9E8kHml51vJTN5cVvjFvl?=
 =?us-ascii?Q?dSLwKGmVBct/RnkzIO4BMWeawVB3ygAagau1rZe64y0ri77IFxuP5zWujMJE?=
 =?us-ascii?Q?nE+w8ZzQkTa0lm1onumE3lHac2Az681N2ozMia+vLU+a8jRTmmhY+nh33gVT?=
 =?us-ascii?Q?RM/ZEc5UJiKcyR7chjEhaudnf1aEOoTgxPX/geZeFJskiOBCUEXP/sk8aEJi?=
 =?us-ascii?Q?tezG88jy7hsu6Cvas6vQ1/WHpBhdNAz1xh7rfcV/RDS/tuqsG1PMcBaF5pQH?=
 =?us-ascii?Q?jqfVbmuzw5v+qIE9e/riQs0GsIgbtzDBzMAsBuVcllk2Xk0BUhrHJU3h9fkt?=
 =?us-ascii?Q?/c/AYooazC0fzbE696QdkFcKA0wCuPtuadMghUxN/bbCwFHNKyJU4T2Xj/Yd?=
 =?us-ascii?Q?RPOObohwH04lZ5QybiIRu9sBS9DLBmJVPZ4X1UzSoMg62ajHVRwHusFwzUNJ?=
 =?us-ascii?Q?zqANr6AY+xKE0ybZJ1HtJUNL3u0C+zco0uLLNvPfmPNmzo+4jRmtNQih3YJV?=
 =?us-ascii?Q?otOEc86rYKVmDwFXrXW+NO00uimjBOxtSRE5zDijUjdo5wJgwHTjBzTTW+Pb?=
 =?us-ascii?Q?gIh+YRBnluT8Ks6PtHvL7hp9eiddhm5VPOMDk9yX6KQJ2OrFu3xMj5n2DTSo?=
 =?us-ascii?Q?A39Ol535mh3ugrf+5j6eowxB1oeSw8RxqM1TfyTc0XIY8LufttPZ4kNlkBPi?=
 =?us-ascii?Q?66/k013O8JBg3w4LlLNybyh3wS045Ok+8FWAkkH6cbHkNDbVnED0SACcgkH1?=
 =?us-ascii?Q?Lm/zqK8QdbHcziae3bJlkAKg04WhGG2P1MyZiI3ot0GtbUz6hj0bZK+x3I86?=
 =?us-ascii?Q?5ajrowRRTRtE5pTsXn4r8KwePPTjNJRmgi3EDFE+8J9FZAtwImpUgY/qrEWE?=
 =?us-ascii?Q?RjATLk7/J3w69OxAWF28+a5jVdthiTc3OMJssToLpLVzwThFshz4oO2MoLp6?=
 =?us-ascii?Q?9O2Bi3bQkv3l98w8Ux/nxqz85IQ50XafpbN4ppnbNQl81nD4gXP2nD0vo04Z?=
 =?us-ascii?Q?MJ1T/DqlQSY3UceUA+4=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:20.79.222.204;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:de2-emailsignatures-cloud.codetwo.com;PTR:de2-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(14060799003)(82310400026)(35042699022)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB1640
X-SEPP-CCCVersion: 2025-12-11T08:12:51+01:00 9ed91da2
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.85.4];domain=ZRAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.85.4];domain=ZRAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	91dd4e0f-ce08-4b89-1105-08de4ebab3b2
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|10070799003|82310400026|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XfqvuZxSRh8kJWfynBaNggDeYoMZs4lBeD11wOmZ497ubwAV61rEbsmwBFoC?=
 =?us-ascii?Q?FBIxKeupDthuBlRKVTcpRG6ZIc1DdEm1ZJgUsjOy0JCnAGytT3D/AGtFmWEZ?=
 =?us-ascii?Q?JuP9yKodPRI0HfuR1WqApd7zg4SoYYyMjKax54jo/V33YgOd/1O84bRVryF4?=
 =?us-ascii?Q?HZm5hd0Hj0UdE0s7M0bF8aAh9CckW5y3gSIlBSTZ/mQ69HHgPXDwXEBKv5lc?=
 =?us-ascii?Q?6HUB/3ySs7BUxAbJNI94963P+rGkUGi5BzeY3dPBSikAfMzkwp4QS62PWpje?=
 =?us-ascii?Q?CjzV8YdRzRgubIHOSrx1LQSY2wbBFb+Qokk6cVU8AsWzCc4DQrjaWZSSbBVm?=
 =?us-ascii?Q?G/xwP0t5gO9v7cbr44tO2Q7XW2GgCWIhQMgDAhb4jvhI5DrbNPuJdwhQscaz?=
 =?us-ascii?Q?Vp+zE7IZ9J+hCSQaIhBss2/9WfD0Sdex3YPtr/yxJtOMc1SuaIEP7Hs7mJt2?=
 =?us-ascii?Q?hZvqodGXeSe6aF37mUQ1bFD/WnIsrJiqul/N+/yB208Mk3Xp1vhzUDskFnnW?=
 =?us-ascii?Q?iPzIYa2NyttTqAwfaNAXDDXyQvIjaeWR0B1bN+qGSz3P7bjkH9dlkrRf0/sn?=
 =?us-ascii?Q?ZPkucpuPvpjD14Xu8HwJxjMNPjETnKa6kNoTEwFbZ2+u1FvJim6nO+WlIiqP?=
 =?us-ascii?Q?FNClO3QBJlzvYdosLFJf7UQyrGb8C/0jh0mmKEDieQPbbgg0Cl2KZA/pD3NA?=
 =?us-ascii?Q?/nIHlEhYLP+D5WJp1R6XAfBPfX8RiquOSkxxZpz/k5WQI8ywQw4mbw9CXjmE?=
 =?us-ascii?Q?aa2MTJEbSDrSE71rqFuyVh56cJ//RRVazvXYU43bnPVIea04oI3e2GUxrZtD?=
 =?us-ascii?Q?EKXRQtdBuD0MuIkLVyD56EWooapb3FQY075q4TyWuKatwQPEoXIWQrF0omgE?=
 =?us-ascii?Q?+dN2RbfMJGVXD6W7KHmAzs1/KUe6F9mXNtwjQ1Fn2O/rkAldKQxR2GTpe6xq?=
 =?us-ascii?Q?ZE19JbJdEADq7TlOdV7t9qZINCfhma3FpbdeBJDrpcbpQ2/dtJ0qncBPFRQE?=
 =?us-ascii?Q?sGdraLQynx/gEkTkfNbhELZd5CTj36Smi6y3djHzzbJqYeAis6NDXOsZq9aE?=
 =?us-ascii?Q?skaAAW/bC0Nx1VjAHDqYI1TclT/VsXkHynC9q4lJDLzFaH4kHEEpffdzYwE7?=
 =?us-ascii?Q?9atgQmp5bEdn?=
X-Forefront-Antispam-Report:
	CIP:2a01:4f8:a0:900b::219;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278CU002.outbound.protection.outlook.com;PTR:mail-switzerlandnorthazlp17010004.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(10070799003)(82310400026)(1800799024)(35042699022);DIR:OUT;SFP:1102;
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 13:34:58.8403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c428187-f45a-44f3-3912-08de4ebab7ea
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[2a01:4f8:a0:900b::219];Helo=[hz-deliver01.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR2PPFF0D59E377

Since commit 1f4ea4838b13 ("mcb: Add missing modpost build support")
the MODULE_ALIAS() is redundant as the module alias is now
automatically generated from the MODULE_DEVICE_TABLE().

Remove the explicit alias.

No functional change intended.

Reviewed-by: Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>
Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@dua=
gon.com>
---
 drivers/watchdog/menz69_wdt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/watchdog/menz69_wdt.c b/drivers/watchdog/menz69_wdt.c
index 6e5e4e5c0b56..3fe23451135d 100644
--- a/drivers/watchdog/menz69_wdt.c
+++ b/drivers/watchdog/menz69_wdt.c
@@ -163,5 +163,4 @@ module_mcb_driver(men_z069_driver);
 MODULE_AUTHOR("Johannes Thumshirn <jth@kernel.org>");
 MODULE_DESCRIPTION("Watchdog driver for the MEN z069 IP-Core");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("mcb:16z069");
 MODULE_IMPORT_NS("MCB");
--=20
2.52.0

