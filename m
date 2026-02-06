Return-Path: <linux-watchdog+bounces-4915-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QI2aBq98hmkpOAQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4915-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Sat, 07 Feb 2026 00:43:43 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C4C1042E6
	for <lists+linux-watchdog@lfdr.de>; Sat, 07 Feb 2026 00:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7841D305C8BA
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Feb 2026 23:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ADB9312816;
	Fri,  6 Feb 2026 23:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HjmmmjtN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010045.outbound.protection.outlook.com [52.101.61.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBF530EF81;
	Fri,  6 Feb 2026 23:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770421386; cv=fail; b=X59ouWKFCKIx+OJrgBqEGcrgISeSqUzOaZWY65Id2M1U6CwxX5dHNvlK0ouTywzlvhbki7eXk7uBcvCvUhKYzVsH4aXfAxkBdpw2tGzwg8hkB/XrPkoTegQrVYBCm4dLwsfPfmeF2TQIFzixgbtZ+oyjcddYlg0b0YHA2KcHp5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770421386; c=relaxed/simple;
	bh=O53qs+/idqp6mV4QTM+MWnjKgHHpCY4un1+1BdZOJGM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QetzvBoQ8WTbWmdvwNn7all2LNb0Sg4vLD/Tu12RghPJ2oGYgEfqSK18Bkd/NaJDSc+gU1FGzavIdUXYvqMFv2CkNjF5R0j6RiwKJURolQ3fomau+nJeTJtqf88Ht+rIU1+PQJ51ZHbXaeFRrtQnr1MXcqEEPtMpr/S3Gti4pbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HjmmmjtN; arc=fail smtp.client-ip=52.101.61.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=unxXhKZyeePBtqt9jmo2ck/uuMZ7deyBAYTbbutImtNZ/AditfO5IsNBd0agUIjaWbVgF3fbwbDwO3hq5LkC25JIdzfudhJD3OBg3JwzRLEb7SbbQqFiG2ob+t1Lq+rY80JdWeiRY6Bsz8jOcy+eIIUWlWVgwWETNqAN7YY4IuaMMm2IjwC+mtBdX7JphC5w5txIRH/ODeS4C8wIborUGZtGy28zEXZ/qCZn/JpkYdZZHUp91/8Fl3MJPAeacSGC+JtnBCNlo/lH0i/E2zNOPv84RxF7jDxRRItjYp0xQcJQx+Np2xPrAaGAnxNkEENUzIKoLP08setaxJa2xBrVhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlXHgVS/xD12Ln2x1WNlgAwEFcMe7h0KaSkA7FmV7Fo=;
 b=qvjONxNqhRSq1qGHGRN3/pVXKOxazEYrwM7tqkoE59bGPx8zbmgjR/HZhGoQggVufrHqbijR6gVv3ezkAOWQnfMnN46X1iOD//J5UN59sh6uLm8fS5moUdGtTJgFPm1X+Ub+PBpjNzJSY08WtRJhYn41AgbVMfNq22sUCgCZNSn3wT0aUmWEuH2UVcKBQ7R7oepzY5e5qEE5eV465bNB/PHOn/drgzjY87nQPhz8dUTW/90UZKDAnwXb/DN0OTiagEgTpf3bnVJAJZrvuMNwL8OcmjWlgRLWre0Eu8WqnG+AGxQV4VkTYHtysObZCTsuMxQFqjAGQyB4ODTcqRoefA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlXHgVS/xD12Ln2x1WNlgAwEFcMe7h0KaSkA7FmV7Fo=;
 b=HjmmmjtNRaItdp0o4J7hfoUX2xEV2q7J6HKZrV5pKIQUa+EgR2gLcAz7HkMLQFqjJtNTb00Y6f0e1YjCdgsn96MyUtwYp5OMM9q9s6K5LiT1Fx8q+KDh3+vX9aSiShyMrDcRv7SMfw5qoO3K4RqdcZYqxNMx+QUkUcbiTttzUX0=
Received: from MN2PR08CA0005.namprd08.prod.outlook.com (2603:10b6:208:239::10)
 by DS7PR10MB7153.namprd10.prod.outlook.com (2603:10b6:8:eb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 23:43:01 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:208:239:cafe::e) by MN2PR08CA0005.outlook.office365.com
 (2603:10b6:208:239::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Fri,
 6 Feb 2026 23:43:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 23:43:00 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 17:42:56 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 17:42:55 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Feb 2026 17:42:55 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 616NgtrS2138237;
	Fri, 6 Feb 2026 17:42:55 -0600
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>
Subject: [PATCH v5 1/2] dt-bindings: watchdog: ti,rti-wdt: Add ti,am62l-rti-wdt compatible
Date: Fri, 6 Feb 2026 17:42:54 -0600
Message-ID: <20260206234255.380530-2-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|DS7PR10MB7153:EE_
X-MS-Office365-Filtering-Correlation-Id: 7443498d-6ce9-46cd-ddd4-08de65d9769d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yn0ZQOQGCV0V7v82JwhUKEqUZogCm9A3Ze2a4lRcbTJdVFZHtWIoHoPMT3nX?=
 =?us-ascii?Q?6vcFDzeWpjC8+0nEeGLhQQoKEgJPLmOyMajDCdvtso2HlE9QAsMshsaElBC/?=
 =?us-ascii?Q?NmbxESFlRmQ2RqmVv1QynmXOd6jdgcfOH/8ilPe/NWHfJt/ZeEwUXhBxZHiw?=
 =?us-ascii?Q?5xRFa4NPdiuYxawK7JSADMqMMiHbZMMCRIxXXK1Avubeb0BSlhj/4OJRCMks?=
 =?us-ascii?Q?8pLAEVJ4DL8YPWGyY2AzrKxt/olIQ7mQdjNXmbzBUO2GarssZ+d7M/0BX4sd?=
 =?us-ascii?Q?CoDqm7+yX0lybf6Grrx4arltJo82t+38R3tMge8o/d5YFckL8vGEJQmgjoVe?=
 =?us-ascii?Q?rFdOl6fwLP2r08gxybkXrzRmI+qJpVxJcmacQqKb25toN3J5LpezdI/8lAZp?=
 =?us-ascii?Q?t8+8uIU9bxswb8JBXOnAPuNZV36wKQ4Mda2HSMTqF4Txf0c9tZ3m2m0XUqrB?=
 =?us-ascii?Q?LjnK55EhdWHgfFdvkMRHQ8e2k+X9q2/V0Oz2a56za9/Nal2ugRn+tY6olsRb?=
 =?us-ascii?Q?JkFo1PHu+ttHT6forFU18ZshUqNqYEkf/ru4A/4nFVz8F3ee0azcSWqnOnZg?=
 =?us-ascii?Q?VeM1IniJL09c2xwgNc7ipHJ4VvQbbPewhm9LQEkuMwq9rDZwpWbkrqc5SlJb?=
 =?us-ascii?Q?2NKta4zD/08zLfjAFkusA7yCGn3k6eslrZjs+W46Nh4vn4aHdc9ETu9evfMD?=
 =?us-ascii?Q?ly/9oxSuWfyXaIRxhMY5bneMqfcLzQeyEJ4/AAYo12xHHItj+18T1f0cg7om?=
 =?us-ascii?Q?+591cEZak2LBNSD2ZuP4BuhtieEQGUo20r1JiGvm9/U/aAAvBlrGC6U6qiiJ?=
 =?us-ascii?Q?Oja4+hHNkJyvnpznMvUDVkYI9wfFdmPIIA6jzIfkFUAhIKW2DHfTgg1F85so?=
 =?us-ascii?Q?lrd5U4NxuysnjTcoFWZH/OqRrnw2yFNdJ8iUyRFbU/AZjTYHj4ojajxSIywA?=
 =?us-ascii?Q?DvUMLZwmv2NHVp4HvWUsIN807OFsiII1vu2pMe3rgAmc7sUwsJEEQrZLmf0I?=
 =?us-ascii?Q?LkWgSBuRaDACaw8oFMDY/fDS3rgq8AJ4h7aCKOUFnRNOmI13Xy8xy9I6no3R?=
 =?us-ascii?Q?4qKDw9FVF4g9QiBiTtZXCittwrHjzY0SVhrmkFKGiGJQSARHRVfJw8qorfmB?=
 =?us-ascii?Q?cASLCxhRZSLtUKmRDzwXTNPR75aGbc54WQUUZzbN3uh6v4BE89Ok1Fpjk8EA?=
 =?us-ascii?Q?H5R1oOrJrM8cmAPiyGSjh5mrIaDBFGAMPTV1KUbhVqq3czdfwLaVU/zXBy/v?=
 =?us-ascii?Q?KT3oWlwOL7L9YA1UQWH7pODFKAPf7qtPr1SgzKxKVUKhmOTnTyOvsB7Go7Ks?=
 =?us-ascii?Q?MgJ79B8DnLerTb7iwtqRYrKHhtqB0uQj63Qo5+OkzLjJkxYKeE0u+VBT78jg?=
 =?us-ascii?Q?ELB/KO+cxVuz0wyh+SCNevTPpNNg6BeOvL4z9sUb9TqDaQV1vFpjLIwNVfce?=
 =?us-ascii?Q?jzWO5NqOkB1XFVU2zZ2Ze5o64pWq1PSeNqu9QpDN5R321wa8d80Ku6//h3UP?=
 =?us-ascii?Q?+eICt7u/EUEMoUzJ4xZNaPOOx9cmExG/XvuWSY7q/METXVDINxsoQ+8rJtKa?=
 =?us-ascii?Q?uRXQGLtxyveXw2NozabclyC74f0S/YsNvw9FYhaIo+DMUZ+Tq4DREvW3gkRN?=
 =?us-ascii?Q?NJ/RKzHTNdb1pB2NwZkeztDk6DRsuRUHf4M+z8uF1EMhkD3j4b2hF8B1oVI2?=
 =?us-ascii?Q?sTSSHw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tDKkIFsGSKh68X5f/p2J8FAjQIreo5CyJIa4O9lShrvfnm5jBWRj9xQqdIYQwMk5VVYndMkSz0OAJ5NaxD+62dfRsSxrMVg86yOAsN9kpTt94AV01EDU94NJsWxn/LayBWHuSP3fRd6sr07pUKd590S7uIf0stB/4DEnH4q8qselVbdsynKK78Df8Rm8GRPc0ebK5FJNKRjeG2rsuXdEoB2Y7WWt2f9BddI5Ll/gZjtLU3eAy9JoP6Nr3s+fCXKHGFmjzO8McAnfBNKgsYXtHO0XLGEUxNuIkJN4P6n7Dnqj9K5RQe4bXzhzE2qsYQOuTAkno5ZkWbBWNunSqT+/d23+rqFKa8JiWbfsp5krVoLhwCPP+UGHMl2au3moNc3jZJHNMVRRyRT0L8COFm1oKUliz1wpdGRo9sqc6/GB1y7lYPVLQHHc5d3hlIspO5mo
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 23:43:00.4420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7443498d-6ce9-46cd-ddd4-08de65d9769d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7153
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4915-lists,linux-watchdog=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jm@ti.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 87C4C1042E6
X-Rspamd-Action: no action

Add a new compatible ti,am62l-rti-wdt for AM62L SoC [0].

[0] https://www.ti.com/product/AM62L
Signed-off-by: Judith Mendez <jm@ti.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes since v4 RESEND:
- Fix commit message capitalization issues
---
 Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
index 62ddc284a524c..2966e5bfb6c09 100644
--- a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
@@ -23,6 +23,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - ti,am62l-rti-wdt
       - ti,j7-rti-wdt
 
   reg:
-- 
2.52.0


