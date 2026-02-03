Return-Path: <linux-watchdog+bounces-4873-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iI5XN7lNgWlMFgMAu9opvQ
	(envelope-from <linux-watchdog+bounces-4873-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Feb 2026 02:22:01 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C61D3551
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Feb 2026 02:22:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FBF23041A58
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Feb 2026 01:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E54212253A0;
	Tue,  3 Feb 2026 01:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Q2+SeVCA"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010001.outbound.protection.outlook.com [52.101.201.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDED145355;
	Tue,  3 Feb 2026 01:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770081597; cv=fail; b=hG+o3NlzbCbueDbDxHe8MfA9QaxZPo4JNa7FbA3jqmwlWJ+43qslil3hI9HJgo8X9prX7CfSuJPcQBWlkwS4OKHP7IRP/WqweVTPI+8qEJ6aNRPBXEDD3JjbHuk+8Bv29v9PmpU3XfBTrovqIXFpBMJecnbztxOkjjK57Swsi0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770081597; c=relaxed/simple;
	bh=arRkYurkgPZKp/bRaPSFK+lapSx812227NVzYeG0kDI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JtdZEMalW9xb4N9cTkmAOAuAb4L1cwsezKLAeowd1X9tiHOpMFH7z0WghOwgNUes7JsDRpTCOMOQRTVIlGUXQLPoO6p8Tz8HCT04Wvg7mdAQtpObtuFMhRJvCul0v+ivpSOvrGnauAwXuMb0AZYhacLZgdDzx/DdTHj95Momnn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Q2+SeVCA; arc=fail smtp.client-ip=52.101.201.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DxVj8+gicgrjouHZoMdr2odiDpov19apAETed5dXA7RlRbf1Ya8TfiiP6+RxlUn7RaRBfMcDpHXgVwwD32IbG3lKPk6/X5YOhf2YDlIWzER+ujR4EjNPppeUa/XckJMtB71B+ctUxkRRUL9VFOXE8KJT3zcmdoJHy5Ec3nk+yYeKTbe1lzjQNgx6Kxz+s2h5+3etdJOAxWE/YUV5WbYJjuWpjzPicp6sZ564wF/TC0vSH3jT7NhrHIKoPIpMQI5UqLqp1cjIqYLDmPA8R/NqxPOOHIFosh6UX5jJj0wITJ6I5e04n2nHR1n01OxT3leExxN7ko+QJKmTA/YeETmYDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIbWt5+zfjjJnaZUjNdVGACbOC1ymsTb66FKJtBwiiA=;
 b=vIN4EMV3tfVxEAZRtNIzZlnPGkIDZ94veZccBI3oxuIrB5nBM+GD9Ey9ZcesIn333rlIqlNyb44KWEIl2w8qR9EcxiL0qcsa5RX95Baj7ShPoxmVn3s48q6j78bd4Klhtbncy/M8OpHu6BtF+eMIE2T3JDVr/Hk+Sl0TWQXtHyY9v2SKryt1yy6U/1QxA3Q1lHn5Y+7wtX8XmZdYQ00JvrwCwbD/+jJqFyHMkl//Kl7wsLo9SYS1M7kN1vney0C7G1yjufSeXOKDLZWbMrJeGwD86TKZuKlR4gwCoe1gXvkr3iK4yRJ5FW6i+LyLVeJwndHypciZM9OYaop2g+WTcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIbWt5+zfjjJnaZUjNdVGACbOC1ymsTb66FKJtBwiiA=;
 b=Q2+SeVCACdx30UXVfL7ze4i5HsOdMWKH0Fl/zOnb900kK5u2xqTOmaGatwrLWI1Ds20vialZsEaYwS4sjhCPdaOry8RrQov/EsDnJoexsvlxTcPhUqsukySgmIFIuwOu5k/q9i7ouHrIlfPtMe+NQ2GBtdfP2QV4H8CmZOVmMLY=
Received: from SJ0PR03CA0227.namprd03.prod.outlook.com (2603:10b6:a03:39f::22)
 by DS3PR10MB997749.namprd10.prod.outlook.com (2603:10b6:8:345::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 01:19:53 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::fa) by SJ0PR03CA0227.outlook.office365.com
 (2603:10b6:a03:39f::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 01:19:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 01:19:52 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 19:19:40 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 19:19:39 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Feb 2026 19:19:39 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6131JdZR3094273;
	Mon, 2 Feb 2026 19:19:39 -0600
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] watchdog: rti_wdt: Add reaction control to rti
Date: Mon, 2 Feb 2026 19:19:39 -0600
Message-ID: <20260203011939.1013322-3-jm@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203011939.1013322-1-jm@ti.com>
References: <20260203011939.1013322-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|DS3PR10MB997749:EE_
X-MS-Office365-Filtering-Correlation-Id: 340ef421-e1f4-4640-6e6a-08de62c254f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vhKNUJS4s3rlhHFLFjmHTtokjcIQGkwoU+jeKIkz5IfgnQAXOlOx3CPMnFrK?=
 =?us-ascii?Q?i7aUWqRhTDbHnCT8hRyIxshjTUZI1qDn7N4Fcd4DlrFVrCt42Uyy8F97tCsI?=
 =?us-ascii?Q?Mb9he4rckLKAcBo/MVirZiKuuPwG3h5L1WOe3H2Pytvq++yYDu1ZPSjO3Dli?=
 =?us-ascii?Q?dgTOLMlH/outeQhe7czBuGFNg/3ya6JO9/tZiAY0fPJckYwV9r7EsEL/64kz?=
 =?us-ascii?Q?PrIl3oOX5EtekLBpIB2OeA8301R5+ZR/bZu3tkT4z+8NPxwH5eoVDMcrka/U?=
 =?us-ascii?Q?MiVt4O6RNFPRHTu8L2djxPELAnU0+Ery1HvjQh++bt/eLdYb7FUxJGBINcSE?=
 =?us-ascii?Q?etybFaxf+bBgATgzUHnilz439HL9BlBThM/py3c+IFwQcZ4PigMQ9ZAMRnV2?=
 =?us-ascii?Q?h0rJrcf2yWZWs2zibZ6bLbZuClfD+lZLSTSwDjIIfN2+My/39IiLx2hNRpOk?=
 =?us-ascii?Q?Jzglt6kn3mfjBNK/ShZj5YbNt5zKIY+jTbgZteyvQK8pEuQFd8w3bT+ImW3B?=
 =?us-ascii?Q?7CJO2TCLJqduoZ6ipSnP8jxo1vf+lJwwOGdLt2EPIfxrOd8XthcIOdunynE4?=
 =?us-ascii?Q?kwjb8CvVUDUisURadi5h7pQJTI2iMEmCIqJ0iWPxCBvrZMtbLi3bWuR19NTB?=
 =?us-ascii?Q?9BVGM7ZU+JbMQIVJCjnMCaP1Ws6jKevSBedkdPUsbIgxDCJwl3IGTzZSbq4n?=
 =?us-ascii?Q?HnaNdY/vzoueLiDujGgMAEbRtisRJSkCNF6XhRWE7RKuTrjg8vp8iVn8DBDn?=
 =?us-ascii?Q?2EKucQsxzIWHeSfTktuMEKPp5rH/8fTdXMdGP9E8Fq0ifa4KTWueMU/jETWn?=
 =?us-ascii?Q?5yk3TJMPBMlSYFf/QvvfD3XTL1aYfFb5QPOCizj3QOtHovsTDpOIwOKwNRBV?=
 =?us-ascii?Q?40v+TQb1Zs8eEzW38ChLAnuR+rfc3Vuim9cRdBZkGbcRueJjYOj0yrWuvwge?=
 =?us-ascii?Q?bjTX/XQInuUYRjTj6/vRrHVpNPKXRniraSJUxXMGS/r7Dg6GZW8J0qn6j87r?=
 =?us-ascii?Q?68SZtKe+GvUS/Mv2cMU6dnxVYb/r8P8pOUxvRmmlYHi650okkGDyIdiUOPGx?=
 =?us-ascii?Q?084W+6R/0LbdbTPudflIvl7BI4llNS3Wq6u0M6gr6ME3ySdW6t024rTRljAt?=
 =?us-ascii?Q?N6JGvXSOrX+SNDB9b3aBzv/R3i+RrJNqOD03UjnGWTW3dP25rditmkILsiCN?=
 =?us-ascii?Q?4xIHwTDcR+9Tf8Ct9IUtVnq5L+mSvjmyweT4lY02d71y8NH2TsHwPvDdIG42?=
 =?us-ascii?Q?QeK/016q+DmFCssF7ZDEZLv46MLohU46uckDKZKmOlM/hUMDx6BRRihGVWco?=
 =?us-ascii?Q?jQIzCaiTczxWqPjvZhktaAVbHeFArEnLKIt9z7QAGLv39Bd3vEAMeUquinw6?=
 =?us-ascii?Q?V+P8lrzO5wkLmqDOqQA8YFzjVeM1zFjmrKqY15Y830KBaO4BNRhud9mtzAcw?=
 =?us-ascii?Q?kBnD/ZyAXm3+TbFBdQcgdfZ3orcbpnJVa36c841eOlDa9zMoch2m7M09TOYM?=
 =?us-ascii?Q?h9HTMn8fz8IjDlVZYw5g6oLlE6waerAVEDzk0r0ifW9j12Pjgy04cM/bV+1i?=
 =?us-ascii?Q?YixnnwM8ZiLeAZ7nfsPQJ1mjX7Kx+bmcWWFsSgx2AYA5hClJSwqSAcOb6C+z?=
 =?us-ascii?Q?4ZVX2Wfe3VmqF4/Rw6OaxXYQeqkURHvmN197WsH2nnvSpiThWzh+JQh4JDY7?=
 =?us-ascii?Q?RQ0kRA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XQr2W/NM60DMJ1TVOwEpb7BCHga7+MR11cDEpAO4ia+JkHG2fSLezUsWKodmhwNjZDZOfpLvMZmcY0T/7KE9OBpN+ukcanceIhludpeJV1b4m6XQPt+bA+kKZfwttQEuSopyOQot/efyZi3yyYP/gCGPf7VRK/8e/twtzvSUmWyVk39e4QDOLcRuNnyLls8Y9+FKq0CvMIItwdx5ChdIcvuXwI26jWy7r1IjWmjuvNFfGIanqgCz+aK8I4otT2M4zSprQPHSVpKRfqksXZNSyG6nCj95DTbjmUoMFFsuBvdbHzi8vCZlP4sZxr+HzxqXIZpLcCe2HwRJOdG8lzu7cJf0VB+hm53RIY0vG+1LYXW9wzhAUxyOIX8Nok5XcghUCOf/QGTqvbt93QwfyOO7bl7nXZbasgLaoadw3KE7Pc4+QJZNR9gz3z9qULtXAE1X
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 01:19:52.0630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 340ef421-e1f4-4640-6e6a-08de62c254f9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR10MB997749
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
	TAGGED_FROM(0.00)[bounces-4873-lists,linux-watchdog=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ti.com:dkim,ti.com:email,ti.com:url,ti.com:mid];
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
X-Rspamd-Queue-Id: 45C61D3551
X-Rspamd-Action: no action

This allows to configure reaction between NMI and reset for WWD.

On K3 SoC's other than AM62l, watchdog reset output is routed to
the ESM module which can subsequently route the signal to safety
master or SoC reset. On AM62l [0], the watchdog reset output is routed
to the SoC HW reset block. So, add a new compatible for AM62l to
add SoC data and configure reaction to reset instead of NMI.

[0] https://www.ti.com/lit/pdf/sprujb4
Signed-off-by: Judith Mendez <jm@ti.com>
---
 drivers/watchdog/rti_wdt.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
index be7d7db475911..9b8d2ea2606c3 100644
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
+	bool reset;
+};
+
 /*
  * struct to hold data for each WDT device
  * @base - base io address of WD device
  * @freq - source clock frequency of WDT
  * @wdd  - hold watchdog device as is in WDT core
+ * @data - hold configuration data
  */
 struct rti_wdt_device {
 	void __iomem		*base;
 	unsigned long		freq;
 	struct watchdog_device	wdd;
+	const struct rti_wdt_data *data;
 };
 
 static int rti_wdt_start(struct watchdog_device *wdd)
 {
 	u32 timer_margin;
 	struct rti_wdt_device *wdt = watchdog_get_drvdata(wdd);
+	u8 reaction;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(wdd->parent);
@@ -101,8 +109,12 @@ static int rti_wdt_start(struct watchdog_device *wdd)
 	 */
 	wdd->min_hw_heartbeat_ms = 520 * wdd->timeout + MAX_HW_ERROR;
 
-	/* Generate NMI when wdt expires */
-	writel_relaxed(RTIWWDRX_NMI, wdt->base + RTIWWDRXCTRL);
+	/* Generate reset or NMI when timer expires/serviced outside of window */
+	reaction = RTIWWDRXN_NMI;
+	if (wdt->data->reset)
+		reaction = RTIWWDRXN_RST;
+
+	writel_relaxed(reaction, wdt->base + RTIWWDRXCTRL);
 
 	/* Open window size 50%; this is the largest window size available */
 	writel_relaxed(RTIWWDSIZE_50P, wdt->base + RTIWWDSIZECTRL);
@@ -254,6 +266,8 @@ static int rti_wdt_probe(struct platform_device *pdev)
 	wdd->timeout = DEFAULT_HEARTBEAT;
 	wdd->parent = dev;
 
+	wdt->data = of_device_get_match_data(dev);
+
 	watchdog_set_drvdata(wdd, wdt);
 	watchdog_set_nowayout(wdd, 1);
 	watchdog_set_restart_priority(wdd, 128);
@@ -361,8 +375,17 @@ static void rti_wdt_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+static struct rti_wdt_data j7_wdt = {
+	.reset = false,
+};
+
+static struct rti_wdt_data am62l_wdt = {
+	.reset = true,
+};
+
 static const struct of_device_id rti_wdt_of_match[] = {
-	{ .compatible = "ti,j7-rti-wdt", },
+	{ .compatible = "ti,j7-rti-wdt", .data = &j7_wdt },
+	{ .compatible = "ti,am62l-rti-wdt", .data = &am62l_wdt },
 	{},
 };
 MODULE_DEVICE_TABLE(of, rti_wdt_of_match);
-- 
2.52.0


