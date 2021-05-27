Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C92E392B3F
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 May 2021 11:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236014AbhE0J7U (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 27 May 2021 05:59:20 -0400
Received: from mail-mw2nam08on2086.outbound.protection.outlook.com ([40.107.101.86]:41569
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236007AbhE0J7S (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 27 May 2021 05:59:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jn04qJlimVlg6nPLQdDLtlfHlFyslhD3FBMzeuHI+CnO9AhD3PW85DGYG5K8+PXFvzoRStLHCbDQJDZo5UWHhZb0h9yJFD+rTFpl/g+jzPCUUTJKH20mnyTdoiIL/u78hdOlVFm+7Wm6Q1wJ5sx10DszwfbUD4g4DGXYDvj20AjrOrjAr9Ek6l/fUGrQYqqNub8i2fa4C6/2iYneARuQFV+Jcl1/B4B59MAQn7aEawaWQJn2JsiTjLBHp8H/CHz51jIkLrMRRN4aU/okNJ+oUJ/nK46yUTumt3a23pSqjwuYRAgReDdbsseaB8eJVYI/bBdQk8X0t8zbM4bXMQ4nTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ku/2F9WOJqDyaXUVtwSUhuQDlRKbqnsWKLi7R+G+fiM=;
 b=Sgr2f61z/K/HlqCdgQeEXnbMbVe4YblJnZdc83zgr3X3NHmU3DocTyYV8R2k1J3yNutREjpDfeoIsP/PEhym9PTpLDmkRLC59pUWxfFUwZJo7FH7SJxL3JPjoUkwRor5zT/5c25ry0qiSo6b1m6X/DEh/LQFkMrTncm6L9m1JFBL4PelnDzt9MiNnK7wzDnvtu0mt2bfN0c4Mfb4SSCKR6Mrtpd6FCOJJt5XmeoJYdx0Cozs2b36kUKJerXXxXPpplLuzY0jslvUhzPowHPAA+TI9w/I0gx9W/efJqv+GTO5ciPwNHpFH5+8Ml6KCy/ueHKv5jMXjyuYXv9C+2lUOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ku/2F9WOJqDyaXUVtwSUhuQDlRKbqnsWKLi7R+G+fiM=;
 b=nSPWUbvzp4sRzd+np3Tewgf+jMMuJtk90UnuYSHLNFqFSE1Uq7/vnu/PKVETbCN1XcqNdUduKmIaOkW+a5M1bOH8ItdWrw6vAvNfz5tB9SA01S9jUDIft5rCWB2/ztz0XCJP/FeaM/tPlba7idOrMuFWYB+EDw8cDSEOiGZ2SIw=
Received: from BN0PR02CA0023.namprd02.prod.outlook.com (2603:10b6:408:e4::28)
 by DM6PR02MB6812.namprd02.prod.outlook.com (2603:10b6:5:213::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Thu, 27 May
 2021 09:57:44 +0000
Received: from BN1NAM02FT022.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::4d) by BN0PR02CA0023.outlook.office365.com
 (2603:10b6:408:e4::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Thu, 27 May 2021 09:57:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT022.mail.protection.outlook.com (10.13.2.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4129.27 via Frontend Transport; Thu, 27 May 2021 09:57:43 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 27 May 2021 02:57:32 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 27 May 2021 02:57:32 -0700
Envelope-to: git@xilinx.com,
 linux@roeck-us.net,
 wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.80.241] (port=49918 helo=xhdsneeli40x.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1lmClf-0007Zl-HK; Thu, 27 May 2021 02:57:32 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linux@roeck-us.net>, <shubhraj@xilinx.com>, <sgoud@xilinx.com>,
        <michal.simek@xilinx.com>
CC:     <wim@linux-watchdog.org>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH 3/3] MAINTAINERS: Add fragment for xilinx watchdog drivers
Date:   Thu, 27 May 2021 15:27:09 +0530
Message-ID: <20210527095709.12841-4-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20210527095709.12841-1-srinivas.neeli@xilinx.com>
References: <20210527095709.12841-1-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39c1da88-d7ca-481f-4132-08d920f5df5c
X-MS-TrafficTypeDiagnostic: DM6PR02MB6812:
X-Microsoft-Antispam-PRVS: <DM6PR02MB6812F22F6B8C5EBF6908494DAF239@DM6PR02MB6812.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b3ZgX/+XQ2alH0pfRzqpVlQU8f6iYUukbwktPs0DwPrplodj+bLMrMHGQy2v/Ab8RNVUCVGggp/kf2zdFzyYnDQ4jKGoeLwhwzluloNBNdcSg4cwfmG1C6G+2oxs+ImYjQwUkaTlOBdBAuqbUApTGh5cgh0iaeZVRSBY4xBvpbyIyH/OggRyCs1KHHsvA3AutxuMIABvHaRnIi5oTfyLOcQwuZVKktz5AikdmCNRaXYIUGp4rYwo2w1uxNn9cfP+c5UKfTOAw9+dN0jOezB7FjIYpPPlZt2Ij3k4dTOnrMBJ6UwWjtSm4N9vy5043Wd01hQmIGR4eotE2r5MEOvvu2JaWt8VITTO6pRwrIskDevMSyF8d5HovqzjtzscLJOvxuJB3VnK47nrC5RxXpOJxCPCKxfGShRMFrWVtvcjq8+cdpmvNO/vZnKWkX57uU4IWM25za29tmelWUU//MgBwmzdadbNmr4Qa06qF9GrGEVkFlNNK8UHzPtUO5FcJCbwqTk1RHpdYGb5vyrPgnrYHix12sUc9QuiBJ27Kq/YhxgeHIGsQkZ1LwFkftL4KzB6i2HIeKPYEfyRcL7N4H6LBttT+JAL3LiT+ca/3fP1XWdAfA45oN3MvfwYy8sd2/P2Z3SDviAIdW0YePpY9HvujCJNyfEouq/JJhs76JD34dXJ5y2RJXIvmt1siNaK6Lxa
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(36840700001)(46966006)(6666004)(7636003)(9786002)(54906003)(426003)(107886003)(6636002)(356005)(82310400003)(47076005)(82740400003)(8936002)(8676002)(36860700001)(2906002)(36906005)(316002)(36756003)(70206006)(4744005)(5660300002)(7696005)(2616005)(186003)(4326008)(478600001)(26005)(44832011)(70586007)(1076003)(110136005)(336012)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 09:57:43.4608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c1da88-d7ca-481f-4132-08d920f5df5c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT022.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6812
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Added entry for xilinx WATCHDOG drivers.

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6e183abbbd2e..2fd332e11e1d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20081,6 +20081,16 @@ F:	Documentation/devicetree/bindings/media/xilinx/
 F:	drivers/media/platform/xilinx/
 F:	include/uapi/linux/xilinx-v4l2-controls.h
 
+XILINX WATCHDOG DRIVER
+M:	Srinivas Neeli <srinivas.neeli@xilinx.com>
+R:	Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
+R:	Michal Simek <michal.simek@xilinx.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/watchdog/of-xilinx-wdt.txt
+F:	Documentation/devicetree/bindings/watchdog/xlnx,versal-wwdt.yaml
+F:	drivers/watchdog/of_xilinx_wdt.c
+F:	drivers/watchdog/xilinx_wwdt.c
+
 XILINX ZYNQMP DPDMA DRIVER
 M:	Hyun Kwon <hyun.kwon@xilinx.com>
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-- 
2.22.0

