Return-Path: <linux-watchdog+bounces-4872-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGr1MHBNgWlRFgMAu9opvQ
	(envelope-from <linux-watchdog+bounces-4872-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Feb 2026 02:20:48 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAA8D352B
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Feb 2026 02:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 023BB300F5E0
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Feb 2026 01:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BBC71891A9;
	Tue,  3 Feb 2026 01:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RS1lhzf7"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010033.outbound.protection.outlook.com [52.101.56.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD10C145355;
	Tue,  3 Feb 2026 01:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770081586; cv=fail; b=a1N3drW9w3paaWRZASMOdZ3xxLEWnmzD++JoTEBRlM7/SKhmJBSpnha4h0sioT36qMM8Td974VZ6ao7eS0ZefAg69+tLlfobHs6KTy6x7Y6PdfOfhR2jD/r798sCZDmLAwYWtVKvrUBL8pk03Tycp0QgR21QJupAI/Byrkv3tpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770081586; c=relaxed/simple;
	bh=MrttmtaK4kKqlOY52Ff9XPpCTed6Rk5jJH3MNP65ysU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mWJlpStYdsDZKRWTR9vLzH7Mh5Z/370NdwsmAClYC6bNM5bEAkHAK6FX+C2DPUKnziVr+9/YRQwbS48BBurlVp2peg7ULUoGtxeLOocbUjD3e4Yn4S6POIgDfCMUpt2v9xuwDz/HU/tEPBT+BINEKYf8JYu8B7OmW76alZPYHSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=RS1lhzf7; arc=fail smtp.client-ip=52.101.56.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7ANH5TSvitKX/wEGME3C1kzesviKn3vUU/aLzUWJYPmEVppauzVazebE8QkXRexVq73xWQ8BXSAsMOMP9va8iN1fAH5Cp2IM3WazfyGwI5djKy7uLVZNSzoSgXYhcfCiYaDtAVhpGUdZ9RIRaeSYF2z0ZutEhau4FUyCFzv/1fnA9lUNJjmLDZYjwpsBHnHjymRYcFlaESsFBoHmt6IvXvP0tVgQ6kIfruHQbpAefk6w76SShkAt8EQvdA9GRKQScTGLozOwDl01d2rd19jPjFCWhx8MoRNFU+B3eSfo1pfeaK1ejFMFDO6qujBodfRQlkHfTjZci6rvYZ3NvK/Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZoVph3nFZTfx4BX3NSrMRqQDerLXdiBUjfp3Vitbwg=;
 b=XXnT8mAlgpucsB4cFX+9gdTz9zB5yqZw3QPmF20NnECm0ZgwckKX98XIh5XoXX/Qmg/MKZqEqDCw8fbrGFBOj+UWmJRYFyLPRSx3LeFqrtOPB2o2qi6NDVS/FMtY4aclkHf/D7bsfnbASxFopdvnJSthiXfFyZuUAXOcZHtLD7wrdAU4piN8sELdjeqcYO4fW/ZL6OMEwqqh/DBJlLmpkIX55mA3BekSrn0sMSxFzI2x7wL47kBaVU2o3SpJZwVjMIwr2j5X7/RnAr8GCCR/ASqoyeCFefqmPuyGP4pcGJADZLXW9TmM06erht0+6SDCLxDSEjv0Z7OSsObv9CH5Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZoVph3nFZTfx4BX3NSrMRqQDerLXdiBUjfp3Vitbwg=;
 b=RS1lhzf76ovYl5MqO+zk3J266JCHwzifNgMyYFrUqBOIC8eUzvEdPnXOv2TfWo7QWcgCHOJLmvu8P1n40ElQewyK7RPWvjo9GIALNhS/u2FGBeSjAVv8Msr/WHZ6z53mhOsi0aOZsAANJ/7f/rNDGTIzL9byUtr0zqlvO4gMAmY=
Received: from SJ0PR13CA0115.namprd13.prod.outlook.com (2603:10b6:a03:2c5::30)
 by DS0PR10MB7953.namprd10.prod.outlook.com (2603:10b6:8:1a1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 01:19:41 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::63) by SJ0PR13CA0115.outlook.office365.com
 (2603:10b6:a03:2c5::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 01:19:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 01:19:40 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 19:19:40 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 19:19:39 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Feb 2026 19:19:39 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6131JdZP3094273;
	Mon, 2 Feb 2026 19:19:39 -0600
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] Add reaction control to RTI watchdog
Date: Mon, 2 Feb 2026 19:19:37 -0600
Message-ID: <20260203011939.1013322-1-jm@ti.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|DS0PR10MB7953:EE_
X-MS-Office365-Filtering-Correlation-Id: f6069658-1dc9-4617-f23a-08de62c24e14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WpO4zhuF7KsUhHSy0/C3yT/b7swOhSx/spsgbdjXn2iNdntK6bMZRyJDPH4D?=
 =?us-ascii?Q?YWN26dUA3INeHigEKBAb5BoVtE/0Bo+RcrgPRKhwajyIqnjUshOeR3ZnHLwB?=
 =?us-ascii?Q?ZiFVasizWPxjFYg3mg7O5FQv1uvFLudvsyHiEdiDB500cS4lxopoyTZXrylA?=
 =?us-ascii?Q?5+H+M0vzCXy5x0EpkNoGVkjGx7zdmqvP/4nfRFXsv5eRBX6IeNEdBpwD0kV2?=
 =?us-ascii?Q?fbn8Nyq/Rd4ar4220ivwW3kDJGfX12/ZVbmd9TZmFw9WoI2u4MkMQ00N2mzD?=
 =?us-ascii?Q?BmGTZ0FUG5Z5PCDEtq25H8g1RgrZ/6kYyA2neksbm66ZEV9uR14z5Uw5qDEo?=
 =?us-ascii?Q?uB3h08a4CIY5xrX4y95KiwFxx/eisy/DXAeCJgDe1j6fHVrSsnWRwnPavG56?=
 =?us-ascii?Q?wnukO+mlS4QK5+0EphLBOM/qe3OwTtdsXrIi1Rg/iGtumxHm2XO/KyY30Qvp?=
 =?us-ascii?Q?KfpxWGNBPRu1vkj2CpCR6mvvSaB97GX0LX1gg/bkVJeD+GybXndQMuHdTG9h?=
 =?us-ascii?Q?9Zxv9s36BANEpjAP/IDuGQ1UpU9K1mTthAcdk2H+HIprwwlFFGHrvRd+AWOQ?=
 =?us-ascii?Q?uYIu7vrpxZU+8g30a81d6Y0rhdgXgEEBQ8btKmBUORkRnL2tkkHKyqyYq5g7?=
 =?us-ascii?Q?mMZamDdgqJ297YS3h7eIqIu8tczMPWBVGCicT6Oupp27Huu2sq58+PgDlcdt?=
 =?us-ascii?Q?JpYUjbH3qx/+5iQmw87QXPaeMlHYWbMdCg+WZn4Ua6juyzMiaWpDjk2+rFvV?=
 =?us-ascii?Q?/WCZdBBtoPuAR+aVfvgi29kgCg6B2lUvr3TnRzDNuoCPJZEC5ZXYS14QPlzl?=
 =?us-ascii?Q?hzR8Vjxw7DUe/0lktyDYa/ys2qay5jfKtiDHOlTDiHT3vnqpXjT3SDXBq25I?=
 =?us-ascii?Q?YkMiggG9GcuBP46fqQYhmv4fqtKII8JBT/ItYVOzz/UkCNkf4cwqpUVFPOvo?=
 =?us-ascii?Q?vy2eipVk7xp13Nswd3hzlJfAEPxIwFwCj648BXybNaxMnX6fZE9fNVY9pbxF?=
 =?us-ascii?Q?U18Lyvp1wA7IbpBFZWCA4ogMTDm5bwe6ODST3tX2XjD0rW4H/gRg7yDk8+Ic?=
 =?us-ascii?Q?8Lns6stwnHUOfwATqGdw4wDj7Cf7deC7Cs5U6WY2HAxYxofoxb2nOnaK7DXr?=
 =?us-ascii?Q?z9oWDyN1G3ZZ/r2hz8o+gGgGI1wBllLKpHeSeO+0QbEKZDL0ErNVdw0USQhS?=
 =?us-ascii?Q?vczfXw/ixiHe/LvctoWR3kBjhnjN2xvN53c5JQhwBrmJS10AkfUx399tIZOm?=
 =?us-ascii?Q?ahHHGFfzvrHrrG6O3lOCl29J/kNlErh+w8kF6UBx7N3apLLg9n/aG6KDChJC?=
 =?us-ascii?Q?0mUmah7fzmOvErhI9+V7etPgP7zbE+JF82uZvvmWOIynRduhKxMdUhr+fuOE?=
 =?us-ascii?Q?R7YqIyyahwzVvX8uZxyD/QGEZmmERTUIeXHk0V8810tvfFed83rxMMGQi/E4?=
 =?us-ascii?Q?57CFBmi0/IF7OsvdiQmvUVtxHc6cHMQU/0/+3jBJHkEi7r1XgwJHq5j3Ym4q?=
 =?us-ascii?Q?Pcjhx1Cwsp81x4P+PJ1bBS28JzOOSrhOqVgVu0jF/KH0ed/pTCt56PXwI2mJ?=
 =?us-ascii?Q?Bb/l1F23mVKn9w+rnnrXE/DQ8Eorj3EzSIydYZT8beQJbyigY93qctxun5D4?=
 =?us-ascii?Q?n+2gEb0hCMsbAQpeS1usYSadPzbuqHG5aW/QGktECI7H+t1y6JoE6Qi4AP4K?=
 =?us-ascii?Q?cwxaag=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xK0ARI7hOfFnKt3f8Lr2k+nxsX3zTMTXYHKDy0BTBPPeNXywwWZt2pywSRS5YjdwnpZyBD4qe+joEF7BZzRcZKXShTFJQCef66OHGpb+JdWPDrTwJBEH51ZgTwvxo3AMsN+xKf0fnKh6amFVtD6sdhW9wvqek3fM9kBzUgvwnKiyL5vfdZDTRTpzBAYKYQrH6t0cKJW6xi2CP0/0smN1tP8Ff825OphJWe5B+FysHCPIqdj+Y7P5rMCPgBsY/6YwIKraGutoZM2wmnEs/Og/rsqLRNXFjZ/dc+aLq6RCvoliS0t3GCZKKv0PKZ6FhRU00QbDhN3aaj5qlR/IUUgKedzEN5eOxQUqe7S9c6+IgJT7Q5lT/0LK0kdfFCj/eSMihz6YL3wgn3XfHo3z43vQGmKpFkl4UarpLfSSP5MSajx+Z00RDgEsZ9XPG/ZaZrTd
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 01:19:40.4885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6069658-1dc9-4617-f23a-08de62c24e14
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7953
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4872-lists,linux-watchdog=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:dkim,ti.com:url,ti.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jm@ti.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2CAA8D352B
X-Rspamd-Action: no action

On most K3 SoC's, watchdog reset output is routed to an ESM module
which can subsequently route the signal to safety master or SoC reset.
On AM62L [0], the watchdog reset output is routed to the SoC HW reset
block.

This series adds the reacton control to RTI, configures reset reaction
for am62l_wdt and adds a new ti,am62l-rti-wdt compatible to be used for
AM62L SoC [0].

[0] https://www.ti.com/product/AM62L

Judith Mendez (2):
  dt-bindings: watchdog: ti,rti-wdt: Add ti,am62l-rti-wdt compatible
  watchdog: rti_wdt: Add reaction control to rti

 .../bindings/watchdog/ti,rti-wdt.yaml         |  1 +
 drivers/watchdog/rti_wdt.c                    | 31 ++++++++++++++++---
 2 files changed, 28 insertions(+), 4 deletions(-)

-- 
2.52.0


