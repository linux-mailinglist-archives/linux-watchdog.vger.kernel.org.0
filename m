Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D33B7BF567
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Oct 2023 10:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379441AbjJJIOk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 10 Oct 2023 04:14:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378097AbjJJIOj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 10 Oct 2023 04:14:39 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2065.outbound.protection.outlook.com [40.107.104.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14DBCB8;
        Tue, 10 Oct 2023 01:14:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EfX5/RY3ZN3BYG7VnXT3/HwqVQMjsZuHqWij3xIhpZSFbnJD47RB92n7NagqGO2ADytB8JleIr7f7J6DR2BmYLUmZmF8J2XZyinNDVIryGU3PaTVGExjQt3fD6iOs3m5qan1t9+VR0WDEBEBhUB4aT0T0oX6o8LKCrTgzdN1doaMJtVO3B2FTSEmc/ZWQHYA5glwQh+nzPVSLV/qAN3hZLyI9cLE+p/43bHuf6gMU0kZrUGm4TFvDm3xAHUU2qmcdKDtrURW/9/JZHJrtz5979X3Lo20/Spls1xpAS9jWUbmz4r+13zvGIMtuH4oSRO2ADasDY67Mp4zx4JyUwV7IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ep4C23UfS2m1IyEy+lzf/3cEU8JRdMitAAJTt11ytY=;
 b=hiSnRwkUTdIukqJEQYcjM4C99T7RkA2wnC7M5YD6hAjR2qZ8g6rJmVGtyEppQJAAfnFkH1Kho359zDE97f/s0qSpXPRDQ9vc3C0VZZ4Fhckd7VlVvpgy2sF4jVJNZQFJJ4Xo08D31tSidgjUCDMmV8/OAzdzwMqgs/wMe3Km7y+R4/GZkSnR6TuONphZSSIwR6GGw+JUxxuMS3sddacNqof/c7+8EBwp2phNhXq11poEjFSwd5WZ3jQTzcaL2B/v85p/+PQ6wyl8UUzd5AkXvZAbgEBAdmCqVpovtBCoJ6NtTHUMkjPWeTXqaeEcgxNeJAqbBbyutDf8J/HIH5+Eug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ep4C23UfS2m1IyEy+lzf/3cEU8JRdMitAAJTt11ytY=;
 b=DGw2Yi7QUk2XdHd+f0J76frAjc6zFFbD9HCKUwktygcvl4ydGVdUDuaE5Jx38ukIw9F+xE4G6GSK1cw0TmN1LIy9BvE3VvW+MpS2Z/JM6z4Gtmr8vx0U7sasK4+I3owicUdxmVoJWFqACGBMttYcenzPCCxjj7WOwEu8GKc0coU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by DB9PR04MB8298.eurprd04.prod.outlook.com (2603:10a6:10:248::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Tue, 10 Oct
 2023 08:14:33 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::258e:61b0:da64:d168]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::258e:61b0:da64:d168%5]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 08:14:33 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org
Cc:     s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: watchdog: fsl-imx7ulp-wdt: Add 'fsl,ext-reset-output'
Date:   Tue, 10 Oct 2023 16:19:08 +0800
Message-Id: <20231010081909.2899101-2-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231010081909.2899101-1-ping.bai@nxp.com>
References: <20231010081909.2899101-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::19) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|DB9PR04MB8298:EE_
X-MS-Office365-Filtering-Correlation-Id: c7a64721-1121-4199-c1bf-08dbc968ef4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nrrrjVB0FU3tX14z98JYcQVamz+WhIiqzbkA76XN7E9OU3u9356RzDWmh2A89dgCOl9LaWL7Yb74Qm4z4Zde6aO5REpmvHidOHzBMSUS40zXXknHgDx3R8d1wlRHk32FV6GXoQDOFS5WwuKS8m+JcfifjWzcPl3UfIQgAFq9YpcNBqbuCCl7Ch189CT+jc97nCUYJGtCyCOHukHaMZjPbtUsgJmITaHBUB/BcMQ+PPo4YbEv/yz7Nu9d5xZCXK7FBaGvq424S7LOzc62XxLxCD2GVN76jPdRPKX3Tyeliz1JEoujO7i2Oly3+n4vkJRX4G4krWQKgAJYGwaQmZn36fMjju4GJePyW/GMEeatnx+s7CY/B5JcjL8jSOzfHuZMH/RQcqs5jCzN5nhhLJViDKaioYS0vqhcPGxdFAH5cfCR1c84ObMce0RE4k9fg2i80pW+LjPgQmkJy35/3RG89DaWIur3gbIwO+GMoTuWdT8YjFZaA/B+uuZxvT+Y9Ae3I2bUewE0oAhtuci7ZSMbwuJ+q18/GJbbcoDncjz3thW/pcivVD0BDo5VO96sz7ZfAqgLCi2nL0YzaLjn/sO07qZzbGVA4pQu+vBYgIO7KAw+DH0Oj7C6ygO7KXXLqTc4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(39860400002)(396003)(366004)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(2616005)(26005)(52116002)(1076003)(86362001)(38350700002)(36756003)(38100700002)(83380400001)(7416002)(4326008)(2906002)(6486002)(4744005)(6666004)(6512007)(478600001)(8676002)(6506007)(316002)(66476007)(5660300002)(41300700001)(8936002)(66556008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bNXqn8GX1qbD9KEU9I4EVC9EvnJ9RPhi+ccNErVFgmMh+UxOdPmYmuGl6VIb?=
 =?us-ascii?Q?1IDpHb8DhXoWGRmfXd/NAhXrNRNITe5q8mqdTXbnJ791xFV219UQn42+PwJq?=
 =?us-ascii?Q?oRTLmUUSbbsceOF3Pl3vRH+WJJXto4e36qmfR77dXR9daRmqrpV9SnNnWTvr?=
 =?us-ascii?Q?YhGKXigcEgx6JUkaOvWJEep0MmI6/YkgqXvHEmK2kNT6Im+p61MEFo2TcrFX?=
 =?us-ascii?Q?Gth8zrrBkWwZQ6J0J4m49U7g3SwI0oycSmY3W+uRFY6Xo2CyiFszivYRreZP?=
 =?us-ascii?Q?3cCGHykz8/TaXmszE0QemooED89ywjUJBnhpp5JOkNS74lcj9g0uyJ0vYsbB?=
 =?us-ascii?Q?2fqqMot4lPXPAzBPgt2g9BSO7pc4rsfNz+L/rrDgRysp8+R+luMDCEIYo0gv?=
 =?us-ascii?Q?VubhGURKJ/Gx+B4SVWMqzQFmkMlmiWQfSvsf2ptoAbzLs8B2X0Ia8yL1DQRT?=
 =?us-ascii?Q?WyXQOcngjCdobPeQHfQS933KKtY27vfqbcz4lOvHx42qQyN27Pk+pxqdp0SV?=
 =?us-ascii?Q?P4fh/nwt0JJTrvikKYIea+mETG2jzdrmNJ86l9vi/o+nvYj+HvAyOu0oVrJi?=
 =?us-ascii?Q?QBT4irTBkRvjE1dO+SGvJVjX3ETDrA3Gl3tytsJKVdAtMZbJurqa9dh0xEuI?=
 =?us-ascii?Q?1Pw4piOahJoQurEwtecG8Z588yPcaEzW7MM29iiXjPnq1r2EACtef5I1y6gZ?=
 =?us-ascii?Q?hLeHtelfTLpci2xdj1A6BFFI0Wk30+s5Nv+Q2L22N3s3EV8GSov2o4XDtTAh?=
 =?us-ascii?Q?JI0ASBx4+NSaMVL9+yS/bTeIiWcVLfYP6/UDLxKhDmRNqkOa0e/RomhzDKUd?=
 =?us-ascii?Q?nrQqkfH9hC9FqASG+cLE2q95aiBgHcU3gyx5bgjyKbwWHKF7JmQBnSRKB38g?=
 =?us-ascii?Q?BNN2W1uzIP5jEBNRTN+YUjM063Juebdg+57N2oCVh3MCFeyXFBrhSlt5iWiW?=
 =?us-ascii?Q?FOEbEhwsaa58A4bTiH2qf53teCUs31ywEGmiyOhMqAVxvwUGhijEuO91+EzU?=
 =?us-ascii?Q?zf0oUCas/rmy4eWBp+VOBZDNCkUYNMtnuMkC+qRXY0tOiNWH3SmeRKV7iL+Q?=
 =?us-ascii?Q?1FEZHozTu1MtDyn4ykDL//byOQItxKSLg87i6AggOSOjeIs9eDhwCpmhodHu?=
 =?us-ascii?Q?sccZwgqeO4r483GddMQBQhJJvM6DqhHArRK+QRBl1rOllhC4Xc5VqztM+rjZ?=
 =?us-ascii?Q?gdGJ4CVjLZYx65Jny3p3jCUur3wB00cdqq4mLxFsGZdgTtG/hHj17aVerUFz?=
 =?us-ascii?Q?5uwUco2+DJUl/ZkdWdTLye54fRk2Qkkh0oLWfugoduUnJmpfe8T7cUqeabYe?=
 =?us-ascii?Q?AKxPKHn9uIT4MNIP/Yxfbscp+L7HOKazTakPOMhI2XcyXmJxAM0UdX8huoxr?=
 =?us-ascii?Q?T+UJ6Zc1dh8gMQ4EtALXEkOr1qCpjD4Ou5KL/Kxq8uDZ/kzTMVIq84Muc9CO?=
 =?us-ascii?Q?wyxfg4+w4TGk/wxTNxidYR+T5+zDDiTyUnAm8Fr/3SxhgXwLAiHiGNuITLQE?=
 =?us-ascii?Q?mM14urvHk/MpiCuG2V5eR0inLcVsDXuI/y+5hVNBpYqUk3CQn5wH74RTSmsV?=
 =?us-ascii?Q?DjLiwCyzuE9k4t4VNGBG8x5ZUH2Qt2UMcfPxY16A?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7a64721-1121-4199-c1bf-08dbc968ef4e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 08:14:33.5249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Za95Vk8NAx1aWwRk0KHEvJkbYJ+2QtuvgVWg8EVSQlbm0p7QXgHzkItdo8l6MsDQdEZH7otbeSx+DotkYqhLDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8298
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The wdog may generate wdog_any external reset if the int_en bit is
configured, so add a property for this purpose in dt-binding doc.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
index 4b7ed1355701..9c50766bf690 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
@@ -30,6 +30,11 @@ properties:
   clocks:
     maxItems: 1
 
+  fsl,ext-reset-output:
+    description:
+      When set, wdog can generate external reset from the wdog_any pin.
+    type: boolean
+
 required:
   - compatible
   - interrupts
-- 
2.34.1

