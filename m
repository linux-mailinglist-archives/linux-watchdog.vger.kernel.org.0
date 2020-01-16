Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3D313DBC7
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Jan 2020 14:28:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729011AbgAPN1n (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 16 Jan 2020 08:27:43 -0500
Received: from mail-eopbgr770071.outbound.protection.outlook.com ([40.107.77.71]:4590
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727040AbgAPN1m (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 16 Jan 2020 08:27:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FamapzhXUPkBLb6ImhFZwp1HMzoA0txZbD0rL2K7B22FXREXSLAkUPFCjwLjOB0TSIMYVuqCgyFjRqH4oA3iQdcEQgs8k0OaP+iLGfsCtPGYSncqmngcyIkWEAMa+xP+Ph4Zl5hb4cGZL3xR0lCV+7LokvuUPOS4N6b39njLOqJS/uW8/wouNd4nTnC2OS1PdyUmcaB5zd1dDhUjsQwzFPIEat7RLpgn4MQ8pjzpbwjKzmdgfmH+BfCjD9I1xN9C8KAvqRXwjY/I1KUps31ZNiNg7nJbH6Z+g/dqQ7qcAMfzBL1EBkTW3FrG/bpQU8x8HRqdvpgm8AeMzFLR8PuoZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vaLKgV2hKDjNsQHLCMzj8dPy9LAJdAjgdQDN8/T02Cg=;
 b=eDjofzOTkXxGMxGTTyT7Sl2ZA6qMk1wVZFs+d3np0zD1i5Bd62U7FCERuLi/Jmrs0L5rCh7AdxVhm+JOoCuERSzHR0qmSsyDXasfKdcvbiM5rdWqm2KK633cxvvPzcP6WgaorHlhrLmygQcD0MjnVbWrh8usFdKl46N66nSB0cgJ6Nwgu6meRLHP0W0s1oaXzNVFfknU8w/1an9F69nJnVHB/vCoyVGrcqHUlOHyUfSeF8j+PQUyVNHtiiYKA8i13en625u7Q2jxDs4lp0fmnnFS84c0uhXp+29y0EHIHU2unBtzX1aH2VjkqOmoa/EWJFQ9AXogJvxbvROrpXct0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vaLKgV2hKDjNsQHLCMzj8dPy9LAJdAjgdQDN8/T02Cg=;
 b=h8/szk8Qu55FpqE9Oxu5IhAGQc5UXwJfISEJfM+amJAm0k04PwEivK/dC/oQnFDUD56JF9J6ITxB3gs51ALQ5OQQIgM7LL8vzTtNEgMmSsKgt3b0vGIs6n7aYpQAL9bmgz9EBQplhVBfB7/6CoKNGdA2Rk+qkc4E1wsCmhWNNTw=
Received: from DM6PR02CA0131.namprd02.prod.outlook.com (2603:10b6:5:1b4::33)
 by DM5PR02MB3653.namprd02.prod.outlook.com (2603:10b6:4:bb::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.20; Thu, 16 Jan
 2020 13:27:39 +0000
Received: from SN1NAM02FT013.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::203) by DM6PR02CA0131.outlook.office365.com
 (2603:10b6:5:1b4::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.18 via Frontend
 Transport; Thu, 16 Jan 2020 13:27:39 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT013.mail.protection.outlook.com (10.152.72.98) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2644.19
 via Frontend Transport; Thu, 16 Jan 2020 13:27:39 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1is5BS-0005wM-RD; Thu, 16 Jan 2020 05:27:38 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1is5BN-0001FY-Nc; Thu, 16 Jan 2020 05:27:33 -0800
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 00GDRQIU015743;
        Thu, 16 Jan 2020 05:27:26 -0800
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1is5BF-00018J-UI; Thu, 16 Jan 2020 05:27:26 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     linux@roeck-us.net, michal.simek@xilinx.com,
        shubhrajyoti.datta@xilinx.com, sgoud@xilinx.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@xilinx.com
Subject: [PATCH 9/9] watchdog: of_xilinx_wdt: Skip printing pointer value
Date:   Thu, 16 Jan 2020 18:56:57 +0530
Message-Id: <1579181217-31127-10-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579181217-31127-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1579181217-31127-1-git-send-email-srinivas.neeli@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(39860400002)(189003)(199004)(6636002)(70586007)(44832011)(2616005)(2906002)(6666004)(336012)(186003)(26005)(70206006)(426003)(7696005)(356004)(478600001)(4326008)(9786002)(107886003)(8936002)(81166006)(81156014)(8676002)(4744005)(5660300002)(36756003)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR02MB3653;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42b68930-dc79-4727-b7cb-08d79a87dbb8
X-MS-TrafficTypeDiagnostic: DM5PR02MB3653:
X-Microsoft-Antispam-PRVS: <DM5PR02MB3653D608FE966213A4536E65AF360@DM5PR02MB3653.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-Forefront-PRVS: 02843AA9E0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dHwa6tMjsm3GY/IRBRR5yxd0ewvrfPAJXFzyp6hbi6Rt8YPnT7znm1xReV7UyibZMQ3vqRryvzaBGcd/wCiDV4sOLLsthbNX1W2kl6yeZOm3EorGAAreVa6V49XSvfqasgZIq0xpvxT+2QYiuKe1uotgt961GOwVQxS8jEP7bye1TfsDF0A0B7HmrG+FQttsW2/q6G8HISw1Etl7jZctFmr9gSFa6GvxUputiCO2JCIuNn/MwXX2sseZfXBgGDCb7YyNU7MrxZDm/DENC3f3hd3IkfZRxRRPnAlWtqs4pEBEg+6DNjhM30GF+MIWFHh9tO5B0J3MZ8E9LegjXfWjuBBmhxV+jeZPI5U8AlsZrtwb7ijKAeecqHwk7A/qIgIfqwOTHXh+nuD65mx7FAFiujvhUal5AybsCBiCrtWsHZv9g//0aWvs5kdcAYewFbKI
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2020 13:27:39.2662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b68930-dc79-4727-b7cb-08d79a87dbb8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3653
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

"%p" is not printing the pointer value.
In driver, printing pointer value is not useful so avoiding print.

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
 drivers/watchdog/of_xilinx_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_wdt.c
index 375289e3bed2..37133527977d 100644
--- a/drivers/watchdog/of_xilinx_wdt.c
+++ b/drivers/watchdog/of_xilinx_wdt.c
@@ -462,8 +462,8 @@ static int xwdt_probe(struct platform_device *pdev)
 
 	clk_disable(xdev->clk);
 
-	dev_info(dev, "Xilinx Watchdog Timer at %p with timeout %ds\n",
-		 xdev->base, xilinx_wdt_wdd->timeout);
+	dev_info(dev, "Xilinx Watchdog Timer with timeout %ds\n",
+		 xilinx_wdt_wdd->timeout);
 
 	platform_set_drvdata(pdev, xdev);
 
-- 
2.7.4

