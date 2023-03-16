Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD586BD9F2
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Mar 2023 21:13:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbjCPUNf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 16 Mar 2023 16:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbjCPUNe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 16 Mar 2023 16:13:34 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2054.outbound.protection.outlook.com [40.107.95.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 910262330C
        for <linux-watchdog@vger.kernel.org>; Thu, 16 Mar 2023 13:13:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fLNGXTSu2I2AtjzOc6ZDeSOzc+T3cOImsxC/NxkOBFQ/+7KpVPnyQBcrhs+QF99KJ+TLQCpjkdJOCwagPf5HhvltN2IPSH9u/vhFpIzUoY3zOkYBlxuuTyaMkqAu4fiSErbHtuR0nFJW0Hlm4/omLY4J5U4Ro9C4YTTk9AQ2+zHv6i3sYGsqN8IqfgJM1vXB0mZFXh7XjD8vIcaZD68H3ozHPi9oeu7L8uL6SPA61TyRV0HZf4EoCHuxy7f17p0k286rMsgFLjL43cBH0mqrPlpruUsquJZl6pNUx8sAk/r4IXFsUlZidOXU9nRJ4YSz2LZBX3CaV8TTTZi6hd2Jow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pd0eiCxOKRGClnFhFr2EZTgXVuc1LL4HreGHNawzF+Q=;
 b=HHSH4REENuX1SFlYleK3K3c01AdWRABFE+cZEy8cKKr3zM0x1wKFOyV3+7/EdbGuWNawka/5OGduLbeJRhl+KyAhp6X+6mIvD+nSKy1LRHKH3rZ+JlxqNWH7+e5D/ppv+lcVWYEC2CDpEAM3D1gTFQMQ3oe/2riLpf5mQn8GJdP/D1vvjIkScS8Q5jQh9ntikfrTwn9crtVP2BWv/41Uuf+mOky6w6S3VR+Ctng9BaVOBfCO/6qBUwoTusKNSpAkdS0s/oVbW1xjXCn7AIze0Vd6qm9nHaG4bG6B4kc4zdclz2gydXyh9V9zvMNT87e7napmSh0ngUUHwkhXTke+2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pd0eiCxOKRGClnFhFr2EZTgXVuc1LL4HreGHNawzF+Q=;
 b=tM1EWmvHaGNkzO/yjzQNGTJwQVHvy8Nc2j7PPN7aj+vLTCrJFuUBGpGLt7YPGiX50nCpTSmZlmhkcwF3uT5wwBP4HsXHFcbCicpuW2ZQc4hYaB/ON9q59IHdieYNan3yjA121qljIr1f233x4fa3uwg7ftALA04gwJwYW/NHkcQ=
Received: from MW4PR04CA0078.namprd04.prod.outlook.com (2603:10b6:303:6b::23)
 by CY5PR12MB6299.namprd12.prod.outlook.com (2603:10b6:930:20::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Thu, 16 Mar
 2023 20:13:30 +0000
Received: from CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::1d) by MW4PR04CA0078.outlook.office365.com
 (2603:10b6:303:6b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.30 via Frontend
 Transport; Thu, 16 Mar 2023 20:13:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT054.mail.protection.outlook.com (10.13.174.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6199.18 via Frontend Transport; Thu, 16 Mar 2023 20:13:30 +0000
Received: from aus-lx-greoakes.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 16 Mar
 2023 15:13:29 -0500
From:   Gregory Oakes <gregory.oakes@amd.com>
To:     <linux-watchdog@vger.kernel.org>
CC:     <terry.bowman@amd.com>, Gregory Oakes <gregory.oakes@amd.com>
Subject: [PATCH v2] watchdog: sp5100_tco: Immediately trigger upon starting.
Date:   Thu, 16 Mar 2023 15:13:12 -0500
Message-ID: <20230316201312.17538-1-gregory.oakes@amd.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT054:EE_|CY5PR12MB6299:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d861f5c-5f6a-4841-bf2b-08db265ae93c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y/So47eHxzz82V+dLJZ+BHhnZ1bQ0OmET3vGtpM5exain1ULacGGpqUw7jKr6MoUcaUUfTMUHsKu+fBIWQPqdZvW8DmMuPWhrmrUMWGbWgl3x/qP9oBlxc3uJgVvfNK0/pZqCy1lxZ+lLGsLiOmNE8nZp5z0Mii8FJWvtKnINS57jUAXAn6MbKZf9MwS9giSmgpvTkLkwjCGndMivqsvN+mP9r+in61et19OTLuTBFhbkE7twHKO3uAhVyUNQMUoo6PGcBxYmXO/aR/wdJb+KcijRA4h5SGdzfySGlitgHXJDGh9V4h1b7q/EZeHJQNPswwHHkUYw9Q1Xd6vBr1WiPtH9A0cAoKFGrXC4Zmup/R+jsH46P6nOIgYwxOvdvpy20/LL/70HsekdM0uQOAK0jr7opZ/ShS7lLt5BN5PrLgxYhA6DfBCaxORQyXmYW9G0vJeJKfa8PEAtFH1PycrCG7rvN13k6+yWP/o9rVbHMM/LIhp4HHQamAVv2AVPR3X7pGKGJgG46usleS/bOx/xAJDb4TwkMFdQTJOYi+UnHsxRDSAVSZPVRrTjOrhRr39DszgzmNDIorWhVL1/LnSQ+BOC//pwdit3eZiLhP7AOPqCSh3+9eKc/Fl7vDQUWQ5DphAPBfKVp7mCmMMOrHJlzGvAwIQuwbrugA1+JgcGtdxbG/h/qp3qOz3Pvtl/CACZRdFMBF5KiN+QrcFd58SF7qi5u/Gvq6OYHzRCreWts/mdxdqZiRhwTisiJtST6Ql
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199018)(46966006)(36840700001)(40470700004)(1076003)(26005)(47076005)(2616005)(336012)(426003)(316002)(44832011)(82310400005)(478600001)(54906003)(2906002)(83380400001)(6666004)(36860700001)(186003)(70206006)(7696005)(40480700001)(81166007)(82740400003)(16526019)(8676002)(4326008)(86362001)(41300700001)(6916009)(5660300002)(356005)(40460700003)(70586007)(8936002)(36756003)(14773001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 20:13:30.3323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d861f5c-5f6a-4841-bf2b-08db265ae93c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6299
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/watchdog/sp5100_tco.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
index fb426b7d81da..14f8d8d90920 100644
--- a/drivers/watchdog/sp5100_tco.c
+++ b/drivers/watchdog/sp5100_tco.c
@@ -115,6 +115,10 @@ static int tco_timer_start(struct watchdog_device *wdd)
 	val |= SP5100_WDT_START_STOP_BIT;
 	writel(val, SP5100_WDT_CONTROL(tco->tcobase));
 
+	/* This must be a distinct write. */
+	val |= SP5100_WDT_TRIGGER_BIT;
+	writel(val, SP5100_WDT_CONTROL(tco->tcobase));
+
 	return 0;
 }
 
-- 
2.39.1

