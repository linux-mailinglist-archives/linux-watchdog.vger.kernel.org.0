Return-Path: <linux-watchdog+bounces-4771-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 329FCD03E5C
	for <lists+linux-watchdog@lfdr.de>; Thu, 08 Jan 2026 16:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF343307B34C
	for <lists+linux-watchdog@lfdr.de>; Thu,  8 Jan 2026 15:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3950A421F13;
	Thu,  8 Jan 2026 13:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="BguM9J4w"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazon11020104.outbound.protection.outlook.com [52.101.188.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E786541A045;
	Thu,  8 Jan 2026 13:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.188.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767879302; cv=fail; b=h5Vlc1fOMr6kiJUC7VptFRtqSSLI5f00oFeibPFN+hfb6/Ocw1g81wGE2nWC4TvSLDKRh0+jFkpmCx5LU1nZGxEvIwDJ+UT4g8CUDR9JjtJ60/M6ihProTGooW9alLXCCsfwrA+TGfzJoMvEe5OABjydou8FluW7gOFyIVe1bjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767879302; c=relaxed/simple;
	bh=/BroWuQxW6GoUAu5ua+0p/oJJzRoK+5MhVP8EdmhbMA=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fe6xiR9s/l/MfxPrlPumscDdkXFFNeR4imckwMcae1+RsF8ms6F1ktECk/xWHzmOeQTe9T7qRBGfr9+F06y6dGczVhlVkT2wwVdX/zspuHU3Qh2RkFlU6MZdiIpuMe4RFJscFp8inLhn5YJlzvLVg6pTqwJyHAZFlXA39dHXB5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=BguM9J4w; arc=fail smtp.client-ip=52.101.188.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gVNLv9FoxdaVgSVmlUqL1/Mz3/KsTE2wFvkREfamBYFzohHm35LglE7psjp6leUDijkF4Ny3Jzj2bS4Oo15XvEbx3GI6bls0pG7KKN1r6B4t+R7X01TOeIjkUB48ZT3neF5rA55O8msjqc+RxhCDtsAwJOvWCudYwu4o2wWih3flIVu7QGVfjmdug94Z2bW6v44GH6a8Z36no+D2OZXFusHiU0l9lT6tnVjnJZmQ5kHD3ShNhg8Zd+luNwsdOA3X+oOz8WDheEYnoM2dLjfRbUKFTT6PRJGi6ckt1I+waGsHfrqiTGp5LXY2yqoEbl4BuRFrwugbhKnfv/QquKzgeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1+xXUOiICgTBLUQ6ou0X6akhj7MZ29yMKLteHnI9u0=;
 b=oiQb/JZ1LrH2vB8M5FC4ISyPnCAk5iKBqHji6JlJx9FN4Ct/2h78FBqt40lQ/MM+BQqDZb1HxFWRDLsgdLYvvwrUlUWey4kDx+Byyf6ZF8MTGbOrvgCOdk5uob+SJLmv6ic0W8IpGHZl0SiHY/LsvdhSzWP8rQqHORt2diCQm6HQrYRTqgy9XSN/cArsn1ghLAEnNHkf6srwJFnQBHWdiZYcgG7asuUhYCD5+NlgeK99csrzuT1D4ijZaVs7w99vwwAXh7UwONnevlhDZmdvIyNsMlv6I0N3kj2KP2eP9quOfn+1JTqVBxRp5nJFMA/DJgYdLFm0EQA/ev3DcAwUvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.85.53) smtp.rcpttodomain=intel.com smtp.mailfrom=duagon.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=duagon.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1+xXUOiICgTBLUQ6ou0X6akhj7MZ29yMKLteHnI9u0=;
 b=BguM9J4w5xwpkNSVeZqqo7jCyM3ur1phTGCO7jYLZ0krdbsunAzLf2i7On+wox/ZfmwPfglB6qazKiFu90KeCtUbWBCv5sbnunDM2I/az8korfGrB7FMTkoRNK50bezlKFJkZMVM3HMT21CwO76NXMOdcGMBGJ3a+X5vv+tOVUU=
Received: from DUZPR01CA0141.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::28) by ZRAP278MB0174.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 13:34:54 +0000
Received: from DB1PEPF000509E9.eurprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::90) by DUZPR01CA0141.outlook.office365.com
 (2603:10a6:10:4bd::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 13:35:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.85.53)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.85.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.85.53; helo=ZR1P278CU001.outbound.protection.outlook.com;
 pr=C
Received: from hz-deliver02.de.seppmail.cloud (2a01:4f8:272:5fe6::218) by
 DB1PEPF000509E9.mail.protection.outlook.com (2603:10a6:18:3::61b) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 13:34:54 +0000
Received: from hz-glue04.de.seppmail.cloud (unknown [10.11.0.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver02.de.seppmail.cloud (Postfix) with ESMTPS id 4dn5Vj5M8cz11Cl;
	Thu,  8 Jan 2026 14:34:53 +0100 (CET)
Received: from hz-glue04.de.seppmail.cloud (unknown [172.18.0.6])
	by hz-glue04.de.seppmail.cloud (Postfix) with SMTP id 4dn5Vj54Fxz237D;
	Thu,  8 Jan 2026 14:34:53 +0100 (CET)
X-SEPP-Suspect: 18451fdd49ab4e8b9918524e7aed8c77
Received: from hz-scan10.de.seppmail.cloud (unknown [10.11.0.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hz-glue02.de.seppmail.cloud (Postfix) with ESMTPS id 4dn5Vj4Q3Cz1wpC;
	Thu,  8 Jan 2026 14:34:53 +0100 (CET)
Received: from hz-scan10 (localhost [127.0.0.1])
	by hz-scan10.de.seppmail.cloud (Postfix) with SMTP id 4dn5Vj410Jz4gqk;
	Thu, 08 Jan 2026 14:34:53 +0100 (CET)
Received: from hz-m365gate02.de.seppmail.cloud (unknown [10.11.0.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan10.de.seppmail.cloud (Postfix) with ESMTPS;
	Thu, 08 Jan 2026 14:34:51 +0100 (CET)
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17012053.outbound.protection.outlook.com [40.93.85.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by hz-m365gate02.de.seppmail.cloud (Postfix) with ESMTPS id 4dn5Vf5YfZz2wQy;
	Thu,  8 Jan 2026 14:34:50 +0100 (CET)
Received: from DB8P191CA0016.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::26)
 by ZRZP278MB1938.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:b7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 13:34:47 +0000
Received: from DU6PEPF00009529.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::1) by DB8P191CA0016.outlook.office365.com
 (2603:10a6:10:130::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Thu, 8
 Jan 2026 13:34:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.79.222.204)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 20.79.222.204 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.79.222.204; helo=de2-emailsignatures-cloud.codetwo.com; pr=C
Received: from de2-emailsignatures-cloud.codetwo.com (20.79.222.204) by
 DU6PEPF00009529.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 13:34:45 +0000
Received: from ZRZP278CU001.outbound.protection.outlook.com (40.93.85.30) by de2-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Thu, 08 Jan 2026 13:34:44 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=duagon.com;
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6) by
 ZRZP278MB1826.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:b8::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.3; Thu, 8 Jan 2026 13:34:41 +0000
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e]) by ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e%7]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 13:34:41 +0000
From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
To: jth@kernel.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net
CC: andriy.shevchenko@intel.com,
	dev-jorge.sanjuangarcia@duagon.com,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Subject: [PATCH v2 0/1] watchdog: Remove MODULE_ALIAS from menz69_wdt
Date: Thu, 8 Jan 2026 14:33:31 +0100
Message-ID: <20260108133332.24560-1-dev-josejavier.rodriguez@duagon.com>
X-Mailer: git-send-email 2.52.0
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
	ZR0P278MB0523:EE_|ZRZP278MB1826:EE_|DU6PEPF00009529:EE_|ZRZP278MB1938:EE_|DB1PEPF000509E9:EE_|ZRAP278MB0174:EE_
X-MS-Office365-Filtering-Correlation-Id: 22b0bf88-b33e-4f53-7989-08de4ebab514
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?Qg5beOgS/t8t5tXusFBSMOll8xrdwFJ6xhijRkb3d/rWDz1AmVMA392wfhJ1?=
 =?us-ascii?Q?bzWvO3Xt6C5KHEOG832Roy+XkkHEAkkvGXh/jJo+ETUhQfcpG2j76Fyb6QZ6?=
 =?us-ascii?Q?tTeJV6r85n1cD//51HT7RT1cwOFuOjRl60HIcjfzQQW7Dk7IcsN/vdQBTTzR?=
 =?us-ascii?Q?exNKb0wZUdoRCANdiCDYgtauhvFB2SogFFaG7gAwL2Spchc4YoNUP44bpqMN?=
 =?us-ascii?Q?7AJLxNbWCC6SppO8qz+VSdPOsnRb6CSjUFonmiVThrL7v8R9knCelNDwvEge?=
 =?us-ascii?Q?z935SIf/JIuDq3dMGRDaq4FfB0Zw3+ZUKnFZdg8BPUzrxLGXUjfML6Eu1ljS?=
 =?us-ascii?Q?PAVTKFlQdg6HagME2SueHzjugrPvAEQg0N8icBGmwmzCMqlyOfbhcsJs56aP?=
 =?us-ascii?Q?c4Z6gX7Dt4Bkf4FLKksCKsSmWjRhnTbGQgzNaADxj449DZF8/2369twiDAAX?=
 =?us-ascii?Q?aNhRoF7M0yTaNcd4T/+tfPH774uCqdN6FERscVL+/gF/qKVSct6++PLf3CVL?=
 =?us-ascii?Q?wY9VMgTvGaKt3jhYuJWIpHmnw3cb0flSk91LyHrJmTAAEt7cKKnp0yxzJ+Lc?=
 =?us-ascii?Q?jFgOBwdp+S2o42JOrB4LTr6qbv2+3yTU7J1YVNU7PPa91t/+Wsf49bAylavV?=
 =?us-ascii?Q?RQt/WJ0shpWWnBMQ6mTgN9TTjLye26k7hlniWAw1cCKLnPpQXFz1UB0AzuWD?=
 =?us-ascii?Q?ge2aW6FmPrZDIMFLAB9vyS0wpMBdnGu2VF/WMQ+ro5skJsEdBxnFp4nQBpX0?=
 =?us-ascii?Q?/EbaZSWrtyOUWzbQE5ZKEEwtkD8GVPIGRslqB+CahCgf8PMbk1EymG5ctat9?=
 =?us-ascii?Q?8Ir/StKGw5bjSmz+xwyuS8duioeZBmZZ1L2d6UoLnhfirRdOtAeedPJ6N6rO?=
 =?us-ascii?Q?FwF51d52iIf0KiADL6kjeMN8kxSLdmk/9TdiZcNPUn2JbrpmSIIcD/ZFCxCs?=
 =?us-ascii?Q?7i/cRJN6RjWdVgfkhje1zGihs+UipWw2G9LiBms8Ndfshcu2Rb6GPnjFEUDs?=
 =?us-ascii?Q?EtCJj/314vBjGTmG4lLEyL2JUU2HeIL02PS3bvZSxL3A0ujT/4dPnUfGRLJ3?=
 =?us-ascii?Q?3yUbb5SFqdq0y2XQWs4MGCR0gxnFwmLBhdM7BFbjxOwjYjPPycLzWy+9Pkbx?=
 =?us-ascii?Q?FM3tiNPQbSuAX7m7dANuxZVBItkMOrVGDNliT9O1/xHr72NVW5aBB5C6hAEM?=
 =?us-ascii?Q?m6d6rCnLa/0iP3YX+BxN5D0K8qNbF8wVtADdB74LmGr7qbabHJSJAd4ToRMH?=
 =?us-ascii?Q?p9KrQwsI/cmwABl51bcSjBcFXsWcAze+1YExF+R/R0AYgZ5HZV4gPiZGE/yE?=
 =?us-ascii?Q?xcG5JOQSiKSH2arPcm96F3veNinYJ1hENlWwTF2NjglgmGIFqyML6Kp/9Vzy?=
 =?us-ascii?Q?DIZ5k7ArQehVeLJ8uYf4mxw55R/zM3ktkMYeG0nyWmpw6gKxPbKWGxTuj1Uw?=
 =?us-ascii?Q?LaLtojhSlHuWyGHmPOV550xYVMSLiLVfhhiY4PpRO2w98Ip4MrVhWiQFNWaR?=
 =?us-ascii?Q?kGLpHirBwEOSjKQPU7D0ntja58pvx1VjASif?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRZP278MB1826
X-CodeTwo-MessageID: 4c340d91-8464-4f4c-932e-e0d264c8fa63.20260108133444@de2-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 1
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
 ca7723bd-cdf6-423c-3b49-08de4ebaad08
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|82310400026|36860700013|1800799024|14060799003|376014|35042699022;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?6Rv6j7s2QDT0Ff3BT74dPl/+mzSy+mBBDVKTVDB7Ly0HlH3bJUkZycwS1HXk?=
 =?us-ascii?Q?NzDphSYXN08hFZ9oFoeOXXqRgXHHBv+lXCv3/T7RehElRGDFEUD2AAUpwoRz?=
 =?us-ascii?Q?B7iJWhGY0a6bg+OhjZyjtIN7lWw9cmADWEfWCJ152WfqvNoXC+NA3FHglgbG?=
 =?us-ascii?Q?ByBN7oJE0Bm4T1as51hzArguEJ3rAxpAuRyNhYVP5wV5sMe+iyzNoxvZaMj/?=
 =?us-ascii?Q?Jnti7KhlG7YAJqXkNXaHRYx/lGalL7eas+0KdL+jnGCweggetVqEju+e5TXQ?=
 =?us-ascii?Q?75aWMZs9Dz2BhnguLp5ait+yBopKNxB2m0jl2fbML7gJcCcNcGtIx7WDGVyM?=
 =?us-ascii?Q?OkFLqjEsafIElzrDyf7GtM08NS4MR8d1hvdVJ8eNSja09wNmZ1RWI1UIiL4D?=
 =?us-ascii?Q?T9pITwNUtGu56aV1cMI0yMiHh1O62bC8eMA7f8a1OYvyo4ohBsqeBgSZDIpj?=
 =?us-ascii?Q?yoEi6+jXjXOi1OyGvEnNTfsgtn6KaYkLV/BsKbtY22yVOgbcoYMH1RsXP9HM?=
 =?us-ascii?Q?UwY71Twj27soz9wmAPrUjiFpYYeP8kdb6Ky82TYQ4+j+dPq7kGLNUh9ldULW?=
 =?us-ascii?Q?Pzt+k+oFOzG6LAfRWaqlbiVVTmduS23UB0wczqwY/MTFJjYj7TgonrjfZDXu?=
 =?us-ascii?Q?CAZTNGbnlu2cdtSmQg7Z2Pkz/wsrlkABuRDgr1fYU7a5PQBRqxcSgCpRwIwu?=
 =?us-ascii?Q?MTuIwpBuPTmm5gkl8yFNlP1mu7v5I5fGuJKx8aSgF3zenM5qFyA8+NgzBlJS?=
 =?us-ascii?Q?4rs7UL1dWDTVA+yx2xfDlikmQEM6YKbn1wneu3Wc4w7TKy65lRpTl8p4X7rA?=
 =?us-ascii?Q?AFKr5/ik7wg00CswEk4j1E9qnk8kBkQXWZwqglEiS1YGgup7AMoOOq8wCB4a?=
 =?us-ascii?Q?PfdQG/T6vLu3y8tOkY7eEKyjfd1V5wjayAEL7ot3JDPWYn3Gv9pEwFeuTbMq?=
 =?us-ascii?Q?vyGuZy9Ib8XivDFVXCJeECEugxbliDbGTI46Kv9JXejQBAZPXQ+rvnArJ2ul?=
 =?us-ascii?Q?KbTt94DOxQx/Rky2Y5KDf6MB9gi/lJkY1u/SMgTEDkFbfdcnOhnExqRhwbDK?=
 =?us-ascii?Q?E4nTYg74xbiTgIeJBUjWpYdGHOEQNXfj/jFqJsfPFPm2TwAm7kDR/bEDF9g4?=
 =?us-ascii?Q?6pR75PKda4nn8C7eW62ecQp40oY55HfAHt8297/zXt10ltCmjtikanpWq3Hh?=
 =?us-ascii?Q?J993DYXUMxjt0vlF9ZtqsimkOowdq6PWVWufUbMRjClJJoFFWmRZEZbqXwGK?=
 =?us-ascii?Q?Js6yaYBXxg9YoJSnK27TIfCX1mAd6BvbEWiS0qk/i04VGAiQic5x2M8KExMO?=
 =?us-ascii?Q?hJ6sQfN0a8DarSVZPnSI3k5QXQX9Y2KJ8cTfzOgEP8LRk6UG0SSl90z9N5p4?=
 =?us-ascii?Q?VzelIBcfdgwBquT8wqN9qQ0m6WmQCc4l60VHVUJTmYOB1dCHPA/NLeOxo2V1?=
 =?us-ascii?Q?gvKwdU4rRtl3xXAIIjCIlzdgIr6Id1daFrLpB9RabMSqYcHUWDVUYI7Mv1hT?=
 =?us-ascii?Q?K59jisBBz3aUuVOtjOqtS4kWo7jR0JsiHSGbLjM28XPaux83WYmWgeWKimR0?=
 =?us-ascii?Q?A0hLP1BfVs+1fcX4KEI=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:20.79.222.204;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:de2-emailsignatures-cloud.codetwo.com;PTR:de2-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(14060799003)(376014)(35042699022);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRZP278MB1938
X-SEPP-CCCVersion: 2025-12-11T08:12:51+01:00 9ed91da2
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.85.53];domain=ZR1P278CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.85.53];domain=ZR1P278CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3a423f1e-d12a-48be-6ef7-08de4ebaaff2
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|35042699022|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VysgAyg9PDfjmYrvs2gUzmpfo5DTM7IAkbJ9oPPDQcLn6SvsL+KqA5ke5bft?=
 =?us-ascii?Q?HaurHcwCiXtGNz7ttnxhopmJdsqiok12T505dylmFn4QzeL7jgg7IWpep9z5?=
 =?us-ascii?Q?omOUW3ZwPorJVIYLtEwmuNF4YeOldao3qnn4PVErO8tJkswKSaQYRm/63YTN?=
 =?us-ascii?Q?s0MixEMvNhqIAORzaBR04Z0xoAsq/UE9ZjETlCpmTx0SXIAdH3FgXOzq04Ox?=
 =?us-ascii?Q?IJprUlzro+0IatmBteeILn2yj2izm7CF8LIoUe1AuMAY7PQqHs0W329Yq5sw?=
 =?us-ascii?Q?CdalrGA6OUmUWv0OzYTJF7mwze3WZ8L7bhS6kKn7Lf6EyLI2iedWYFOEh3cC?=
 =?us-ascii?Q?vBU0iw14ZEWwWLCi31ywj3lZmDjfnSchwmk97kPqE2dhmY+wZo+9hx+HMa2m?=
 =?us-ascii?Q?na9bfYse8WO3R22bP85bpqzqerarN1JZPpAZ49ofqtDI4tw20aLHWXJDqFh6?=
 =?us-ascii?Q?VMLY271U0MkfLzIBGaCYIDbcYSO1USUGgnfOh0p6tkiT4ZmFdEFbpA0JxpdT?=
 =?us-ascii?Q?KxCIUlXV2nUYx2XMac8gA0fuX9bXv4n+WIzsdlKUyia0zvj07OM+U+1q+l9B?=
 =?us-ascii?Q?1CC61T+dxB3IjXi34jZtuIfvPoVDMRsedzdYXRyHTznlKI4/h3+B0+5T3dY+?=
 =?us-ascii?Q?VaZwxBlTL39G37AtzeUSc2KRq4X3HQ+LWfC2p13/R37OzB4ZEwTmQAUR1pVq?=
 =?us-ascii?Q?hcvUv71ptQCBBumcM72MbtWSHI7r04K6lVn26Qu8rnQqfXZnU39Bp8CjKHHW?=
 =?us-ascii?Q?CeoTM6qtvWsGCziW9E8nxWFsMw3Gg5kByk0bfIe8d5APZfiL7BsY/DM2wiYc?=
 =?us-ascii?Q?v61f5OnzZ+lP+E7e3uOm2HuuWziC4IhW9IkizUHlSi6VwoBGUkm4Fh7EkF79?=
 =?us-ascii?Q?mZlgx4oSIc1AOxnlCPP1V1yZCTPQheRs5kQeCnlPzSbu1guj4hbgaVwSaG/+?=
 =?us-ascii?Q?0obvGSHJRQWYvIv3rpjxqJDOpHrsTXLflVfYA3zECSthDaEF3Suw7YMaT/us?=
 =?us-ascii?Q?TqwCY+GDOPdFnVXffASx8r0ffTK2RqAsV5rG7GzP8/ldf9uxoVgK6VpzvHHe?=
 =?us-ascii?Q?AFmqkLWftuKuKlYpJHIRrSFbYu/wPdlJFdG44x67t0relIf7ocbq/gWmU5L9?=
 =?us-ascii?Q?ZSwJdw/UDXoP?=
X-Forefront-Antispam-Report:
	CIP:2a01:4f8:272:5fe6::218;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR1P278CU001.outbound.protection.outlook.com;PTR:mail-switzerlandnorthazlp17012053.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(35042699022)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 13:34:54.1038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b0bf88-b33e-4f53-7989-08de4ebab514
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[2a01:4f8:272:5fe6::218];Helo=[hz-deliver02.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0174

The first patches I sent for fixing the autoload problem encountered
on mcb device drivers were 2. The first [1] was focused on updating the
modpost process for letting kbuild to access to the data within
MODULE_DEVICE_TABLE and the second one [2] for removing the MODULE_ALIAS
on all mcb client drivers.

They were rejected and Andy suggested me to split the second patch
in a per-driver basis instead of sending all drivers' changes in a
single patch once the first patch was merged.

The first patch is already merged on Linus's Git repository for 6.19-rc4

commit 1f4ea4838b13 ("mcb: Add missing modpost build support")

So now I am sending this patch for removing MODULE_ALIASon all mcb client
drivers as it is no longer required. This cleanup is being sent to each
affected subsystem separately, as per the review suggestion to ease
the handling for maintainers.

[1] https://lore.kernel.org/all/20251127155452.42660-2-dev-josejavier.rodri=
guez@duagon.com/
[2] https://lore.kernel.org/all/20251127155452.42660-3-dev-josejavier.rodri=
guez@duagon.com/

changes in v2:
- Renane commit message

Jose Javier Rodriguez Barbarin (1):
  watchdog: menz069_wdt: drop unneeded MODULE_ALIAS

 drivers/watchdog/menz69_wdt.c | 1 -
 1 file changed, 1 deletion(-)

--=20
2.52.0

