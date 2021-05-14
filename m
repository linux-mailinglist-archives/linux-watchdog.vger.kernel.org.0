Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3CF3805D0
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 May 2021 11:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbhENJGE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 14 May 2021 05:06:04 -0400
Received: from mail-eopbgr30066.outbound.protection.outlook.com ([40.107.3.66]:34582
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229981AbhENJGC (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 14 May 2021 05:06:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hEgRXfgGQ7zyvsXbn/VibrXA+wxehwV5P0I2k2IwwCx+aPk5vwF/VVsxWTTOrclQejhWTaHbtD7zbzhlhJO8zI9RO9DQpqOEzn0cQePX6goWrp076CBhyNdMj650FefHm9zFgIXnZ8Dh5QjLmT5SIm3MkprHSVp1b4CNBzEQ4I2qJvKZaI8rjDYdyPit1oHV2P5ObP5FFhQkVDXBLWp9w2njoFIXE3w7VSauNicKSpEeCvJkO2H99VNDfL8RGirEcLXVCKyvseLV06RNPAXDlIrYwdozLDzpGHmxGFBWwEblyr4ot/xoHrqTTIdtG1iX/Zrlcgf3zqF8R8lUK6PGOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2ikud2sBoFPzs8BHjFUyxowV5mT/JOXYolNXjIZ2oE=;
 b=h4OO3sGwiWSQH4P/QrNU2NRZVy3sDQvpVjaYJAMnL43MgbIEd0wVv/OGvOU20KcWFawi2Kj5gOQavgHhuvKoFHRC+tC3narKN/BsOWUpmJtPHMozlwXhXem+q+7aKXAMs1RM0XKGTv9LsnpldvRrZt7JOSRYTc1iaZehCoPIGBTBwnMkRwCK+VIAQnm37a0LlW87MV9Dsno6ROuCfd6C2greT3of678uy1MmSx+k1Eah++jBCk4ZuhLTB7LmNrdZXOmeNPCCAT0JXIiaFPKqNHpXjsTN5s6K2kdi+gbxu8oCmPXz5gCrQTXpTBRllaaUpA8SKpFNGrIJCF03G/7Qvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2ikud2sBoFPzs8BHjFUyxowV5mT/JOXYolNXjIZ2oE=;
 b=YWDGG5EmnN0zojClepqoyx+/suou3kewfJnBFco99trtL4YDVw2z3Hz7kdhLMRu5hF2u6YduzsoB8vpFkUXlDEnm4sNQQBXL6b8wpPCr4+itAtg7rA/GuQLnxKS8eQ6Bp8Ku20F1ccJLvwjXbbAFUR/UUisE09Kuj2pQ+6qxn/w=
Authentication-Results: linux-watchdog.org; dkim=none (message not signed)
 header.d=none;linux-watchdog.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6688.eurprd04.prod.outlook.com (2603:10a6:803:127::25)
 by VI1PR04MB4317.eurprd04.prod.outlook.com (2603:10a6:803:3f::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 14 May
 2021 09:04:49 +0000
Received: from VE1PR04MB6688.eurprd04.prod.outlook.com
 ([fe80::bcfe:215c:1b66:6011]) by VE1PR04MB6688.eurprd04.prod.outlook.com
 ([fe80::bcfe:215c:1b66:6011%4]) with mapi id 15.20.4129.026; Fri, 14 May 2021
 09:04:49 +0000
From:   Robin Gong <yibin.gong@nxp.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com
Cc:     linux-imx@nxp.com, kernel@pengutronix.de,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] watchdog: imx2_wdt: avoid to ping before resume back
Date:   Sat, 15 May 2021 01:21:15 +0800
Message-Id: <1621012875-22667-1-git-send-email-yibin.gong@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0167.apcprd03.prod.outlook.com
 (2603:1096:4:c9::22) To VE1PR04MB6688.eurprd04.prod.outlook.com
 (2603:10a6:803:127::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from robin-OptiPlex-790.ap.freescale.net (119.31.174.66) by SG2PR03CA0167.apcprd03.prod.outlook.com (2603:1096:4:c9::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4150.11 via Frontend Transport; Fri, 14 May 2021 09:04:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ada7213f-feda-4287-17ac-08d916b75390
X-MS-TrafficTypeDiagnostic: VI1PR04MB4317:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB43176DDE3039D9A144D214BA89509@VI1PR04MB4317.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0NOHi5+A1qAv0b14OA9I54OEig0BVN59ELINLh4PcKmp9L5RoAiWc+XF/0BmxWaj1YprLGZ0cauk2KXZxSObmvvBIaf6twvNmfZi1i/BsSS68oeDpF9yewhF3c+XSxwvMUrtOtxoJ0VwnC2TMXGBwwDzr3tCU356WBFC/Vki59ab2+IKHYBvG+kFop6wIYwlTnK/VVCwREQMuSKyrTJr50eNeKa6gFABAkNqjrylnsxcf7EgOBce6gP/aZub4bosecyXIcTDJjsN4/2UDVQ0p8TChd3p8D3IQRYO+x0gigpU65oy8Lg1BGFgGMqPo/RO+lvbNWQpCz4CoI2Qm+wbpNb1eqrO6md5o1btQ4neJucxEgjQAXvGUuC58suI3I60Ek+LJF7Vbj/ZcD4ec12IPkdFbDprAs1/9/P3Lm6udnjC/Tx+UIUtmk4V6ZA72ttcsB3aipY+0sQ3Jfu6bsLiOVNJPFRge2ZVnZqN3R7tSXaL4s3F0SVKHE7EkEObImP2sD5ybKJ2VfdjyU1kJNQIgYHO2fhb09mQPOftsnIurlDL29kuaU05ilnHuWi7/tU1g0zjQx+BJqd9F1ol3+V0iw7Q9hbiKZzWiFwU0YmQTc0IrA2s7Mfefps54QlPVCgkX9aMzKZbEjP/Fq+GmUM3RHTRkNqNSH2Z8BLzksVYpGU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(956004)(2616005)(2906002)(26005)(86362001)(16526019)(186003)(83380400001)(38100700002)(66946007)(52116002)(66556008)(8936002)(66476007)(478600001)(316002)(6512007)(36756003)(5660300002)(6666004)(6506007)(6486002)(4326008)(8676002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6OCxojCJLkWEXhyXQz4GDL/kv2PlhvnAJ84l6OM/b5uMsce4DUeDFkE0Su2/?=
 =?us-ascii?Q?+fZW/gSh2bkE+JmRwNOVTZXy+qHKdbENrpr/wiNIeBo/S5CZVI4F9B+9aRY6?=
 =?us-ascii?Q?QslXYb967vmnEPQ3OUcIVBgJX27wVciWl5xQkofYcJB2Z2gImqSDVaJfQgLV?=
 =?us-ascii?Q?VM7eQQQAtVha+c+tEz0ts3XJgA3QN44NhWFzIdkjHKJAe2/p7R+jXTONuCp+?=
 =?us-ascii?Q?f8NXL+hZhuJ/c0ucF1NTwwWqQYvGTB8Uw2C+DdDcJ106bY0xvnBsLv0D80QU?=
 =?us-ascii?Q?Mv+TwQawlNumQr3IrDB5FZ6v0GTM5mbHwZWHnDC4gDOwocT0JB76xlI3guLm?=
 =?us-ascii?Q?QqNHVf8AOand3aHbeKkpTubMgatxuSCzxOiHlPZNHcBX3S7IYOHBZTPkLGof?=
 =?us-ascii?Q?m3yYnfzdL39RcUCSQjlh14pYqLYNnSYf8Dw6ZIs/rkU18/3fhjKEvpwo4mg8?=
 =?us-ascii?Q?Q4cQA3fX2t7+qbI1BsPqzwEyC0PDUAwXZXFjBAoKEIAZfM7FFjRmxiNg2cQv?=
 =?us-ascii?Q?wEZwOiPmxXmSbJN9+2eb+c20Jn3qMZ1qCOu7hW0CIBWnc/e5s+9jHWCjG7NY?=
 =?us-ascii?Q?2aiFzhSNvk8OPykByp+R+/6wGKrPcn82+yURsoG8kBtx/zXNi8oDDjM4Rwvc?=
 =?us-ascii?Q?7rBW9kIOEdiWU/+JMHH987eFDM6fp0V8FF6qtFgeNAjCm6Ta3EfiAbMQDDdQ?=
 =?us-ascii?Q?NKPom7wkOY3ydX8r8UxA761rH5A7e4sF4hwaguOfP/195T4JakK9Mw8XPi1o?=
 =?us-ascii?Q?YwB2+kwf84eYCv9g1cxEV2/dNDGRwA31k4chwrWtAnWmmSueGBHiqAqZHqjG?=
 =?us-ascii?Q?bZfeiQyMWYhl/YnVlEAAdZKlI2m2lcTzlYiszxadEOvGItPydB402xnup4hL?=
 =?us-ascii?Q?xT4A8Wxegg5XuCoJvTkxysCVpwRrogIm9XqZgcx+6rnTTcKNahQz9RPBb2IQ?=
 =?us-ascii?Q?nrfOosCzqDm9pFuBcAqZv6PilkCIig8KjAlcjeIiTmmAQWNYEEBGWC9gUzfv?=
 =?us-ascii?Q?dnwjeeWPP/3x7BtRoSfSVm4/2p89YGVL7a/LW30uVTkleWws+L7lVn/BTxzs?=
 =?us-ascii?Q?PRtZkbXt7pdxFQ1KphFOwX2gg+0KtIHPP0R78nj/TaN3BGmxr9DX81GXGaR4?=
 =?us-ascii?Q?KveGs58nqrTNmHbDbQ220MYJR/dSIFtMOiESRn1CXqgU2jnCEtz3Heaymu4Z?=
 =?us-ascii?Q?Ox49vcyjlG2vBzeSMIQf8hf/k/ho2EO4LkcPIOwZODJJOMfs4Yv4mpDh5Vcj?=
 =?us-ascii?Q?HSNNUKBKGxksnBpfWx1LdBErrNxo1SSIPFMdaxELBV5q+BvmMDLHBQmbAO7Z?=
 =?us-ascii?Q?Z4diazCLP6PN+CSF68jOy5I0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ada7213f-feda-4287-17ac-08d916b75390
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 09:04:48.8373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kt6AYcJ6S1cXU9lYTzGhwnEDv5hfYvSvjrURCwfjrSYGQ5bwqPv3aDSaxN03nCXKMSXSTTgGHAntsn2bA4NrzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4317
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Since watchdog_ping_work is not freezable so that it maybe scheduled before
imx2_wdt_resume where watchdog clock enabled, hence, kernel will hang in
imx2_wdt_ping without clock, and then watchdog reset happen. Add clk_is_on
to prevent the above case by ignoring ping until watchdog driver resume
back indeed.

Signed-off-by: Robin Gong <yibin.gong@nxp.com>
---
 drivers/watchdog/imx2_wdt.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
index b84f80f..cc86018 100644
--- a/drivers/watchdog/imx2_wdt.c
+++ b/drivers/watchdog/imx2_wdt.c
@@ -65,6 +65,7 @@ struct imx2_wdt_device {
 	struct regmap *regmap;
 	struct watchdog_device wdog;
 	bool ext_reset;
+	bool clk_is_on;
 };
 
 static bool nowayout = WATCHDOG_NOWAYOUT;
@@ -160,6 +161,9 @@ static int imx2_wdt_ping(struct watchdog_device *wdog)
 {
 	struct imx2_wdt_device *wdev = watchdog_get_drvdata(wdog);
 
+	if (!wdev->clk_is_on)
+		return 0;
+
 	regmap_write(wdev->regmap, IMX2_WDT_WSR, IMX2_WDT_SEQ1);
 	regmap_write(wdev->regmap, IMX2_WDT_WSR, IMX2_WDT_SEQ2);
 	return 0;
@@ -301,6 +305,8 @@ static int __init imx2_wdt_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	wdev->clk_is_on = true;
+
 	regmap_read(wdev->regmap, IMX2_WDT_WRSR, &val);
 	wdog->bootstatus = val & IMX2_WDT_WRSR_TOUT ? WDIOF_CARDRESET : 0;
 
@@ -361,6 +367,8 @@ static int __maybe_unused imx2_wdt_suspend(struct device *dev)
 
 	clk_disable_unprepare(wdev->clk);
 
+	wdev->clk_is_on = false;
+
 	return 0;
 }
 
@@ -375,6 +383,8 @@ static int __maybe_unused imx2_wdt_resume(struct device *dev)
 	if (ret)
 		return ret;
 
+	wdev->clk_is_on = true;
+
 	if (watchdog_active(wdog) && !imx2_wdt_is_running(wdev)) {
 		/*
 		 * If the watchdog is still active and resumes
-- 
2.7.4

