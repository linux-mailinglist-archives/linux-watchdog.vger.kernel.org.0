Return-Path: <linux-watchdog+bounces-2809-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A77A0A22CC7
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Jan 2025 13:02:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDFBC1889452
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Jan 2025 12:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145021AF0DC;
	Thu, 30 Jan 2025 12:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lh31g1V+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680F5135A53;
	Thu, 30 Jan 2025 12:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738238566; cv=fail; b=qYlCRvytLY5kLZQ8bXJ3VOAqQXmAW9Zd6mPUygsU5T/dHRivsBKfDCp2viJx7nl2PCu7kzU9rPfbXAV/qTC6VCZUqPdxBuMeZcnxBPJ77DgJ8yhEJquRkC/7DRw/0ecwKv//AS0lu5zBPj3HTuN1IyOMJIgSV4TUPAW7lmC0Rjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738238566; c=relaxed/simple;
	bh=xphN6sRTVEyQd9yJWUuMepdiAeRVZ6D7ZMwHxckUftI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e9gh5bcP+zM6+V4QxKD2ZJ5L8pVn5HcCrHmcuPKDyn/10XY+AOr1mx1b3sP/29EI0MyIarkWJCyl1GC41mr/5Exipz777ItSs5p/rTWIf4IooScsMYb+xiyq8I8uyX/WJU6Ocy1+zAg5KfVm9sQ+t2UaJfRAZe+32xsBdR6rgos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lh31g1V+; arc=fail smtp.client-ip=40.107.93.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WCZOrzYKNCkxZkIPxaVJdSAofbw0qZ9qDTHei6KrhizBSEDdvAE2MwaGUN8q4jb+SfXDWGVhfvPej40O3SrW9qg4IjV3nT4zTxu4jYbg2B1oz6ZNRooUm3Hjja8b4EzumFg3+YOSa4fPeZYtU+dL3IVSKPl8Plv9WLSvZGwQ/c6t3lwYUX04IPJXfWBFTKzHzNw5pwRBS+lt58EispFZm9P5//qLBvZdqrfjd5vS7DTToaO9qKuMlqaCvBv4b7AP+P3L1C+cGOVFfzDLTV3NS4Fl3EpagUkv956EGzDG3a1FSODqTQfyRydGnaq1ae9RuWR7MP+5bXgB9oOEOOfl4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PU1b6MjFWqZ084kRv1SddWL+/M+mQ2ntUHVhm95qMck=;
 b=vIxM5OJ6mrD7RvqjLNG2Gh/1QuNewSojN5lFoMI01cYH5d7E2wZUA//kzNwQKk3WAeBVxjykSYwIFe6tkWfUXHT0fqD73ri79b7VvTmVzJo8WEJn+R/mTDILhfTjrFA+YqOPEHPI/170/Iprf44yyh4IZ+hmXtT3kofufW52Wn7/04auhwavgHA6L9NHYFrf9LXW++12w4l9ms7a6X62m73Hm9wYrmUWHQIK8bqiQ74fZCKZTc1ocZu53U1p9qBHQXnfYi4Lfz4U0GTzRgrRRw5gGLQw3sQePpW5YwCp1nW3oEq6F5T30VccHx4eNLtCzeakNhWSoax7njXFJ4ozfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PU1b6MjFWqZ084kRv1SddWL+/M+mQ2ntUHVhm95qMck=;
 b=lh31g1V+cuV4lXV2Qf8DME0iKWRklDskYUy9OC3EOQHqJhb3sEnEG07BF/dXtOuctcJyIhbGFs0iQq26AqV0WJsoRzCZ/rKcjbniy00HGwWItGUmF0rbuI8smyoBMEAMxJt7/Q+9HuPqdwOCrmhYZLmwGoZq+PgEtYXSPrS52JI=
Received: from DM6PR02CA0160.namprd02.prod.outlook.com (2603:10b6:5:332::27)
 by CH3PR12MB8710.namprd12.prod.outlook.com (2603:10b6:610:173::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 12:02:40 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:5:332:cafe::a3) by DM6PR02CA0160.outlook.office365.com
 (2603:10b6:5:332::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.18 via Frontend Transport; Thu,
 30 Jan 2025 12:02:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 30 Jan 2025 12:02:40 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 Jan
 2025 06:02:38 -0600
Received: from xhdvenkatan40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 30 Jan 2025 06:02:35 -0600
From: Harini T <harini.t@amd.com>
To: <linux@roeck-us.net>, <michal.simek@amd.com>, <srinivas.neeli@amd.com>,
	<shubhrajyoti.datta@amd.com>
CC: <srinivas.goud@amd.com>, <wim@linux-watchdog.org>,
	<linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <git@amd.com>, Harini T <harini.t@amd.com>
Subject: [PATCH V2] dt-bindings: watchdog: xlnx,versal-wwdt: Add optional power-domains property
Date: Thu, 30 Jan 2025 17:32:33 +0530
Message-ID: <20250130120233.742879-1-harini.t@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harini.t@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|CH3PR12MB8710:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ec32cb8-acc5-45c7-2be9-08dd4125ff21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A5o+gXvqm37vqNTQP6QRtGkRPcTKD7b28yG5WjVo2PaTJkYnsDLsqX1Z6zv4?=
 =?us-ascii?Q?CmOSs3eK5nhi+AE+VJWpzf7F7lGcmU6JBgCyJNibBi4F9ETmEea3L8ll3Bbs?=
 =?us-ascii?Q?GWk3+PHqNnjI2ivGOhPyEJATefX2jXwD2pL5dWlR2Bx9ACAwP2l5AcNmRybM?=
 =?us-ascii?Q?wZDfejutm4e/yNp5KwxdsyME9EN7VWTYnv0w3gyYC4CKNmG+/YOLefpKGhiu?=
 =?us-ascii?Q?ZQeH8AscPUmzYSgbH3r8IbdKLCtLM0iQgp0IfxzJnRFWYGzCkVf7eb2as099?=
 =?us-ascii?Q?8ywO+0RcJLMqep/7tn2V+9gY+kbXUeL7mCgupQtIKTg5DZX1GAApI88ONd8i?=
 =?us-ascii?Q?5wbrDa/8ZufM+h+bEv+3R/ir4coW2bRdYOlyVmSgK7TnqlzFxwpaGPIwKWB/?=
 =?us-ascii?Q?t4oRhzCrMBAH/LdVZCBuZ+qlE3jiTNebjvRIkMQrjGZkXINepqjpgi2ClCjZ?=
 =?us-ascii?Q?OfTdHpaAY2ROi9lZ6BvftoZE253V7gSAkyUHOYuNQYXuMlwF3W5tgyoLuhz+?=
 =?us-ascii?Q?D0paN8dp/tJBBTYZww1qxpIhtB1xLMQPQCrOUhtYZzb+sI0JniZ3IGlJKJE4?=
 =?us-ascii?Q?Yaz3sp/Tw/jGK9XvFZsL9KnkSJSa9TRM53ZlNA6AyqksHkZNNJm9iTf8ZhHC?=
 =?us-ascii?Q?OWOZPu0KcEWXBVN8iKgQPD9zFpGLHYHkF6yiyi3oafeDhUO03qDRVnZ8kxou?=
 =?us-ascii?Q?U1OmclQWdkU/O+fPu8CP65wLB/Z2scwEIfbRdLnuROBYs7SszsGbjqpM9QgM?=
 =?us-ascii?Q?7qtpj8pfdcXBZcrDtpJyNMVcg0HKSsbdBdp0rOdvaIdIZIjGzrJvSxF7U23Q?=
 =?us-ascii?Q?P+Cjx/iOk6diqWG35uasO0T3NPpVCxjdFMVzaj32BrPVFPUI+yQvouiRZNUD?=
 =?us-ascii?Q?bCJLBux3y955OfVDqSiWFEToItFzxgcab4E/DqMMgvKxg/bIh/4uSnRl83UW?=
 =?us-ascii?Q?AIQZ4VEKWmJFyb8nkOGcBwryEVIiXH1mN+Jn88dgw1r+MDGpPnIgFaf8hksf?=
 =?us-ascii?Q?RwqY5WzjKfX2+7gUMhqxQLEpJJukFSzU41in74/yKFFeuwBbqdeTY9IZC7gf?=
 =?us-ascii?Q?kzOMk329195+YTgHa8oLqjHtpf7nQ9wfm132ZJvG0qIqvdGBZ+X7uXNwDed+?=
 =?us-ascii?Q?B54FTD6DCwR7zE85EVWLsxTRsh7Pd5hBLse34uVHrH+dgkwfJXwCJWEHJeEY?=
 =?us-ascii?Q?fjOLTboWYRncwSDtT3hNPiOjPOHJSCqDKT3EZtMaAYL57KUBiKaBdCuHfrof?=
 =?us-ascii?Q?3AGWQlk447PmR6iX5B5VB+HiN1RUXH1O0T+b/LraV2nAEZjLAYzAi21gJRJs?=
 =?us-ascii?Q?fSFaOauhPKUPLrhFiNrrNlSQMjd0RkhywP93RPcZ77z0z/ArPtE8Ou6LUomU?=
 =?us-ascii?Q?avBeiNrmw3QVJkA9a9MOu5MtzeSLL1U2tHnYyyII/zRbHAv8bXrwkOp9tCJk?=
 =?us-ascii?Q?zhDA4lsR9W8LMlQD1H9MNjfJiemOnidi?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 12:02:40.5344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec32cb8-acc5-45c7-2be9-08dd4125ff21
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8710

AMD/Xilinx Versal Window Watchdog Timer has its own power domain, so add
an optional property to describe it.

Signed-off-by: Harini T <harini.t@amd.com>
---
Changes in V2:
Update the commit message to specify xlnx,versal-wwdt.

V1 Link: https://lore.kernel.org/all/20250129161014.3882952-1-harini.t@amd.com/
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
2.25.1


