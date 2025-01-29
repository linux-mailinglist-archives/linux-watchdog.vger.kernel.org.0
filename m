Return-Path: <linux-watchdog+bounces-2803-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4DEA22163
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jan 2025 17:11:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66F031884D50
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jan 2025 16:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4101A8F68;
	Wed, 29 Jan 2025 16:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KW8btNdJ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14021D934D;
	Wed, 29 Jan 2025 16:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738167028; cv=fail; b=f2qKWrSA24hbt6QpH8la9FNAf3biMZifdFPqwRP3/4eaq81qrp7PVoK6epxWFXDrwUZm+TLqn04DgPT4vX97P9dBjte2yTHWX/JAPfofpEAV2cFaIGdy6WeWgRkx/pJWFe0QNE8ePGtpXrS+4fECGkEon0iAC7+/x60x3fun/Sc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738167028; c=relaxed/simple;
	bh=raNyQkOF/zaajSgWsYvdEC73WdDcaxCT/ntqnBRcWqs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ifqJKxvqUGpB198+7v2KXdO3NNMqeLAly90cif5ZURcqU/4gXBpSPUwuQ0fLFAFO/8uGaYQfn1RTHN8I/a+OVktk63W/9JTpvsAX5HSJfau37zTI1eBp3rQRSxLCGyPwy2xyywUdqIg5ZiBtqCv7Iyo4WbbnfcamVwmBxUwgnKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KW8btNdJ; arc=fail smtp.client-ip=40.107.94.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=smngPEvFYENc/nUNdzv2oR5DHPiaeDaXO45tzlwnTK894mYQxxyLPUGKQbv8K8wRWx0hb9ekyhhVP9utb6sTxRTs1VtVcFPNAGtEF/59ba2pVbblcPNx9WX2V9o3OAvmrTGfrZieA3IpAxQCQh+JZswAqDcCewtbur8qUKbj+w5I6yZKolWqcfIp2i762bJH7NwXTSll0AiqBLHp49/8jS4YbdfKhkyuxT4+rlrpj/ifEte9IQz+rMIrZOZgqGJQMMSbfiO+WKfaSQXusoN1U/LVOL2jthaIxtoUesMw2X7xjmLtiN7pCVdpMNvhJ2eGmWkrFRY8mcpFjaUex0+rsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kafEIz7eFTdMYuDAvsllVgyf4wom7J3BwS+kF2njDuE=;
 b=cPpBCxIeGLfPlWDyLQFQ10ULY4AnngEoGZLI7H76a1FmA0348TBEMDwfUctQMaEJH4EPydT5warXtMYJWy3gS8RVockRAiWADD/nQCQWD6ThEZ4Mn6gyFdjx9ZspDnbPjdBKUpLiuRFuEyxZcVWsY7/K7ODqkOVDN9E0+z4s0Q2xFbHTtfbatPYP0OQlfo1JoNIheJ3pobzgeAOFR5XzT0k5MzaRIVQytGwvv7e7ZAmSBWu4y7ggTC89ekiXaKocR2DlTU1fMAB1v/J7Do9L08CKHgXuTfg/ToLfURLXLGWKcA4mMzwVOlFKh8gdy7A3rxXMweZMJG4jxh13XiTGlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kafEIz7eFTdMYuDAvsllVgyf4wom7J3BwS+kF2njDuE=;
 b=KW8btNdJTa7A+QFnTrLUuOHG43p2yNrQ51sK9nmFqP/sARpplGmL3LNPgfhhD8AODBELXEhhW6vovknO0mWHX10dAGj1+AVCahdRSLqyelJJH8s67vYubhhGYTt98SPT+gL7JDbhhNnQ4yaNjw7x5ouJYenGQIz09J6GaEVoDgA=
Received: from BL1PR13CA0242.namprd13.prod.outlook.com (2603:10b6:208:2ba::7)
 by DM6PR12MB4075.namprd12.prod.outlook.com (2603:10b6:5:21d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Wed, 29 Jan
 2025 16:10:23 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:208:2ba:cafe::5e) by BL1PR13CA0242.outlook.office365.com
 (2603:10b6:208:2ba::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.17 via Frontend Transport; Wed,
 29 Jan 2025 16:10:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Wed, 29 Jan 2025 16:10:23 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 29 Jan
 2025 10:10:22 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 29 Jan
 2025 10:10:21 -0600
Received: from xhdvenkatan40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 29 Jan 2025 10:10:17 -0600
From: Harini T <harini.t@amd.com>
To: <linux@roeck-us.net>, <michal.simek@amd.com>, <srinivas.neeli@amd.com>,
	<shubhrajyoti.datta@amd.com>
CC: <srinivas.goud@amd.com>, <wim@linux-watchdog.org>,
	<linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <git@amd.com>, Harini T <harini.t@amd.com>
Subject: [PATCH] dt-bindings: watchdog: Add optional power-domains property
Date: Wed, 29 Jan 2025 21:40:14 +0530
Message-ID: <20250129161014.3882952-1-harini.t@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|DM6PR12MB4075:EE_
X-MS-Office365-Filtering-Correlation-Id: 0225f8de-2acf-4783-ff9c-08dd407f6f78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Iu+OWNpTt9TXLpWbUzDw/Oeg6T7ZdQl8ARDP8GC9UzvB4DuK36ZJfx04yq3B?=
 =?us-ascii?Q?gxTrtiJ5zfJ8sPj/fBbL3bEjFMgYPOe2lmw3jOuyrDDLqDNAvOogUM5/TkvK?=
 =?us-ascii?Q?veoQAeCNFT45euVs3sQR7UNthdaZJcpNWnuIlubE4QGz9hnyRqrzysVcBLD5?=
 =?us-ascii?Q?mdaVaREOZRxZhMlZqKY3LVV8NyjBIrI6MfPmaRy6MIgLGeoePQZOU3l/AIZB?=
 =?us-ascii?Q?/pU4qGRMmp2X23sv7IN32pGG+QIAxPlONMpwEnNNT8SQWslHJ4RsKLOvLvvL?=
 =?us-ascii?Q?YyvT8lUvWNj3HvaxRqL4n/5jJwdFArkk7hPpaiWohWoPh2A7Hkndbqw1wyrL?=
 =?us-ascii?Q?4K6RF84oFzSSL9uVdCptcUwDJ2qf2RqeHjodwFaA3ckkyVoepmQmiMCuyIgk?=
 =?us-ascii?Q?PCnMIb9RL0lCSfvovw4Nw7AjEVUoEw0DITTYmpQhFbMC43MaYODWXrJDK6ii?=
 =?us-ascii?Q?ziYK8NWiRijYissL+tUEY5PNtG4lDOyTAU8x+8KIfnoUlrCDZRyQXA/y8aJ+?=
 =?us-ascii?Q?tWaLHo/0zjmmorHNFdpZYvBFh44pzxvwR6vKJykZKH0xeYgkw2gaNP+FENg+?=
 =?us-ascii?Q?qVZ2FOVPTWAG5GF13Dq3C4SrvkU48qj7JdAsTpw1J/MQCWNJCQDNfyokl0Y3?=
 =?us-ascii?Q?4mrEE5BW8T9I/9mzAXPU/iLG+7TYgE7tiEpMt5ZpGuE4PXK6EH4ui5h5l/Ky?=
 =?us-ascii?Q?pZ7LnxdWjLEygxUNmYno53D5TQg0A4ku0B7eBL5gKtb6TuRr1ewf+jzpZrwR?=
 =?us-ascii?Q?IG8qHFlL5Gb7RWGnnnOqAhC8HhpWfJe70Sbz5yqnWdDY9uLd+d9EIowVuZiU?=
 =?us-ascii?Q?XKvDAQ8FZcrZqHGldEpleDKWlfgUxnEhL71Eu17kDkoubkqqV1HVDtHlWsYF?=
 =?us-ascii?Q?2zhdUclVpE8OsW1UInE/OQ3PRLeLMHzH1uaVkS73AU6EXHgGlB0wm4vFEDJP?=
 =?us-ascii?Q?j8yTweNRzwRnaRUVDtKTZ08Clguk1pK1lu3IJ2QiHHCH7xszQC/7rcF5jGC2?=
 =?us-ascii?Q?PQA0WwoazqbhSPDwTxWbT0mpA4xUlbTFTZk9lHfa5Ooq7VQqmMbJRQKX0zZO?=
 =?us-ascii?Q?jw+xhb0cDtN9F7ym5yjQ71A09F1dHi2l8I0e83tYMiXb5NLOVkas8zPwUV0T?=
 =?us-ascii?Q?yzmHJSbcbQvKigIhXJMMvLKHfNTSF0oH1aEgdAyS/2t0CjrkPzYR7jpY+WYM?=
 =?us-ascii?Q?aV8NBaP5tZ/NmJWwuKaf1XQTWt5uvvGs7wrTOom9leLPEI7USO4hc5rQAWtw?=
 =?us-ascii?Q?Zdvgzqg8eQaHxedYNxqeQFz8xI04FgsiWzPBTlA7gycLvQUarVyE6fyu+x3w?=
 =?us-ascii?Q?/C2xA1txZWlrPuXAPuEN7SaOmOx5eeonybzS5ROnE6+XRTJqHfmpbRAea0t0?=
 =?us-ascii?Q?RHAbyE7nSSL5oyxodj7/8xxCFXv7srsSHnnsk16urYTRKGlAcS/tc/LjUIe8?=
 =?us-ascii?Q?AEqB41D7PsxDls2nMrT7mao8nnlO6zpU+0yxTbt1RV0FjW8bgnMCSwQQQ9U3?=
 =?us-ascii?Q?QqpuCaylkOD5NRg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 16:10:23.0922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0225f8de-2acf-4783-ff9c-08dd407f6f78
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4075

AMD/Xilinx Versal Window Watchdog Timer has its own power domain, so add
an optional property to describe it.

Signed-off-by: Harini T <harini.t@amd.com>
---
 .../devicetree/bindings/watchdog/xlnx,versal-wwdt.yaml         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/xlnx,versal-wwdt.yaml b/Documentation/devicetree/bindings/watchdog/xlnx,versal-wwdt.yaml
index 14b069599740..fccfc785a077 100644
--- a/Documentation/devicetree/bindings/watchdog/xlnx,versal-wwdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/xlnx,versal-wwdt.yaml
@@ -32,6 +32,9 @@ properties:
   clocks:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.34.1


