Return-Path: <linux-watchdog+bounces-4913-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3Nm/NIp8hmkpOAQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4913-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Sat, 07 Feb 2026 00:43:06 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F26801042B2
	for <lists+linux-watchdog@lfdr.de>; Sat, 07 Feb 2026 00:43:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5EB023041799
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Feb 2026 23:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B008310627;
	Fri,  6 Feb 2026 23:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WOAPvhD1"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012030.outbound.protection.outlook.com [40.107.209.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9204C23C8A0;
	Fri,  6 Feb 2026 23:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770421381; cv=fail; b=NRmTrI0HBBRyePO97H1yBqNpZTyxXg+yDPGBPRFblvReJpjmw7dfOmToQ4HlW9Hpw+paxVSRjGwIqLgjWeXmnXWn8+LFAuWc33BZxBnOhGQv7S6rvG3Rf4tWrRKtMZIp2eTaYFFKGILkwOeiRV1YJu5oWmUTd9vIVUzK3fakDtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770421381; c=relaxed/simple;
	bh=Ie/FEqHR1y1xcm80BK0e8V3y+LMF1K7eS28G8nHuGrg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qnZdl38XQ5LyJh63Ne1f87esMf6S9HteFAS5tN+3Q7Ttxtb8iQGtfdFHGW9UbtJvGMogl393dXaOChFKthUBq8bl3w6YFqYcOhFM0z74is6CbFcj1dTK4q5aUUiAvFQhQcRISXA6JZSgfisB9gxNLQBWPcKtmxwfQZLJzHS7MMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=WOAPvhD1; arc=fail smtp.client-ip=40.107.209.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DSwGLfVi08KEhzSsIDLreEK41vP+7QuAORTxOnJ552u4l+O9D1rsu6eZN5G/9YWR+2y9vR2Hbwrs/8rmePSPmexx3YvIySGFXVQXK1BdSbGPpAQZclU2vN+BFvqj6nG/smyApEwbiSYzTbduxAdJa/RXyFNjcMmrAWs0lr1E0Owyyzd2cLj2hary0ppqIq5UzEZqhiHnF/Rf9dyOXkFL8PfZ7MdatOsrfBhBK1v6FOTion4b1fbWUwqkUjg4oTiHfOWmMVU47A/vhyg8GGcdRKYVSrhr3MAtdhCnEWZ8YiCInO0bNQ8WVGT8/W5bPPq1e2UMS2Nq8e2Z436wAnYpXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=urp4ndUhQFtxytKM8h+3K9g1/4fBoIAOmvceAoyW82g=;
 b=rO04OyZJgQWyx5sZA8nVCHAf0a6pjPIf8UZMIecC6Wuc+LNGC/x1jAqbSCo5HBpfgEWvdPfTNc6FbZqCF/6j5v1KIDCaETcyIJLEBjM5gi2kPmZiyFOtbv1kmYafrB79f1ckFNd2JHsMzE6ht6V0tuymvuMKE/ZhhRirz2Uwo0UJ2EtF1tCJvNrWvNp0FlRi1+EwuOchF9vfVwi0SE4ojpovuRLwnLZMHWP/vMsp1sWQvyJ5+w8Hg7PpdvwvqFwEH596tOia3+JIBs2+h6ksgru/5aLA+JFK6sR2+VrDCZXEJPwmkXyVF/7ozEtGDcYiyjYSxmmqe6JuOXVhPWtYeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urp4ndUhQFtxytKM8h+3K9g1/4fBoIAOmvceAoyW82g=;
 b=WOAPvhD165Wy8Mdko0rlzA95FP7en5IaCe5cLhyJohrVPmwd/iuRHYMoHomIhWh6zKFQ7YLjw+k3v12FGU9kWEPzt24vaP25V5xha0KvQgbplFo3GmF/7wtArUIcH3Wv6+q/8xV2CPrZ+gfrKzEaw5CBjEFTsHq1ydBIsQgRgWc=
Received: from CH2PR19CA0002.namprd19.prod.outlook.com (2603:10b6:610:4d::12)
 by SJ0PR10MB5743.namprd10.prod.outlook.com (2603:10b6:a03:3ee::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 23:42:57 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:4d:cafe::9d) by CH2PR19CA0002.outlook.office365.com
 (2603:10b6:610:4d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend Transport; Fri,
 6 Feb 2026 23:42:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 23:42:56 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 17:42:56 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 17:42:55 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Feb 2026 17:42:55 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 616NgtrT2138237;
	Fri, 6 Feb 2026 17:42:55 -0600
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>
Subject: [PATCH v5 2/2] watchdog: rti_wdt: Add reaction control
Date: Fri, 6 Feb 2026 17:42:55 -0600
Message-ID: <20260206234255.380530-3-jm@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206234255.380530-1-jm@ti.com>
References: <20260206234255.380530-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|SJ0PR10MB5743:EE_
X-MS-Office365-Filtering-Correlation-Id: 93131b7e-5e8b-46ac-3584-08de65d97448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QJTY805E2DyVZ5Tk1kG3qHyT4wdMsHzupEukHk68J9q/F0pRGl7/qlCarCFJ?=
 =?us-ascii?Q?DZYJAd0/vo2wMpHskZnxq658zyGCaO65GrdG1xSkJerY8siR3cAVhB4L3mQB?=
 =?us-ascii?Q?vQwnNmusiv5CyGydALXWmC4h7tWZJzOfkgSd3d10fg5409V3U70jhcpfLQHE?=
 =?us-ascii?Q?DraorpxAs0zjvNv1CNmVwV23S4QxVbS1r6R+LR/0q2Fp/KmEYrip6frp52Te?=
 =?us-ascii?Q?nyqp/7VdBsZIuldbb2XkyYRJRdZWO4DDEitRmM8VpYeycDJQeUczLSzmFSvt?=
 =?us-ascii?Q?v4RswJ+tT0aMRp8cN88cf9RxWZgSZpJAdCva0IbQysZDMuQHMvy1t3C4vChB?=
 =?us-ascii?Q?mCgShy4decrhhCeAD0mcs0SlLfhCKSR/JNtV0aQ8/qRlCtzQmtjjyY3Jrg1b?=
 =?us-ascii?Q?nx5BOs3wORfFqAraa7Z/nMtzN/3U1VG4z3MLOUBrTbgxNZn/MOO5EaSAP1ts?=
 =?us-ascii?Q?5CBLQ2S4BL6Tt3SiWOa5ezT+MqHgyggwN3Q1X5IQBA5gXf2MLGdP+Jdd0nTz?=
 =?us-ascii?Q?OdRjUYu5yHSSaKe9a5QVX7k4zURvUwtGfncDumnYISypkWFmOyIZdXKTfim6?=
 =?us-ascii?Q?0XtLAJ/kTKZgu7Vnkn2uVcyfptbgj4BvJGBcFkQZxuLteou2XSPZrwqriN6M?=
 =?us-ascii?Q?HTa2cNgYhuHFzTusG3it+XHxdykMtXnsTbX8oWNMihpJAsh2uzScccFB00Rs?=
 =?us-ascii?Q?NNk8e2pD53KiBIPO7fECDK1EGMI97KoovIqTih1cUpuQB9CeAkBLJp0szGBn?=
 =?us-ascii?Q?U1NGrn72jra+rYI4gdtqDHt92Tn4FgKhX1jKCEIBILOYeGk3ABsrJzLSB/Jt?=
 =?us-ascii?Q?oNFGs+1n/fxnDaPtHStQzWQPI4XQkeYWT6CEfIHg8m8LnEmrg2sdLlmo9vfU?=
 =?us-ascii?Q?L462zht1hVw/Y0Mz8wnOkzzNhZxmN2Cbi04Fiu5U5wxrz5ag4rvTc9helCY2?=
 =?us-ascii?Q?pY1+Ah0RC4eBtCrtygq8o52n92nR6fcwjulpOubdWdsBDthcHO8+VaRBt3NQ?=
 =?us-ascii?Q?a2wspoD9nOGax9IiAwUr7y2rG950i2RAcWIHfOrFFnhc9FB1nCPvkbZLlc+b?=
 =?us-ascii?Q?szrWgMWgxv4M+XPuH7W83Q1LhSvWoITEb14so5y8gYdB1qU83rMUmvWkKnkn?=
 =?us-ascii?Q?qENVyXWTnmFzgDwOdHWB69syETTzLAyMxs2viDtQjyCd0Py5yEMHu8aDlOs8?=
 =?us-ascii?Q?T0fsS4pDxMuXCmsRyOXEC79jZvNwWACpR3QSMgQvYB7B/Ft5YMAKKC+0EPGZ?=
 =?us-ascii?Q?K3rYq1Zg4kQo8ilC72UIcPdcUpVyNv4bHXVB9x1iYzBgJ8d6mWAOJSF5Vor9?=
 =?us-ascii?Q?3k3LJuHDaFlFHcE4w/MWl2uodYLAKq//rDhQ7MDgdKS0Bjn6jfdRdsUZ8acW?=
 =?us-ascii?Q?lAq20F+2Hcv7Drlb2xkmvZ1po+sl1++OhNzzij4xFuyayvKjPZknq1japTn8?=
 =?us-ascii?Q?OXR4JCxbjjvmSbMhbe+Gog2H+wpkxFEr+UlJdKinYoe/Kf/EhnAUrmJ9XL79?=
 =?us-ascii?Q?5WFeA3w45EpBuOqDD+Xwbvhy6ANNZEgQcU5ljs9UW3a4JqhZI38Fegj1r+D7?=
 =?us-ascii?Q?coOLMlJWlZSc+4k7qHdKn5HdBG5RM7FQMxlPCmuwZRd5nH7dQQq5b5w57yuH?=
 =?us-ascii?Q?hD5STQY0/vlbs25PYAT2yWQNj2vIr2V0w/s4Hvs4sWvDeGhIKdNxtvObU9qk?=
 =?us-ascii?Q?zrYN2w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	V0o6WBiDr0RVemQkgY+aJOCCDh3bbT8Hsf6O3ck+YPl3V8KrEAuIzbqXKYgWDNYKr8YwgJHdxA282DikaBiUGQQxTpic7unoV3x/UCkPobfgCOCpACVcZmfhbk1NzmexIRaCgVDn8x5lOvxp/C5AQNl7pxozj0hbkPkN9OaewlZoo7G+XWRqTh04ohHTfNXbanpjQRYcvBQ/MqRaRY/jr3/3aWVfU0qF95wXfM3XX8kIeMNLzw2X5VxCLVTv0Nh9AAGfkkh2CRWqAJnC5iHJnAZ0iwME5Alj8S3h7DH/GAkTijRlQIkZxTdM0tGYUd/gw2vif2dL8DH06gntoHnQHtrOwxDzpNuAx2j2zLyW+I83m1Vw1F/mpynBbEPhxdHyZw3bgH9mPr7//Go9/E02MDzLi+di2t/QoWuWtLD8SZc619QTPXy7k9u/QLLIRp8Y
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 23:42:56.5447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93131b7e-5e8b-46ac-3584-08de65d97448
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5743
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-4913-lists,linux-watchdog=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jm@ti.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.989];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F26801042B2
X-Rspamd-Action: no action

This configures the reaction between NMI and reset for WWD.

On K3 SoCs other than AM62L SoC [0], watchdog reset output is routed
to the ESM module which can subsequently route the signal to safety
master or SoC reset. On AM62L, the watchdog reset output is routed
to the SoC HW reset block. So, add a new compatible for AM62L to add
SoC data and configure reaction to reset instead of NMI.

[0] https://www.ti.com/product/AM62L
Signed-off-by: Judith Mendez <jm@ti.com>
---
Changes since v4 RESEND:
- Fix commit message grammar and capitalization issues
- Store only needed bool nmi field instead of pointer to match data structure
- Add NULL check for device_get_match_data() with proper error handling
- Rename data structures with SoC-specific rti_wdt prefix and add const
- Update struct documentation and clarify WDT expiration comment
---
 drivers/watchdog/rti_wdt.c | 39 ++++++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
index be7d7db475911..c3c7715140ea8 100644
--- a/drivers/watchdog/rti_wdt.c
+++ b/drivers/watchdog/rti_wdt.c
@@ -35,7 +35,8 @@
 #define RTIWWDRXCTRL	0xa4
 #define RTIWWDSIZECTRL	0xa8
 
-#define RTIWWDRX_NMI	0xa
+#define RTIWWDRXN_RST	0x5
+#define RTIWWDRXN_NMI	0xa
 
 #define RTIWWDSIZE_50P		0x50
 #define RTIWWDSIZE_25P		0x500
@@ -63,22 +64,29 @@
 
 static int heartbeat;
 
+struct rti_wdt_data {
+	bool nmi;
+};
+
 /*
  * struct to hold data for each WDT device
  * @base - base io address of WD device
  * @freq - source clock frequency of WDT
  * @wdd  - hold watchdog device as is in WDT core
+ * @nmi - Set if this WDT instance supports generating NMI
  */
 struct rti_wdt_device {
 	void __iomem		*base;
 	unsigned long		freq;
 	struct watchdog_device	wdd;
+	bool			nmi;
 };
 
 static int rti_wdt_start(struct watchdog_device *wdd)
 {
 	u32 timer_margin;
 	struct rti_wdt_device *wdt = watchdog_get_drvdata(wdd);
+	u8 reaction;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(wdd->parent);
@@ -101,8 +109,13 @@ static int rti_wdt_start(struct watchdog_device *wdd)
 	 */
 	wdd->min_hw_heartbeat_ms = 520 * wdd->timeout + MAX_HW_ERROR;
 
-	/* Generate NMI when wdt expires */
-	writel_relaxed(RTIWWDRX_NMI, wdt->base + RTIWWDRXCTRL);
+	/* When WDT expires, generate NMI or reset if NMI not supported */
+	if (wdt->nmi)
+		reaction = RTIWWDRXN_NMI;
+	else
+		reaction = RTIWWDRXN_RST;
+
+	writel_relaxed(reaction, wdt->base + RTIWWDRXCTRL);
 
 	/* Open window size 50%; this is the largest window size available */
 	writel_relaxed(RTIWWDSIZE_50P, wdt->base + RTIWWDSIZECTRL);
@@ -210,6 +223,7 @@ static int rti_wdt_probe(struct platform_device *pdev)
 {
 	int ret = 0;
 	struct device *dev = &pdev->dev;
+	const struct rti_wdt_data *data;
 	struct watchdog_device *wdd;
 	struct rti_wdt_device *wdt;
 	struct clk *clk;
@@ -254,6 +268,14 @@ static int rti_wdt_probe(struct platform_device *pdev)
 	wdd->timeout = DEFAULT_HEARTBEAT;
 	wdd->parent = dev;
 
+	data = device_get_match_data(dev);
+	if (!data) {
+		ret = -ENODEV;
+		goto err_iomap;
+	}
+
+	wdt->nmi = data->nmi;
+
 	watchdog_set_drvdata(wdd, wdt);
 	watchdog_set_nowayout(wdd, 1);
 	watchdog_set_restart_priority(wdd, 128);
@@ -361,8 +383,17 @@ static void rti_wdt_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+static const struct rti_wdt_data rti_wdt_j7_data = {
+	.nmi = true,
+};
+
+static const struct rti_wdt_data rti_wdt_am62l_data = {
+	.nmi = false,
+};
+
 static const struct of_device_id rti_wdt_of_match[] = {
-	{ .compatible = "ti,j7-rti-wdt", },
+	{ .compatible = "ti,j7-rti-wdt", .data = &rti_wdt_j7_data },
+	{ .compatible = "ti,am62l-rti-wdt", .data = &rti_wdt_am62l_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, rti_wdt_of_match);
-- 
2.52.0


