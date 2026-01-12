Return-Path: <linux-watchdog+bounces-4796-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC364D12B10
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Jan 2026 14:10:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0438300C6E6
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Jan 2026 13:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D90358D09;
	Mon, 12 Jan 2026 13:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="bT/UGCWJ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010021.outbound.protection.outlook.com [52.101.85.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8679C3587D7;
	Mon, 12 Jan 2026 13:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768223345; cv=fail; b=UB/UBKRM7yYaHP86gh4gzteUC57hLdcVwJR/1/HuG7CN3X2jbQxtOdjIu1mwqaHAnAIliBP4wwyDpCD5XfEy9xii1opm5DaUbdKvBhfn4s7gVgALxbep5tVCtU8u4pWhirk371dWy9ddpQDza0HArhYKmg6XHtldTaeV2TvZ+3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768223345; c=relaxed/simple;
	bh=qRI8h4Cw/TxxoKbRNDzCNUPGeN8sgWamsG169Pth99Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nk6/fMIhtWNRam5Bkn2/ocZBxtpgMMPU05wAkAM9i4LfIO02j552pun/YNlQ5kW7y/Z3tA1BEXLQ9GVABfc1hwXEdTF1slc6tVfALwWz5VWBgNMJ8x3akCZLE5SNrAdb2lgpBYNRPqpquJAkuWpVtzTQllpgAYKS2xj/Y0WnYac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=bT/UGCWJ; arc=fail smtp.client-ip=52.101.85.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/kxLXfrajFkE/03ET7j4RsgneoRhuwljhFnwEuaJum2jL5rTz5+MFgINfy29V1sFE5N+wftKEsMq3+jlKH18v71ojKvmB9JjWjMF+W4p/4PeZaPrjjg4q43CyXOA8RYJi6Hiwt+eOPb10pyoQsi9cwKIMTzQQZ79w8Ug2Y45IsrxGjQwK3RmE223VefpNVmCkU0NgjLuBOwss1mP+9HGZOa2rpdfc/7OCM5Jm6/M59tqxZogQt1+Sxr0n+fPe/aY5mTXJKllvbyq48ujHS5PBw/0N/lKip8gYPFjWs9gmD5VW2ngzatuyOudLF5B0tppKtwg3zevb0ncMEnlrHrTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGKphL8uRafGIEp5khSeFT4jf3S0jqRd2zl+TmBf3s0=;
 b=VccIfOVTg6k/70H58nNyxXseXl1VVHxJ2hpX8aAmrZCengC2j0tnUBLSp/7vfKNSUV9Z334DcMqog5EUIV4XppFPkA40yEUzEFCEnxq9cwQHt345Hia26cZNAqibdAXhEtSZ3NibO5i9+tFc3RitZ1d6WSVgEYAbvGpw9aNf0yFyryXesyYK31GC63O7gh6OqluDfWPvq3ckc5/EGL0WyyhWYZxViLKUz0/uACg87oH3ORUTH/1bIZyrg2ISSyVrJAAVadfwJnBI5xsMzju7x+ge5AQgee72qShCeLt6d7W146WfnYQyTViCxEb+nrJU95+tG4iPF8rSrMlJZ+Wi3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGKphL8uRafGIEp5khSeFT4jf3S0jqRd2zl+TmBf3s0=;
 b=bT/UGCWJvW/1bIBtr7U6FwphHvB6HeOEHgCSzFaEl8NYQySag7svhEJr0vgvz6lSGI5uHZkUQuKok01YtRew1KcsWv0qv+fkzflA07R+szja+tgc6VlDA80+Rk4aCXix68CefohG8Ns8I8mRPIx6eTJdFYhhrgJgben7Yhs50GdeB5xi8aVIjuvvOBZSt84Ilhz3abclr36YzmQcgwdyNp0Wl+RHwhH0twsR1L5diRBn13TmxpgHg9gWmsjlAC1FRDRZtE6ZSeHHdlvhgPu/J3RluPxnSNP/kpdsnfUI3ociWbI13idDhj+mMGqlY2TmrTJLdBhdYeQ4d9opidcluQ==
Received: from CY8PR12CA0040.namprd12.prod.outlook.com (2603:10b6:930:49::7)
 by LV8PR22MB5912.namprd22.prod.outlook.com (2603:10b6:408:256::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 13:08:57 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:930:49:cafe::15) by CY8PR12CA0040.outlook.office365.com
 (2603:10b6:930:49::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 13:08:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 13:08:56 +0000
Received: from podman-dev.fihel.lab.ge-healthcare.net (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id CF142F2E70;
	Mon, 12 Jan 2026 15:08:52 +0200 (EET)
From: Nandor Han <nandor.han@gehealthcare.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	nandor.han@gehealthcare.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: watchdog: fsl-imx: document continue in low power mode
Date: Mon, 12 Jan 2026 15:08:48 +0200
Message-Id: <20260112130849.3748465-2-nandor.han@gehealthcare.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251230-pastoral-enigmatic-chamois-b65343@quoll>
References: <20251230-pastoral-enigmatic-chamois-b65343@quoll>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|LV8PR22MB5912:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b3d29476-f56e-4cad-9a74-08de51dbbebc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l2hqojAz1Lv5Z20Cyw3+weiztElBvJE3KPzKg4916GLSVi+hPOksqV59Zq9M?=
 =?us-ascii?Q?UA9e8/WnnXNfFz7mwp9+H+IjAazzjfy0DLFGVdf3hB7LM/dts0L4d5+SBvYy?=
 =?us-ascii?Q?muXR5mZC1lcH5xrbqn4XldR4x37srnnfNa5eBHG4SsPvgt36Ib5UrdAaZ4uE?=
 =?us-ascii?Q?fRVGXrgghj3RUTd7eE5xKmhsH3t+ujFTxpAXTcCrVfndezYDaYfSOkDxb0I0?=
 =?us-ascii?Q?e1+58xbhJYgYKPoXM6rkxbmvj2S7PqpkZQHoD6Ma/xhEJy4bg2njQ3xTmQfV?=
 =?us-ascii?Q?a8Epb7lt5rJnyLGINqU2Dc8W6aruJrZXGyEaTVMX9jynAcGNAxktJc95RPBI?=
 =?us-ascii?Q?zKL6K8Vx24EyMt0zsZbmjVpv4WZBDV5AYINEfOLar0CWgzEK4ib/TUesR/Fa?=
 =?us-ascii?Q?lP7wa8cCIYLx/22Nm7XCpJ1r98NZKNQ8dNaKYgTwn6ANhU1EixFUW8CTWwk5?=
 =?us-ascii?Q?hC+3p9u7ws6sj3BXiChNvW8kWCCqYaApJxEDBa5fFjaCk+B/fJ7ynmDF3frb?=
 =?us-ascii?Q?UqDtYxviUdLqPoPWCkBkCtXVGkyMFt00ztCZfGNHKDTp3/YM7LsaAcxAkJ1p?=
 =?us-ascii?Q?siVXw9m3Ci1Ui93JrQ8eUwi8k1SWePIBUs5Pl7zUnXvWVIPdgDgMpewnle4H?=
 =?us-ascii?Q?t/tH51yxGUJIXBiwBlr6PXG+j7K45S8DH1cSAknMtHt9m9RMsWP+72krLmY6?=
 =?us-ascii?Q?+CKvfzGg7Smi05z2UmVGWjrmOm5ytWEquZU1hjOkt56uds05DIzXNPbElNqh?=
 =?us-ascii?Q?Bm0xfZOCl89JNwIl/L2lYDv7WqWJlnqg1ZcQ6qwH5mJUpZQErqESwN6RUuR5?=
 =?us-ascii?Q?6W6HPOdzMLUs3EBdqGB6rdJLht82uTL+6BTERDx+wjnLfJ1m4CveLdwsFL/c?=
 =?us-ascii?Q?AmmGAwzYDYqd8Ogy0+7gHMyHzFYeLjnqCLJYvHW1tYV+CKgIuS6Oogyint+T?=
 =?us-ascii?Q?dEvdlS/QdZQE/MZTBsrrlwW7+woGA2YeBnjxH0pDX1TT7SaNrLyDbRXUto8J?=
 =?us-ascii?Q?iDzgBWSVqn4vg+s3bPOG6I0N8ri/gs6syKw4ts3O1iU1h8l8PGR3ga1tI3gI?=
 =?us-ascii?Q?Fgzw72zmC+7NciT6YmnFI7ZMFvPgy9jMDHZJCRvDxPsUBpOUedcQISGhNRNm?=
 =?us-ascii?Q?faqkVIp3A/Fdv+5qvkZT0KMWBJukMVyb+uPzFeZ0gpabN4xE2Hb7ZaWFhN8k?=
 =?us-ascii?Q?o2WeGPdPA7rGvMCpA1+h948QVxyk4gQXeLbuRI3Y/A8l6DuuVwHysMVo0qsp?=
 =?us-ascii?Q?phTzNCJH8yjRJTH56GVQro2yZL4WBXPXFnbu7fIYAWG4Qdbg8wXjB87QNMkk?=
 =?us-ascii?Q?bF1b5ry1V1/8d/ZnGwn9urynFOTeGwpP6TLn7D7p14AVZlJhXw3eDrvyUxRk?=
 =?us-ascii?Q?v1legYStOi9QvdOVr1bewL4vSwTpwLMCX9aOHfCKA64/7EOjYnruMm0OuBa1?=
 =?us-ascii?Q?DVamhDvXiszPYYouchss11IbbXliQ0f+wRBF+pMi/CmEuVGC2HmFfna+n4y1?=
 =?us-ascii?Q?g9lsI3AXW/7KOPz9R3kQxrzHYnrbS2yzYlfcS//rkR/OnZ4IH4Vk+sD6KEfV?=
 =?us-ascii?Q?5MnawNE67B+X7zTMnC8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 13:08:56.9750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d29476-f56e-4cad-9a74-08de51dbbebc
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR22MB5912

Property "fsl,wdt-continue-in-low-power" allows the watchdog to continue
running in low power modes (STOP and DOZE). By default, the watchdog is
suspended in these modes. This property provides the option to keep the
watchdog active during low power states when needed.

Signed-off-by: Nandor Han <nandor.han@gehealthcare.com>
---
 Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
index 34951783a633..bf35d02d113f 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
@@ -64,6 +64,12 @@ properties:
       If present, the watchdog device is suspended in WAIT mode
       (Suspend-to-Idle). Only supported on certain devices.
 
+  fsl,wdt-continue-in-low-power:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      If present, the watchdog device continues to run in low power modes
+      (STOP and DOZE).
+
 required:
   - compatible
   - interrupts
-- 
2.39.5


