Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 202FC33B040
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Mar 2021 11:48:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbhCOKro (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Mar 2021 06:47:44 -0400
Received: from mail-dm6nam11on2087.outbound.protection.outlook.com ([40.107.223.87]:24929
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230026AbhCOKri (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Mar 2021 06:47:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S6linc1WSL5bshJWOxhMMM69jGzBmY8lN1ZVQJQ03McveB/RVobcRkSHlPVcSAm/BEkanv6BOITt1SA8oXrZH8wG/6JpaTq0wCzhEOhZwR56ZRS8sjda2rqGHFoc97TPACK1O2e8Jn3eMvVC3uRZaUFyXy9+WCJ+2F+VJA5hHv9SQOMOnsPvVVll2o3a3d4p9K6fPE3yfs6q3jDWwxMsrsdma2zRBxJfa3CgwxbbiKK7NgWlJou8cH30UEgLGw68lr3mnjNs+8dLQRPydQFcNY6aOGazy/VlhLT2x+s1eK0uKajUg0lakey1Asu0XsmPXWT2Kv8DnfMkPgYE38doRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KS3N8TmZ8GRcYaQz8hSAvP/Z/uTEjFXok+04Im5d258=;
 b=WKBzNlQYoZmSTyrzDLxbV+yJdBVHZTDGC7F80rBfHldZoFPE63/ZVhiLUaIYfwTBg/OOL2dX3jlLAdtKfbrRMzK7O6VWvpAaOkbQZwq4c9eklJUhIMUWxMEm+RyMvRTixg3xcvLif/NsAFgdUIKUd1u5e1VgGv+7xYTCe/GzLdl3WYtAS1VI0l4Po2qnQdFWvpjuICRTX08lJbt26jJ6KEZ8tPDDOEcimBpPmG9f0a+C9zICh7R9zwwu1+gxW5aCKgvVWI+UFVD9Hsq8gzowUWd7iWbHMYs/VmUj6GeNJUwFZh0TpdkMy18sDDFe4OKYrhHWZ/5o0feXGQaippqz1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KS3N8TmZ8GRcYaQz8hSAvP/Z/uTEjFXok+04Im5d258=;
 b=ddw5YsiTqM+dRu0HmwhREOZWoNcpWVrCPiDCn+zB2QirTAw3+qAsXFMZ+DlUX3OpcR0+NIvKQbv7EGxg04gzhH9Ux6LuVOFpyNSgB43R7tEfact/N+8Ji+5aFfGRzuTGhHFqHx5H969bXDQbulBEWKQdlwssE38AZRQHY++3gnY=
Received: from DM6PR08CA0017.namprd08.prod.outlook.com (2603:10b6:5:80::30) by
 MN2PR02MB6861.namprd02.prod.outlook.com (2603:10b6:208:15f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32; Mon, 15 Mar 2021 10:47:36 +0000
Received: from CY1NAM02FT006.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::61) by DM6PR08CA0017.outlook.office365.com
 (2603:10b6:5:80::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Mon, 15 Mar 2021 10:47:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT006.mail.protection.outlook.com (10.152.74.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 10:47:35 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 15 Mar 2021 03:47:34 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 15 Mar 2021 03:47:34 -0700
Envelope-to: git@xilinx.com,
 linux@roeck-us.net,
 wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Received: from [10.140.6.40] (port=50876 helo=xhdsivadur40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1lLkl3-00055N-5c; Mon, 15 Mar 2021 03:47:33 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linux@roeck-us.net>, <michal.simek@xilinx.com>,
        <shubhrajyoti.datta@xilinx.com>, <sgoud@xilinx.com>
CC:     <wim@linux-watchdog.org>, <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH 6/9] dt-bindings: watchdog: xilinx: Add binding for Versal watchdog
Date:   Mon, 15 Mar 2021 16:16:51 +0530
Message-ID: <1615805214-24857-7-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615805214-24857-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1615805214-24857-1-git-send-email-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eacaefb0-6699-47d0-a55c-08d8e79fbed5
X-MS-TrafficTypeDiagnostic: MN2PR02MB6861:
X-Microsoft-Antispam-PRVS: <MN2PR02MB68610C3114F9397406F5E288AF6C9@MN2PR02MB6861.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: etD+h/PJLOCvIIpWVJn4Y3v+F+XZj7tVY1V5R6dRDorNGeQ52ZqGipTfVHTYu5Om3WRc0NljVzCAS54eQlhZDemcmEQo+qym07PR/N9DmtlFGXOy+qxayE9n4GqhAkS5vVB5vR0zrz7LWs8yXrlkO/aXEvd+vEufYJ6/6ni+eoqBnsmVRcU9UyG8KSaBrgGEEdHo2NdDfy60rZHnFjYlPHLnVThF+H/3mpJsKu8XWCx3Vq5tEER3E5hVur63ELQUUXgizveEh1ENf0gQ3pjbMHFhd32w3Hf8wGE3DNNCtrLLWnUDeLlsf5UCmbeU2JBOvO2iAmzWBigEuSxz+03CehpmyRhxaMHg6vPAnzLkXOC9MQkteko5WDF09O/bCsMJYcKsiIZniblMfFyX4u8JV4HD8130roXVU+82KTtMmL0NzNpjlULSxLi4A7Cvv/zGfBaLhDXH8UJZQ4kjC+Pr2U/BO3LqB+ZvxryEFnWftVi4rpB7YnBdd5g0CDipUN9zncxg9QJeMyBAxbgLz0ZHAWa0FgBRxM0HNu5dZhtd8RhAajn8yiwcR+cwePUhS8zJPl34pVT6UExTNo2l3yjUdmg4vDRVWsIXILEcgA9AW5FQrk+oR53XRBrJSfmiSDu/EQ1YuwAcyb/r4LpNAASEPFah8l7R3Xh5r6ro4t12QbXqTtYtSiD6Gif0ZyT2LtoX
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(46966006)(36840700001)(2616005)(5660300002)(36860700001)(82310400003)(70586007)(7696005)(6636002)(336012)(107886003)(8676002)(2906002)(83380400001)(47076005)(54906003)(70206006)(8936002)(426003)(7636003)(186003)(316002)(36906005)(110136005)(6666004)(82740400003)(9786002)(4326008)(36756003)(26005)(44832011)(478600001)(356005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 10:47:35.9774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eacaefb0-6699-47d0-a55c-08d8e79fbed5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT006.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6861
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Updated watchdog binding for Versal window watchdog.

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
 .../devicetree/bindings/watchdog/of-xilinx-wdt.txt | 33 ++++++++++++++++++++--
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/of-xilinx-wdt.txt b/Documentation/devicetree/bindings/watchdog/of-xilinx-wdt.txt
index c6ae9c9d5e3e..57903645d685 100644
--- a/Documentation/devicetree/bindings/watchdog/of-xilinx-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/of-xilinx-wdt.txt
@@ -1,21 +1,37 @@
-Xilinx AXI/PLB soft-core watchdog Device Tree Bindings
----------------------------------------------------------
+Xilinx AXI/PLB soft-core watchdog and window watchdog Device Tree Bindings
+--------------------------------------------------------------------------
 
 Required properties:
 - compatible		: Should be "xlnx,xps-timebase-wdt-1.00.a" or
-			  "xlnx,xps-timebase-wdt-1.01.a".
+			  "xlnx,xps-timebase-wdt-1.01.a" or
+			  "xlnx,versal-wwdt-1.0".
 - reg			: Physical base address and size
 
 Optional properties:
 - clocks		: Input clock specifier. Refer to common clock
 			  bindings.
 - clock-frequency	: Frequency of clock in Hz
+
+Optional properties for AXI/PLB soft-core watchdog:
 - xlnx,wdt-enable-once	: 0 - Watchdog can be restarted
 			  1 - Watchdog can be enabled just once
 - xlnx,wdt-interval	: Watchdog timeout interval in 2^<val> clock cycles,
 			  <val> is integer from 8 to 31.
 
+Optional properties for window watchdog:
+- timeout-sec          : Watchdog timeout value (in seconds).
+			 if unset, the default timeout is 10 seconds.
+- pretimeout-sec	: Watchdog pretimeout value in seconds.
+- interrupts		: IRQ line for the WWDT.
+- interrupt-names	: Interrupt line names "wdt" or "wwdt_reset_pending".
+			  wdt - will assert high after first (closed) window
+			  timer expires. wwdt_reset_pending - will assert high
+			  after second (open) window timer expires if WRP
+			  (Watchdog Reset pending) is configured with third
+			  (SST) timer.
+
 Example:
+Xilinx AXI/PLB soft-core watchdog:
 axi-timebase-wdt@40100000 {
 	clock-frequency = <50000000>;
 	compatible = "xlnx,xps-timebase-wdt-1.00.a";
@@ -24,3 +40,14 @@ axi-timebase-wdt@40100000 {
 	xlnx,wdt-enable-once = <0x0>;
 	xlnx,wdt-interval = <0x1b>;
 } ;
+
+Xilinx Versal window watchdog:
+watchdog@fd4d0000 {
+	compatible = "xlnx,versal-wwdt-1.0";
+	reg = <0x0 0xfd4d0000 0x0 0x10000>;
+	clocks = <&clk25>;
+	timeout-sec = <10>;
+	interrupt-names = "wdt", "wwdt_reset_pending";
+	interrupts = <0x0 0x64 0x1>, <0x0 0x6D 0x1>;
+	pretimeout-sec = <5>;
+} ;
-- 
2.7.4

