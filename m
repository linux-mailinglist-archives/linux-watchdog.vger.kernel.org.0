Return-Path: <linux-watchdog+bounces-4747-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA5BCEABF4
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Dec 2025 23:01:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 710FA3034916
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Dec 2025 22:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38E9283FCD;
	Tue, 30 Dec 2025 22:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="nxnoIgZm"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from ZRAP278CU002.outbound.protection.outlook.com (mail-switzerlandnorthazon11020096.outbound.protection.outlook.com [52.101.186.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EC328466F;
	Tue, 30 Dec 2025 22:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.186.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767132059; cv=fail; b=rT7BMsrhuQ7nO3mSL3tr/Wv9vKZL+weKUpoA8Telq7M6Ie2vQ1K/Hf1GF/52endmawtQx76XgHnWMvivvHG06Isq1Nkkc52X7yFSWhJZg3QNfKwp/g9QGE4C1o7ZnWwJ98XyQr3OdxvkxCy3YhTdpcmP+FaD8bh3RnkuJqmQWZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767132059; c=relaxed/simple;
	bh=niKQmiB6JWtuIYEZMrk1Hrhp0q0FgZGoK0kRU9FNucw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZPzUur9xwNVBXb9AJ4LrXeoNGLNDnUxg7FLxm+utEfiO0o91x5Lisghy8yef3oLAeP5WKaPQcI+oy3EBBmwhwQ08HCq2XGuAIQNTyXv6Ak+UX3UzywsdoPzNogNhdM62hnAvrCQVbFl09P6Pn+6wUEmTxNud8TUL8Mf9zt6tT4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=nxnoIgZm; arc=fail smtp.client-ip=52.101.186.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WqkZ8rMsWyoMQOQDwx12pfW0aY+XUVSnuOh2jOp7dSmsY6Y4nT1aLNaiK6JRO2rxqIlsT8Bo/nuHS0vpGwEXWulo59iDhR+DhON7nqz6L7Ok031Bz46M2nz8uIHluytjNAhoIa5eD3GNMWqaOFoSp2am0osRi1Z0Ci3O0Az8DK/NPPMZvF9GZ4wBHwvvMNwnPxH2HoZG6R96k1ErurgKFNc0GaPLlx41gO5Pj5vVvID0MkTnjqd8bNmHV1/4MrmoMBsDsHzqCo/7dBiLqHrOr1ejMtI2YGII/k8GzsOu+pogK18IYXMvHMh7pbtrDLGGBPKM4BPpFFM6FefFDZArOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=niKQmiB6JWtuIYEZMrk1Hrhp0q0FgZGoK0kRU9FNucw=;
 b=nkhn+8+Meov7Uv335j/aP1aOlwDkuVUrLtr1TogB7DWXtVPgJU0AytnHnRL7yhW07txB2jrQsN4pcZEGZ78/wstqpWBO9hifhQqisKd5zwo2iTp6ixAQK0eOQ8n0XBGukqtOAXW6p95L3DuUjTe3a2aeXgPYQPvaUPiP4fmQvzHztmz8vSXHZnj8FIoE4ssKl/cqfBDKiGuj3jrmIkpbsOhvLZc/YIRDQ8RLvY8/2A17J222U8u8D7cduZIo9uMRB4OIcwxq3o44NcOLWsQJqmkU+TGH+aK3OUKkQDWX5sDbyktQRsVI9x80IpDSkHmqE4z9ROnx1CP5XnnKgzdcWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.85.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=duagon.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=duagon.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niKQmiB6JWtuIYEZMrk1Hrhp0q0FgZGoK0kRU9FNucw=;
 b=nxnoIgZmuXwiH9e6d9bGJf5d3w8C2Zod45+mcMYdXL+kyB7ljAFkP1/eQaMFWGV+LSfUGFLcv8YWhs0MqqwtKqKJro5JVWOK+yQova/t+fXUMA3WdVIOWpqeVanHBEhYezHnEPtYBLomnlt1GPNQFfv6MbFjWF1Kdc7vsSRuenc=
Received: from DUZPR01CA0202.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::13) by GV0P278MB1829.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:70::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 22:00:52 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::cf) by DUZPR01CA0202.outlook.office365.com
 (2603:10a6:10:4b6::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue,
 30 Dec 2025 22:01:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.85.50)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.85.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.85.50; helo=ZR1P278CU001.outbound.protection.outlook.com;
 pr=C
Received: from hz-deliver02.de.seppmail.cloud (2a01:4f8:272:5fe6::218) by
 DB1PEPF000509FB.mail.protection.outlook.com (2603:10a6:18:3::6d5) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Tue, 30 Dec 2025 22:00:52 +0000
Received: from hz-glue04.de.seppmail.cloud (unknown [10.11.0.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver02.de.seppmail.cloud (Postfix) with ESMTPS id 4dgn8h0k3Mz1196;
	Tue, 30 Dec 2025 23:00:52 +0100 (CET)
Received: from hz-glue04.de.seppmail.cloud (unknown [172.18.0.6])
	by hz-glue04.de.seppmail.cloud (Postfix) with SMTP id 4dgn8h0T1Nz1vsv;
	Tue, 30 Dec 2025 23:00:52 +0100 (CET)
X-SEPP-Suspect: bc9407afd174468d90498ff87724db02
Received: from hz-scan04.de.seppmail.cloud (unknown [10.11.0.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hz-glue06.de.seppmail.cloud (Postfix) with ESMTPS id 4dgn8g6myHz1wsW;
	Tue, 30 Dec 2025 23:00:51 +0100 (CET)
Received: from hz-scan04 (localhost [127.0.0.1])
	by hz-scan04.de.seppmail.cloud (Postfix) with SMTP id 4dgn8g6KK7z6q4d;
	Tue, 30 Dec 2025 23:00:51 +0100 (CET)
Received: from hz-m365gate04.de.seppmail.cloud (unknown [10.11.0.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan04.de.seppmail.cloud (Postfix) with ESMTPS;
	Tue, 30 Dec 2025 23:00:50 +0100 (CET)
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17012050.outbound.protection.outlook.com [40.93.85.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by hz-m365gate04.de.seppmail.cloud (Postfix) with ESMTPS id 4dgn8f0CcKz1xY6;
	Tue, 30 Dec 2025 23:00:49 +0100 (CET)
Received: from AS4P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::10)
 by ZR0P278MB1153.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:55::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 22:00:47 +0000
Received: from AMS1EPF0000004C.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::7e) by AS4P191CA0004.outlook.office365.com
 (2603:10a6:20b:5d5::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue,
 30 Dec 2025 22:00:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.79.222.204)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 20.79.222.204 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.79.222.204; helo=de2-emailsignatures-cloud.codetwo.com; pr=C
Received: from de2-emailsignatures-cloud.codetwo.com (20.79.222.204) by
 AMS1EPF0000004C.mail.protection.outlook.com (10.167.16.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 22:00:47 +0000
Received: from GVAP278CU002.outbound.protection.outlook.com (40.93.86.3) by de2-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Tue, 30 Dec 2025 22:00:46 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=duagon.com;
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6) by
 GV1PPF260593666.CHEP278.PROD.OUTLOOK.COM (2603:10a6:718::209) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Tue, 30 Dec 2025 22:00:43 +0000
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e]) by ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e%7]) with mapi id 15.20.9478.004; Tue, 30 Dec 2025
 22:00:43 +0000
From: Javier Rodriguez <josejavier.rodriguez@duagon.com>
To: linux-kernel@vger.kernel.org
CC: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>,
	Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>,
	Johannes Thumshirn <jth@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-watchdog@vger.kernel.org
Subject: [PATCH 5/5] watchdog: menz069_wdt: drop unneeded MODULE_ALIAS
Date: Tue, 30 Dec 2025 22:59:28 +0100
Message-ID: <20251230215928.62258-6-josejavier.rodriguez@duagon.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230215928.62258-1-josejavier.rodriguez@duagon.com>
References: <20251230215928.62258-1-josejavier.rodriguez@duagon.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MA2P292CA0027.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::16)
 To ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR0P278MB0523:EE_|GV1PPF260593666:EE_|AMS1EPF0000004C:EE_|ZR0P278MB1153:EE_|DB1PEPF000509FB:EE_|GV0P278MB1829:EE_
X-MS-Office365-Filtering-Correlation-Id: bf20908b-d5d3-4a37-b468-08de47eee65c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?WFo9QPLS1R4VnLyBkglpMdmkystCyQfLh8D6LbUYa1WmKr1ubVhTRFb1kFyn?=
 =?us-ascii?Q?gobksFEMgNUK9v1aJafV+xJRgbdqCtK3vYkwHjjGSkBkLQyudDWto5ntA/Sn?=
 =?us-ascii?Q?89spfJuLMuEhd0YduP2XBlpPz3maHUFO1FstQCK1FjfvfeJRdHXiBd/Bqbt3?=
 =?us-ascii?Q?yPujN4mcsqLCemt0SP6JzqeRUReZYOzVCUq04S4x9SWbnClG8rLOSuXwDv+E?=
 =?us-ascii?Q?rTdQSpdBM4oaPOpu5LCUcIuP1t/vxjh38FBcRfWOc1KAlxk83YnM7sGxgpGv?=
 =?us-ascii?Q?OCKn7LL5aDm07Fnb/dPtzzqDPnNMpYaZjb3IWvrDxDp0fpb0hp9mD+l3EXYN?=
 =?us-ascii?Q?5puwPrBAqsGGa6ffRABtw4iVSRkD7sRWtLbpsGtK+VUfcmdZbYmXO7T6YEM2?=
 =?us-ascii?Q?ZxDnKZMWu/g3YZLL2Hv1lBU4ggi9SbxIZF8ZvoRM9LzqdD/X18EmD14aLI0o?=
 =?us-ascii?Q?lXm0VLsylNli0NTtyrS2g3tiheNr2S/2bO+OOV9mwLlyZ1h0XB/L2abdMGB1?=
 =?us-ascii?Q?rArNEMV4npwoVEJqF9Dvrp2+2rmXzOV+N0nTUuQyV9Kp6IPnLKDcUASLazL5?=
 =?us-ascii?Q?aCfGJxcRXDdCVztuMjL2bKEvBs6oRTR1BipR1iJw6GMZZyu64FtqGlxzdz4i?=
 =?us-ascii?Q?8rtTcVwj1Wr2M6mA6+h9DwLT/IgPqnuayXhRgvTQbTOGbnWgeahP+DOoXrE6?=
 =?us-ascii?Q?ahym7GRMwKdrxF4uJ+DWfRTJaD+zj+Jy8uRrofTmrkVGrlCzUGlLtWqqCBou?=
 =?us-ascii?Q?eGLYRTLdylJ8H15jC0feSo6A40FfQiTeKz5vXobOIu4kX5iIHH9bGZMB9A1c?=
 =?us-ascii?Q?I84EiUjT7Iy+MnbxaoCGxWYKvfBNSn7xjbsz1g2vqOVl/JnMEjzn1/44URw/?=
 =?us-ascii?Q?VRNScUcI/dtNnQxzQjTwOH8p03pYwXs6M05euenEcKmI3t/5Z5CmYS9pCFof?=
 =?us-ascii?Q?fArb4SjLASKKMDcezrH9/NTlBsglxtOLkT3S/pRRYZGca+CU3W1mkPFBtub8?=
 =?us-ascii?Q?gvH25wBHDFGNP2b8L7CtEHkV7jKx6do8VRuxYVgNOmh9sU+xYnuAM1yvz+nh?=
 =?us-ascii?Q?bGH2a9WVukybbZqCQ5YH/1lPAkjIzxcqWEJJ3YNb5/h/YRLQloXSJIFd1I2W?=
 =?us-ascii?Q?gg4eNnzaPlbUzCZYBlJcDHM/Qn1VPa5QVvb3vKl6EDB0Ch3frj1upXSj1n7x?=
 =?us-ascii?Q?GpSFK+LT6Y8LOJ/N6+m19Y5HLKJVy+6FSRTNFeIeUmTU/BcsYU0Ig1IySE10?=
 =?us-ascii?Q?jiupYIw92QtISpSokjlR7ZG5WBqL/2SEaTl/mdstql6anGG4kyA/btJ5fukv?=
 =?us-ascii?Q?DAhPvl8JN4YoQqNoQTo2tZSz2AM/ew6wGhQxm5FmlxEQIVBWgyOy5ZGwmBY6?=
 =?us-ascii?Q?zOzB3iYSDr2GsDwo3Dul6B0gsukf8hOSgHmgv/6r4IPHkW7hpgHlU3LXPZmc?=
 =?us-ascii?Q?yQIkZxmd7u9W/TjCLk7vBtz1y0pbBtmmKFRmdXIPSg2nLOs64Q8+SyokudEw?=
 =?us-ascii?Q?OTLkFYGqQ1DbrmmxPFKAsKK/0pXmOk0ldLQ1?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PPF260593666
X-CodeTwo-MessageID: 6ee66877-8bfc-4500-9478-15367e4049ff.20251230220046@de2-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 1
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
 934940a9-7c72-4eea-3d64-08de47eee0c0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|82310400026|1800799024|14060799003|376014|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?BTTrt/dRiEBsTS1iA/KR0JJ5Sf9UaDhPxeJjkBy2VL78SBVwbbE1w2lFxW6X?=
 =?us-ascii?Q?OoU42zSjlan9W8YmVrCJCWkwZZlLGifZlb3uLXqaKEZ34RVGQyM517jcqD6H?=
 =?us-ascii?Q?pw1rcP7hnCM0+pBGKMUmtHUuo9HhYxffCKJxMZsQK80rpUO626VLnR2cHtQ4?=
 =?us-ascii?Q?IWpnCVNjwE7FLmhH+9tsUriWOniV2aLEbOOyUO8ijbBSQ3uM06WtAHMTf/Nb?=
 =?us-ascii?Q?lgbSRR0LrWeXlAVRKK6iy4tFwOTeWLlu8gmRyRus0iFf7NIdfZkCKA4QC3wc?=
 =?us-ascii?Q?1WwGTbe4Ydw1q2ZqoDmzArSZAr7uLpp07e2re2oXO3l+T0FiduspIhQRYoXY?=
 =?us-ascii?Q?nwFuq2jnHkWmHJ/+Ceo9KpCCwKn4HWb6GLPg8Vx/v93gibN0SWM7xMq0WPa3?=
 =?us-ascii?Q?RH74InSQ9VS2/piZmc731qPZW9Ja2h2m2LngBQFWPZzRMAXO1hUMuxeXTDO1?=
 =?us-ascii?Q?rxO49MrfyNQegspgJwfTqi6aGAf2V3VgCCUvCRX1IkfSBR8xgtyl42GcNTn3?=
 =?us-ascii?Q?bRSFBZ/lnjVMnzFrXyGNrbCc+VSpw7CIWUaZZQ+WtCG1zmjCkeQvXVfy5YNJ?=
 =?us-ascii?Q?iiF1CpOFhgL7biPlRSwWdWjmZfRdJ7Ns8pBi1kObjkAdsl4dPieaU0r60GrQ?=
 =?us-ascii?Q?PQHqorT4uT0t3uJz7wceLhVwrhY51dNrfADEKpH550NMsB4Od/dwpDAJDVeV?=
 =?us-ascii?Q?u10hGqvGa1iTfb6rfN3VwW8gru1E+3+MGHKPahfqIDRxgBE6ByD5ve+SMBYF?=
 =?us-ascii?Q?1SiPRYNY/NjSIA945otp5eGuroH//N5tInMLJ3fBebqOd9BtZt9uGti+pUqf?=
 =?us-ascii?Q?A79rNlZkCzMDn5xjNQddtrECcxu/vAjoCtdiz0DG5leobn/Yhsp5ueJ1JWf+?=
 =?us-ascii?Q?+HmnrYPIjqIXxCVol1Cs475K1TmZMBVufebJwILq0BiahC70Y3Yu8kBKAi2o?=
 =?us-ascii?Q?ftJ54mbGh1RyATKu8K6xZsc78reT6sEWRuk4rnyG8d3/wIolG/mkNEIM8kUu?=
 =?us-ascii?Q?TRi00nLwYpebTyQxukGXC0beqCtiwTmBpOGBHO8TPsV8pichlvDQXEzjrbin?=
 =?us-ascii?Q?tP9w/MQXYcAXLklzH7umC4pFpL9Ola3miqWlPgZlpQx62s6A08FT4hUwzsIJ?=
 =?us-ascii?Q?09/2EOGvlclQLbu9FVrpj0fRwN3p5MXwctSIltrUyyxTHVE/AVULBArc2bNh?=
 =?us-ascii?Q?acYT1sawJmA9B78bgQcdifsL0U8f9whPORMsS0f1tfh2n7BL9vcys73gjRhw?=
 =?us-ascii?Q?Jub7E74ZJtCFUl/0y35U98T3a7TrYChRTqy2KKjACf/Nwom8AMx0hn95ktSg?=
 =?us-ascii?Q?LZnQ8uq8/Gy+cfN9iWOCdCAS4AGgK6G/tWBhCJx2H8YNbjtKgVUxe9esIR90?=
 =?us-ascii?Q?IxK7IcV7l2wz5Omn2/kvvPNcoFEjwWr/B/xNeSMlf2FN3Wa0MC28TF9GmsLI?=
 =?us-ascii?Q?CFkdx8LWvbq5AdN7Hi2YLkX2oXQ1ZHoRAYNvwu5aul7/QprEZBs3oWEtXhlW?=
 =?us-ascii?Q?gtA+ve5b0kC3Zo/15KF4tSwTrvr899dhAGHmBi9amBIINOEHwrn2cfJWagk/?=
 =?us-ascii?Q?wxnUJ/A+aVbMHn15Ga4=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:20.79.222.204;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:de2-emailsignatures-cloud.codetwo.com;PTR:de2-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(14060799003)(376014)(35042699022)(36860700013);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB1153
X-SEPP-CCCVersion: 2025-12-11T08:12:51+01:00 9ed91da2
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.85.50];domain=ZR1P278CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.85.50];domain=ZR1P278CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b10f7fca-ff9e-4f1e-b45e-08de47eee311
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|10070799003|35042699022|36860700013|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eX5+kVZs2qZyE3Z5z/00QjxNWs//pFNof2tLT89Oo4hL7mf/mBdMbPvrk9oB?=
 =?us-ascii?Q?AOQ0YETgfNMAUeaHu+WHiM7mEADUJayYgoisnCqxJwWCFJf/wF7XTT/QE/BT?=
 =?us-ascii?Q?Wsric/YWsBmQ/0wHROohDC1x4TPDWMwOvSYxeZ32k6TfqG7tjl/0fayyLENL?=
 =?us-ascii?Q?8DWXzG3RISCynbh1LnDYU1nawdO1xYlvL/syyKRFnWqPHFyhmo3iIm1HMkF8?=
 =?us-ascii?Q?YzIuOz30WoIPDjUU0RdhSJhbq8AUzMvR7MkmWkZUC3rgcn4ZoMUAwTtwdSJX?=
 =?us-ascii?Q?QzlJOU1qLltCW5lJBfpJLQBsxdfcOgQrWCSaOLS/A132sgcPDcBvHzfnPwv2?=
 =?us-ascii?Q?W40IWJSrPH4Jum01ba36lPAQ9wuFbNJY+0oJo75nHIoK2qmH8ukzL9IYWJjn?=
 =?us-ascii?Q?Xn2Elee0ax7bD+WYnvnA8CXVm64S6m1lN/U8aiI8GoMxgkmBJFY9dvkXdCVP?=
 =?us-ascii?Q?WpWiRFHnEilWFr59zDWfn5vgXJrNlfO8mhZZfwApC2ME3kvgTQ9tfrD9mf1j?=
 =?us-ascii?Q?vU1YMnYUVKzvVEdLT61y+CzkgDDDpFz0Z+aeFL2TDYS2Y2wf8OR+bGIxPrJ7?=
 =?us-ascii?Q?7Q0oijfDunI2v7y8z5qqE5I87BFx3osKJZyYio31C1UM5W2jQV0cIJJQ1W41?=
 =?us-ascii?Q?LrCSdB5gZ7sHgEQRQUTFX09lHdaE5IU7IANyD4QVMD79F2X/MHAsHvAEc1Xp?=
 =?us-ascii?Q?CbIRYsTEdrSLO8VPJ93YzcjEIRrf2bAF7OGTjEZ9r5iT9faidRYFZ3u4BOvo?=
 =?us-ascii?Q?Qvb4owu48MvcJIZO+R6IC5CZHD0auXmV3CSBUqJ6bz0dZi9Cvd6MS+Q5LFOx?=
 =?us-ascii?Q?ZCFGcNweShPKgnuuenGKIf0uRYKb+c5fJ6PCSIFUz0caYmIP8OHoJkvuAuGU?=
 =?us-ascii?Q?4OzpAGRnxOVKNNEJh8bEZTpjpmbZMKppJHvK1H75DK2JL1xTOysRQurxEV4K?=
 =?us-ascii?Q?FWIZuorV3YsOhnKJTNU7gs3x+qvp6xGJWwLcr6xJzZRpVilNdORnzwaTLtWY?=
 =?us-ascii?Q?75bK0kwUS+PVqHCIxksiLERDgkmf0RUzfLP+J4sgf2F7QbIQhC83iROPt4Yd?=
 =?us-ascii?Q?AYNJy/RnaHA9qpUY5XiJD13jsK/6hLI058MKGYyf4u77QvNZXE3i6EBCMsS/?=
 =?us-ascii?Q?TciXbcnGOI11?=
X-Forefront-Antispam-Report:
	CIP:2a01:4f8:272:5fe6::218;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR1P278CU001.outbound.protection.outlook.com;PTR:mail-switzerlandnorthazlp17012050.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(82310400026)(10070799003)(35042699022)(36860700013)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 22:00:52.4500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf20908b-d5d3-4a37-b468-08de47eee65c
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[2a01:4f8:272:5fe6::218];Helo=[hz-deliver02.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB1829

From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>

The MODULE_ALIAS() is redundant since the module alias is now
automatically generated from the MODULE_DEVICE_TABLE().

Remove the explicit alias.

No functional change intended.

Fixes: 1f4ea4838b13 ("mcb: Add missing modpost build support")
Reviewed-by: Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>
Cc: Johannes Thumshirn <jth@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-watchdog@vger.kernel.org
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

