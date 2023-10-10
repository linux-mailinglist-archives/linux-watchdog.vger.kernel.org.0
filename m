Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8D3B7BF499
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Oct 2023 09:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442329AbjJJHlp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 10 Oct 2023 03:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442419AbjJJHln (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 10 Oct 2023 03:41:43 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2088.outbound.protection.outlook.com [40.107.104.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C886F92
        for <linux-watchdog@vger.kernel.org>; Tue, 10 Oct 2023 00:41:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZ9Mr+zf/9si7EYP9powawyJjzFYh/8OCTzBwoyc1JlxQkfyEdBIctIlBcPiQYAyTpsNpePMsrwv+/el9XhBpQPqyXL1o967VAEWGf7wcX6K+nzZlAA1/ndVgwSKv6ig+jOgZPWDFA8KOapHJNoKw5KKQ9Tkpw1yQE+cI0VXIU9qF0uz3PoWUNKIB3m32JDTgMZvoM5utcbV3lO9DR3ZFFsFYmKAswdHeA9B/Z0rGDdRmVQMq2PAzCEznB9ywGURZeI7RFrLU72Z1DobC1IfZl/unv+1+gctldkL8+mMVj2/zIm2L0WHnfQ+bfibz0MsMGjWrl7abemggSRENUzTxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUHaySV+gGE5ej4A32XzcWB31KpUNMpp34BLZy6Xyho=;
 b=SQntl4Y2o7V0ERWKg3dinufHQC0xrJ5fBNiB225xQkvq8m2Pi2Rxi3obYZsA5VFXLXvZK5wfqOtJ2WQLO3ocmXm+ZdeMs2l49QU7bkxIO7pgl8Ph2mCmlQr97BgjCFIh6A/Ld49BGpd+kNvzzPTR5OrqcdhCe6OG6lzPQoZzvxg9XeTJORNpAZWYQ4MZ2MMbEhpMtSHrdQBZ8jE7k/8Qjb3aYBsSo1SgxqCewulfAY5/LoNWjNJnKbYUYkpzaZdg5PMOFxeXjhTNmv7Fupc7JvWmzskOk3s/d1J+Ei6/RbMXNwjsZXMtKDx+b+tgOMunVw4HXChE+XSwtnuweBE9Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUHaySV+gGE5ej4A32XzcWB31KpUNMpp34BLZy6Xyho=;
 b=sHVkfpTmsKUDzXOVOTefXMbh36+UTHXWIE44MtDGoYhoRSusVeEJAQf1i7WElwSRQKVeJUeTBGx6sfLY/wcm3wRPj0ILvUEFRg9i21oMFMZjRXIqKZD3MB3cWBRUwZyJCliryhdy+D7DbDvflT8Xy3ggsWCLUGnIrjO3NIfWZ4s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by GV1PR04MB9103.eurprd04.prod.outlook.com (2603:10a6:150:22::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 07:41:33 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::258e:61b0:da64:d168]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::258e:61b0:da64:d168%5]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 07:41:32 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-watchdog@vger.kernel.org
Subject: [PATCH] watchdog: imx_sc_wdt: continue if the wdog already enabled
Date:   Tue, 10 Oct 2023 15:46:26 +0800
Message-Id: <20231010074626.2787383-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::33)
 To AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|GV1PR04MB9103:EE_
X-MS-Office365-Filtering-Correlation-Id: ecef652c-d8a7-489f-03fd-08dbc9645262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Np8cBZuvLR+C4vHH7jozqgd1rOsyAB9BwHaXQQr3yeFLwtYch/qbJLKpHtaxGS4urGlmXCl9zo/zHSesEdxqPhCyqfxe7PkEbCx7SGf4DKnlk3c1Vnc1X77J8F7FgM1rAYiTeGewx7kwvIrO2MWekHaqKW1OtfyyYKxUWu/DpQMCXNOVTTQtxWV2f3CrCmSWlg/wFh09noqq/Q7eQmpDl7l7E4AUI1qYRR3oM6fyH1wzxD0XnrXtQFH7Gk5V9Fw2Eed+Qi7Of9MCVAvRmEHrcAzkh4vmPQSf61SS5hhQHXjQKmHUz/RPGYkMzgxss7e2vcamIszUEhHxvLHekw2wXjrzL6AFHDRDNVL8jIl8uBjnP5Od78kUku0saSTDVSNlezD+Hbq3Ra5j1dHjmYXEAtUCogGr1JvkCMu/FbZuRH4oohVbd3SzIB51I0wmEFjKLhUEykKF5YbFJbcUekVVlbRFpba0p233WzLfjCkjZsHRJe2ZE5FbCz1bb1dV9ka4QyitdJV5ost6Lhm1+KjK67Fzh1CcYrrhJOPqF5ui7ZJ/UdZ2YCOtLgKEzTf9SwY3D1WEKt91QLAwMq7s9hOM+jAC4YSxDoyIawpcy94UMQwFHIFkXTkYJudYPGqe63vC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(316002)(66476007)(66556008)(66946007)(38350700002)(38100700002)(6486002)(41300700001)(5660300002)(8676002)(8936002)(4326008)(1076003)(2616005)(86362001)(6506007)(83380400001)(6512007)(52116002)(2906002)(36756003)(6666004)(26005)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TDiqLZCUYTYk5aFAn1wXOSorveX6D7QSIQZovrNgWKwV+baSds01Wn5IB3+4?=
 =?us-ascii?Q?x6tqFZZQhvkbwSsIX2Yu+Z8tq89FFiUJzZaMVLEQCXsw7KbgnrnKqIaQ+f7J?=
 =?us-ascii?Q?ruq2rVUDugtYuwXj67IRnzroZf6D+13G60RURprL7XbRrar5Bdzq+j57Y/gN?=
 =?us-ascii?Q?sDSbfxVv4MGz2m2AUEME+o/CqgDuJAi3adIefg2NBH4F+F22lCQVbT7nG9sg?=
 =?us-ascii?Q?paYYWhBPVaAHc8p1pZ28585aM9rUh6YK8xcGzRaMLnxXfkQM3HuDwTBDuEsn?=
 =?us-ascii?Q?ek6zKxruC2aLiDm5SDQi9YUAC0upT2Zwuuv4Dh757Mn+uWPot1/HW1uZ2YgK?=
 =?us-ascii?Q?PhJ6MF8dI7MeNlcgqJypgc6msfoXxN5y9EOYCUJj10QEK0l6WPKVqrMpN+KG?=
 =?us-ascii?Q?RKhu2v0z9JUughhqfFNZQIf9Xu5J6DrxkkT5iGJd2w/UbE0uaMvsWUjLl3hw?=
 =?us-ascii?Q?dTzPdUmekLCzCqq1hP02sIXbI4iqO1F+85TfkRWttngBe3qDBsjt0lph9ETy?=
 =?us-ascii?Q?hKexPlIkb5PVzYOGA41I8ZNBKylVTbs17QXuBCx+KvuWXyXOMWlKGtxkT9pQ?=
 =?us-ascii?Q?pexNyw4nSTiEGdLYLYJigFs5MVtjHmmx2Yq89FSgQC7meao6mbdT93/IhtST?=
 =?us-ascii?Q?WW19eZjBsY6vjACVa+pZpkR0yRwzclAsV6r6MHktQcLVzqmCiPW5mFNnecmi?=
 =?us-ascii?Q?PGw41JGdWxonbd6gE9M1nFFH88Gw23rHPR3UCHtPojJG//igCzDnPP7VigTh?=
 =?us-ascii?Q?lXg+TgMfVFS9vav5Kb2MeTdBKq0FdXth1ka53F6V3vevdS4Jhn7mtW+zQQZG?=
 =?us-ascii?Q?hA9sHvLypnB5Z7fLi6CsVf1nfUponwU/eeVTt22kie73OB+ugzoR9lCQ7NCZ?=
 =?us-ascii?Q?uqcpL/dORPkahtaZP4V/mcFO3GJFi7hAssnxtxqDdTvTZxoUwhkUIB2Vxetj?=
 =?us-ascii?Q?45hnn+QG1l0Q/ipClFnOKS/fb8RXPSJE7QPSJS0WEFnKbBiA0XUc/cvb+1F4?=
 =?us-ascii?Q?lpxtiT5YKKMyIeTxrf5fdS8EOFEB4lUvVZqm3ohTxvD3pporBBOCpW4DXC6B?=
 =?us-ascii?Q?nhbNUdmxMX1Mvn0tNLO8w4+aKBN7i7tWlEfn4wtkLXdXN6ylq0ODHDD4Qnjn?=
 =?us-ascii?Q?CTdmy1mQpL5zaIXj51n3niBGPBgi+5Ilysr1XzcJJATDDOvI5n/NRsYBAF2y?=
 =?us-ascii?Q?fGASWMSEBuvWgf/o/XG4+/GPDOVTxjnOrC2gc2gxqWcM1e1cYuSM0798p23t?=
 =?us-ascii?Q?6w4toHysPX9xo5bzhz0GUpiIDfZTYe1DgXPTN8+gowcKfHmqSvfYUDBQ/jFc?=
 =?us-ascii?Q?zVJy7aUq1lq+Gp+IHv5lGgI4lMVQ4VDlxbdqwckqsVY4bHtTBl2FNETRrKQC?=
 =?us-ascii?Q?/orvPa69s0gN0aHwtxaeJkHUBBbUDDAn4KcjY71DeXAaG2LWrYerligeeEU2?=
 =?us-ascii?Q?3nErynS0FCWJi/97yDgJC/NHmYDAHsso1zhY/oCzhgCK0MtJ9FsYh8H3yANB?=
 =?us-ascii?Q?Ptriju4z52rcBJsXtMIPRdYJgpNDMWxYI8ZhedZhZtPZDH7z/u7kVdmeNcS2?=
 =?us-ascii?Q?MSbveBh7OkawkkSYinjAE096uuemoWEh6W07r7+Z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecef652c-d8a7-489f-03fd-08dbc9645262
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 07:41:32.2827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DqnX9Un3ylF80yjgack9k27GZJU01+967uGgr70qxBIQDm5byNoETnRKHdHIzOWh3p/y66FBKxaIZUzInLBXkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9103
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

if the wdog is already enabled, and try to enabled it again,
we should ignore the error and continue, rather than return
error.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/watchdog/imx_sc_wdt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
index 8ac021748d16..e51fe1b78518 100644
--- a/drivers/watchdog/imx_sc_wdt.c
+++ b/drivers/watchdog/imx_sc_wdt.c
@@ -34,6 +34,7 @@
 
 #define SC_IRQ_WDOG			1
 #define SC_IRQ_GROUP_WDOG		1
+#define SC_TIMER_ERR_BUSY		10
 
 static bool nowayout = WATCHDOG_NOWAYOUT;
 module_param(nowayout, bool, 0000);
@@ -61,7 +62,9 @@ static int imx_sc_wdt_start(struct watchdog_device *wdog)
 
 	arm_smccc_smc(IMX_SIP_TIMER, IMX_SIP_TIMER_START_WDOG,
 		      0, 0, 0, 0, 0, 0, &res);
-	if (res.a0)
+
+	/* Ignore if already enabled(SC_TIMER_ERR_BUSY) */
+	if (res.a0 && res.a0 != SC_TIMER_ERR_BUSY)
 		return -EACCES;
 
 	arm_smccc_smc(IMX_SIP_TIMER, IMX_SIP_TIMER_SET_WDOG_ACT,
-- 
2.34.1

