Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A106E1275FC
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Dec 2019 07:58:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbfLTG6u (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 20 Dec 2019 01:58:50 -0500
Received: from mail-mw2nam12on2056.outbound.protection.outlook.com ([40.107.244.56]:6164
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725874AbfLTG6u (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 20 Dec 2019 01:58:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HOh6gcEyx0j6g80syGuZHh0+uQ29IVx3CGRcBADIPs7e+GDkptG7uW3xFB82y2UZ996zz8CvMI9kf1bUuvYTaG02XfkjWo3MgLfFfDdfLi5+cmyYcn6OvQZxlDlDtG5pV33Z0qnslrAutuG4j/nvNUj5bOWdxMC/KNq9yCRIYWZH5au7oTxE6E5/wYYlSqIJ8IyCr2gk5T94P2lDjWycsNitmcmvQbU1142QfzYGaOyzbJNmYhs42BRAfGup+/uJXiZrYaK1doXxEFlWDzUjaKMuun5Hi0+T5y2DeDPwU4Aj/oeHGh25OPG8/LtdnavGUekvlQbnOwnAZYNUwhWtBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4heOmA9Yh9glwYyw7jSt6o5ywg3XqMK2awkKp0hZSG0=;
 b=OPlou1IXNCy5jHrDjdhdCozyEdHmSFLUUWWFewTaoumtlDK+3NnKvm69nvL8Lo8g2Kv5u2Jq0Kps4YCQErW7ySGl5yExZ7NujfSC3V9LCzXgM48L/Irb3dGrFrewxEYOQOCAQPmP/p3hGwOyBqw1WUp7D1AIgO3GjqUh1s16ig+Epe2QbqRXM7GxHYgm4o12nf7A+sqN+ttG6z11P0xEku6dTE+5GAkpdOtUsr/2VRdSPdgcSTvb6bso2IENR88b8AL4LK9qgQFVqfsIBgucgiM1yNszsP5IVL3ET6ByzXurXIzprypdWVxzswfGnJWjd8Mi1XS56tCK7SiiqTyRiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4heOmA9Yh9glwYyw7jSt6o5ywg3XqMK2awkKp0hZSG0=;
 b=Hfjeob8DyFJtmm87fF8AT8Ho4PeN+R6E8Pp6I2X+JPISFUHkz060mDt6dJEwblrIt5puMPfj39T0hteyiMRz2nBVuH58WCsED2dctm5okd13cBUQZwYR2B+TlrISacAQvURzmwiprphEFD449lw3CTUxtwLqBeHsIRK7dX+EpBY=
Received: from SN4PR0201CA0045.namprd02.prod.outlook.com
 (2603:10b6:803:2e::31) by DM5PR02MB3306.namprd02.prod.outlook.com
 (2603:10b6:4:66::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.17; Fri, 20 Dec
 2019 06:58:46 +0000
Received: from CY1NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::201) by SN4PR0201CA0045.outlook.office365.com
 (2603:10b6:803:2e::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14 via Frontend
 Transport; Fri, 20 Dec 2019 06:58:46 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT007.mail.protection.outlook.com (10.152.75.5) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2559.14
 via Frontend Transport; Fri, 20 Dec 2019 06:58:45 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1iiCFJ-0007KK-CQ; Thu, 19 Dec 2019 22:58:45 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1iiCFE-0006Xj-9H; Thu, 19 Dec 2019 22:58:40 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id xBK6wboe032515;
        Thu, 19 Dec 2019 22:58:37 -0800
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1iiCFA-0006WQ-Gh; Thu, 19 Dec 2019 22:58:37 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     linux@roeck-us.net, shubhraj@xilinx.com, sgoud@xilinx.com,
        michal.simek@xilinx.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, git@xilinx.com,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH] watchdog: cadence: Skip printing pointer value
Date:   Fri, 20 Dec 2019 12:28:16 +0530
Message-Id: <1576825096-26605-1-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(136003)(39860400002)(376002)(346002)(396003)(199004)(189003)(5660300002)(81166006)(44832011)(70586007)(356004)(36756003)(426003)(7696005)(6666004)(4744005)(26005)(2906002)(478600001)(70206006)(316002)(8936002)(2616005)(186003)(8676002)(107886003)(336012)(4326008)(81156014)(6636002)(9786002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR02MB3306;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6af0f72-a6c2-457d-8fac-08d7851a0ec8
X-MS-TrafficTypeDiagnostic: DM5PR02MB3306:
X-Microsoft-Antispam-PRVS: <DM5PR02MB3306C6A0CE6522F3F9685DB3AF2D0@DM5PR02MB3306.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:177;
X-Forefront-PRVS: 025796F161
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zSsq6nDel56+e2shLRLEYn40b7NQSxcVa1RAGFqDcVqXPwJIigjQvTdng99Pi3KXMAXGDO8axdAWlM4LQakcuTNdpO2Zn9Bsp4Y9L8g7MdtzlMen42nWZB59XXPIjMh2cUyvJty28ZwRr+ZP4p+VIPjEg8MuuNUvlX3B7broVVuCsh9ZHxpnGuHcDkq7B3WuZhWz22WCyP7PwegiKF/ZW6Y9+XL0pnd2PZWlSfk0PLjLM73DX+LKfWUmwcsbTghQ3VETau/kqy4yI/W83v4HSnh4vxuRoWzBBtOdhXM842HMBfLgcBgSOBCLBAbJjSr6RmPGS9U++sCG+junK+ngiQWoy6h85ODeI43gqv93WlaapnSFxgZZPNLZTOFOjvqR7keNF5MWVwMYFdeR6UxnEYUdDkBrCO7GjI6QzKOcQ0h3tUzhdQJiy7Myj1aEIAw3
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2019 06:58:45.8612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6af0f72-a6c2-457d-8fac-08d7851a0ec8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3306
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

"%p" is not printing the pointer value.
In driver, printing pointer value is not useful so avoiding print.

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
 drivers/watchdog/cadence_wdt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/cadence_wdt.c b/drivers/watchdog/cadence_wdt.c
index 06bd4e1a5923..672b184da875 100644
--- a/drivers/watchdog/cadence_wdt.c
+++ b/drivers/watchdog/cadence_wdt.c
@@ -369,9 +369,8 @@ static int cdns_wdt_probe(struct platform_device *pdev)
 		return ret;
 	platform_set_drvdata(pdev, wdt);
 
-	dev_info(dev, "Xilinx Watchdog Timer at %p with timeout %ds%s\n",
-		 wdt->regs, cdns_wdt_device->timeout,
-		 nowayout ? ", nowayout" : "");
+	dev_info(dev, "Xilinx Watchdog Timer with timeout %ds%s\n",
+		 cdns_wdt_device->timeout, nowayout ? ", nowayout" : "");
 
 	return 0;
 }
-- 
2.7.4

