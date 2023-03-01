Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0C06A7484
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 Mar 2023 20:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbjCATu5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 1 Mar 2023 14:50:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjCATu4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 1 Mar 2023 14:50:56 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F2F8A25D
        for <linux-watchdog@vger.kernel.org>; Wed,  1 Mar 2023 11:50:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QdMHPm88nhz7mgMXT/VqezgbA+/1ZEPuU6J0WU1N85YA8n7Jin3zUTyC04FKdKJbIwAIy6YnDLBSxlZd4QRPkk6eqe4DP4TyCTWDm8AoTSbD85BpvwSN5j2GuJ9jZE3Up5ajftbWb4BWov6OhX+dJsfYOrSlUggfaKXlDJgfKPBNlhztPDcG1CqEPPQp5X7suS1Li6xr1e72CqTae2fJrPktxWYNaHUH6qDyXh/DtRMj8rRctkf8N+LFEnOUbQg06OV4RVrjWbvDOwt/ogesrX0VvK+wWmsp9/MglcJ9hScrJu7jV3c7L747sjeZsBYY9oL9zWmLpRlV1A5HQGRRbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43zRG9jg2Hy+1A55LukAuCl7AYvIVzab17CC4KkMuS4=;
 b=Pl1j6Bll9U0o/oXtAyYjUXXOfehEMKO12AI4uoZn5AoAd1KTWS15odkVRuMURU5h42s6mqIq8W8SqlcfK2fpr87AAEv1iouJWSjET9l6YvYPSmFSYmsMdL4myxxZ6WIdivp17JEZYcs8yYFZDcS51jeJmiHXeoxqBGaii3J2wjOss+MF9dndjOPDnPi/WjErW4KDerelVk1Lhc1rgXY7FsQbe3onxFmXR7DKXoMIhGesJlNYPD4+q2NyM3YpN0p3L5hN6OKdCr4l1l1Nlz9Br3CG2zvFGafFyyN02ZDf4b+U+hoWwwHQlsD7ibeJH/E3hy4I/D7nML9oB6aMTSR0NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43zRG9jg2Hy+1A55LukAuCl7AYvIVzab17CC4KkMuS4=;
 b=nYYeezR3lb+Vx8+I7m8zlEdnPlMiyHW8DyZZH+G4lb209E3KBNcPnK81UZTssdOkAuHqsSpTlpUOzDlTY+Pj8B8W2H0kXOV6HAL7uF3QLAlbIWH9mZv41sXQSb2JEf4ZxuduQu+Kb8dtQA2ptHfsWtbmVLlOWl++N6o/dZCeXI8=
Received: from DM6PR08CA0015.namprd08.prod.outlook.com (2603:10b6:5:80::28) by
 CH0PR12MB5252.namprd12.prod.outlook.com (2603:10b6:610:d3::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.18; Wed, 1 Mar 2023 19:50:49 +0000
Received: from DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::18) by DM6PR08CA0015.outlook.office365.com
 (2603:10b6:5:80::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30 via Frontend
 Transport; Wed, 1 Mar 2023 19:50:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT065.mail.protection.outlook.com (10.13.172.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.18 via Frontend Transport; Wed, 1 Mar 2023 19:50:49 +0000
Received: from aus-lx-greoakes.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 1 Mar
 2023 13:50:48 -0600
From:   Gregory Oakes <gregory.oakes@amd.com>
To:     <linux-watchdog@vger.kernel.org>
CC:     <terry.bowman@amd.com>, Gregory Oakes <gregory.oakes@amd.com>
Subject: [PATCH] watchdog: sp5100_tco: Immediately trigger upon starting.
Date:   Wed, 1 Mar 2023 13:50:01 -0600
Message-ID: <20230301195001.26843-1-gregory.oakes@amd.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT065:EE_|CH0PR12MB5252:EE_
X-MS-Office365-Filtering-Correlation-Id: c9fcaca8-b6a3-4afe-d65d-08db1a8e41d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +fW6AUkho/3LMXS5ZBywD6+INA+NIEGeNJOiUq76Z8+8yikv/JoGwjjB5eNDYORwaaTE4EhELUVgZ4oIT/EBm2DfZ8pc0wXgaGIsrDr72shxRxwGUT5enSV/mEHgd3peAIzb8PR3pr3qPcWUCZlYM7sJE291SIptKnHM/fI4l2enx5+XdBkfeqHwcXhh63ycFlwlxpyAHuHtpSJRwSYDSMKFEkq28ZncIfTNhgHb5SVulVH+d6aif6WECp0QFm7or17N7QUUCpFqqJ2TCsUMKwD68nLfh5TJ2ZFjbB227RJSPrc+OJZ8YE234ozdawjIvsmnPVmHazv3AVTlB9DpeM+Ed9piZVG+RBRvXXon7fDzj7h55a2MMnRffxwYLUKltXqGdkuaFHww2t5KranvP+J1htxQoTt7FRn/og+klP6vesj3g9Miur6MU+cwvjEJ2ISDVZV2TrvI24EElzlX4qpxGjkg/XBgbk5CgceAsPocnTp8QA0bPr17mFdqp5zqw6Kh7BHR1Qh1qNBagQ1koIDPswymQK/Lsu8UWAbGhC4hrj8Vr1W00mMCLSb6kXarg5r5qm97+WKvr9bdiGd2QjERyA51Xl8vlaVXtKfpghj+XsPoeUSQ56kfLU4N0L2579kAdJv4Y41Yf8ZrQEanf757ifaf/UWa8BH3oaYxEdXpuhlvNd7GtZA/hJDgWb9uensNm2jPnxgAPEgHQaOFHBBCpzx/VoeOOX8a0pgOV31RqY/uteIDRdiJOpN6Xn/ZbPp2x9/prZ46W5d2yGpHSw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199018)(46966006)(40470700004)(36840700001)(83380400001)(36860700001)(426003)(47076005)(6666004)(40460700003)(36756003)(8936002)(5660300002)(81166007)(82740400003)(478600001)(356005)(40480700001)(86362001)(82310400005)(2616005)(186003)(26005)(336012)(16526019)(1076003)(70586007)(70206006)(7696005)(2906002)(8676002)(44832011)(316002)(6916009)(4326008)(41300700001)(54906003)(14773001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 19:50:49.4159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9fcaca8-b6a3-4afe-d65d-08db1a8e41d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5252
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The watchdog countdown is supposed to begin when the device file is
opened. Instead, it would begin countdown upon the first write to or
close of the device file. Now, the ping operation is called within the
start operation which ensures the countdown begins. From experimenation,
it does not appear possible to do this with a single write including
both the start bit and the trigger bit. So, it is done as two distinct
writes.

Signed-off-by: Gregory Oakes <gregory.oakes@amd.com>
---

I tested on several AMD client devices. I verified the countdown begins
immediately upon the open ioctl and resets upon subsequent write ioctl's.

 drivers/watchdog/sp5100_tco.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
index fb426b7d81da..18ab0e096f99 100644
--- a/drivers/watchdog/sp5100_tco.c
+++ b/drivers/watchdog/sp5100_tco.c
@@ -86,6 +86,8 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started."
  * Some TCO specific functions
  */
 
+static int tco_timer_ping(struct watchdog_device *wdd);
+
 static enum tco_reg_layout tco_reg_layout(struct pci_dev *dev)
 {
 	if (dev->vendor == PCI_VENDOR_ID_ATI &&
@@ -115,7 +117,7 @@ static int tco_timer_start(struct watchdog_device *wdd)
 	val |= SP5100_WDT_START_STOP_BIT;
 	writel(val, SP5100_WDT_CONTROL(tco->tcobase));
 
-	return 0;
+	return tco_timer_ping(wdd);
 }
 
 static int tco_timer_stop(struct watchdog_device *wdd)
-- 
2.39.1

