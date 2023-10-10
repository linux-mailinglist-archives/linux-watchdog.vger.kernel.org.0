Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC547BF565
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Oct 2023 10:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379425AbjJJIOd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 10 Oct 2023 04:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378097AbjJJIOc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 10 Oct 2023 04:14:32 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2080.outbound.protection.outlook.com [40.107.104.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 044A5D3;
        Tue, 10 Oct 2023 01:14:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2YuI+VjsEI5WH/h05X2tAjbQCmHAlCD/zKZ+zSZ+A48+Oj8Ow2s9+jB5+75PtZOr/WedceCbIsOvQA+H9cLHcQzBhBmMNaj2ibiHTFFK6RmwpBrT0bq9Ms20bhPHWqYkYWihw/uFqacCymubt6udjLB298zHhdna7xISDO4Ze8sVzBc9Ns6nbjdB7QMHRfNYTfWKadL17gdgqb4qfD+aXTH6Lm2uElpTI/+WgXPOEHNNOCjahOf4Bogo65n04FV3JEUgqkuD6bCrk9TAOoK88HoFkmpP27bfdrYUXqu+FhPh3BffieQFcMaWxJBWGJt0So7EKeUEUhqVexS2px3Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twQx8ngbXcEPROGcq0iZqcReqGPVAtwfK6wN3iDWhzw=;
 b=LX5I8HW/MXO6604i8TuuFkfc90CSSB/Ky9ph6LECnQ9pL5v/sE2yRQMd1PyNwAxdX858QdA9SUlyCUxlXqoIjWxfbxQi33N/h7rHfrOngOHjGG1qmbNTfI/P/Orgn5yl5/UqYzdhYm3rdl6LIHgrhNHBhtC8RHJEVZr3Q+kFSsdfjk0wkUBC+wdtNDsBmE03QkNh27GyeekfF/6sIXSNwyKuKLMDQ5pUtrBXKfIBLUWwR+6VMRyS9NyM6fPl+AQxJrumCPtxk5Rg4Vc4b2hAPjBnUS16wopP23N1JcfhY1TliMvAnUXvQBeJ/i8mxIq4MUtMHklFRGBsjRXzl6M4qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twQx8ngbXcEPROGcq0iZqcReqGPVAtwfK6wN3iDWhzw=;
 b=LLZw15ZTIPgJZLUvuWVCmQT46Bhi2O/Hxqnfu+t3TkAONk1fL9J1Okr5dgzE5xhRU6uXXFw5dZry5Mwf2VYen6++fXaaUBmOVw+257Hwwr8VRgBh80LGNMM7kTO6g5AnEGNhtrWq5fbMDzoYS5pOpRRoQHGkgBaYJCJgnt4kMhA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by DB9PR04MB8298.eurprd04.prod.outlook.com (2603:10a6:10:248::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Tue, 10 Oct
 2023 08:14:26 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::258e:61b0:da64:d168]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::258e:61b0:da64:d168%5]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 08:14:26 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org
Cc:     s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/3] wdog: imx7ulp: Enable wdog int_en bit for watchdog any reset
Date:   Tue, 10 Oct 2023 16:19:07 +0800
Message-Id: <20231010081909.2899101-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::19) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|DB9PR04MB8298:EE_
X-MS-Office365-Filtering-Correlation-Id: 597eb8ea-fd60-4b02-f0d9-08dbc968eb16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 13H5CVsaLftG+a+Ko7t0nGB+V07wQhYzfRhVA8zQ6C5jRzXEOncSvj77eGs+2weEqI1F5I+Fedzi9EPYZQ7BHViH+7E566aPqds+q0vKb9WEErEuzwotQFbRbGCPgJCtF6A7M9ECKPtz2pefA510jhYxmniIAKCpWfbqsHtpDv4UHU4Alpwui72ina4OtQTlAN0dEfbSYjQeE5YaZ6B46K0JV9EzBzwtqzeGhN3jSkaUgHytc4qzNrr4gCWuiILMkDQyk8c2G9iGjjdWgP7NOt21vHuQOKfHdaYFpLpgm/IZNi0gk5UdPHVsfyqJiNy/JKT6uwh6Vu0OLC4tpKH9+nhv7e6HxqfuOD8l6hYnrYPzuiwgggevMfn30fOJQ/fRzHJu0s07Xbs16TKrSCfrfSn2NxJ0Tundit2E3XyyV0Q4+tJj16g7pt9jaOkrdaja32El0h6yzxVVm3HY11xlBNG6HaEXzuuFIO3axNJh7Qkl1ORi3OV18wibk5fSzE3fm4ZtgVb5iFp/TlwUdcNpnboAA0PQzP17lOGjcjY4urB6GcMP22Q4b4DTFflotDxDINdsc30U+iUqWyfWb/iMLIyVn6h61BumD97wnPdDMOo0z3yXU80rLKrPyjc7GCTWSC3DGwnn7mxJrWLQgKELww==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(39860400002)(396003)(366004)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(2616005)(26005)(52116002)(1076003)(86362001)(38350700002)(36756003)(38100700002)(83380400001)(7416002)(4326008)(2906002)(6486002)(6666004)(6512007)(478600001)(8676002)(6506007)(316002)(66476007)(5660300002)(41300700001)(8936002)(66556008)(66946007)(171213001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bA6HANRwQN/nX+utYxGWf6f5b07KHfFZ1zC/feb6ECyF2ruOIyMgVj2Ab7Jw?=
 =?us-ascii?Q?acS5xfm883YeG1GfTEMs3Y0m7fSWRhaisu/QrVVnW6Stp9dKCV904JPmgpis?=
 =?us-ascii?Q?+3NfikMh+gufK+q5cuCyt/LDgxZPTUCmaeXJVA4Nx5bFefXd/eE7vUolCOlK?=
 =?us-ascii?Q?GmrJv6VhqLr6ENa2UWWEAkvTq7JN3u2OLuSwHoWr8u1BXo4sQp+neGRQF1cc?=
 =?us-ascii?Q?7I6bk1d4lLiwOIZuomTNuhL0DiYmOkxFgRqXKynq3lFM9yUh1xKVjrVvZHCQ?=
 =?us-ascii?Q?WvuN1O/QICwukh8YgVYU1TlQ/itDmaep6euiRayuavV3z3jse37mUG0cTs3v?=
 =?us-ascii?Q?IJYHQUMZAUiBG+YoAUX+o+IMuNqubVOEjJm8s9VUlfqQ6/ZA6Aj5aaqQKV5y?=
 =?us-ascii?Q?bXAhZLpzPldQHRYFLxQW7uM3lv7fdkKATOXB6di45kkdXSRgdzzQ42yP+U6M?=
 =?us-ascii?Q?DogbIdTou+ALvF1eiWchtwGX6XsZI8fTZHuNrmbRr1ZV2opFeq2uMHouHJBp?=
 =?us-ascii?Q?JBGtbyymoDs2EiIWgsZbmT6x1ZKsGSAavBfhvaD2CHmnj5RSDkMoeTGOILFl?=
 =?us-ascii?Q?w3bLsoLug3lEe/KRyl7D96TZRSebH8IApOo1O0nUxNPh1EHWkCc3k1QkLl8P?=
 =?us-ascii?Q?grHAf4uwgQQgrfwySlg4/JLAVl9Bjdt2miwigzG4deBvvQqraf9RXHIH8ony?=
 =?us-ascii?Q?PGQ0sr6O+EFbvoVtvnEfoF6JLL9s001AKPfOEWTN4A+L17mK0Yyfl2uv2s5e?=
 =?us-ascii?Q?6WG44iYAoeI1lN1pfGClYLGbQ7Ylzy3c2i/mqSjclQwLMxyqkKgz/+c32s1z?=
 =?us-ascii?Q?dj1xhmdpICXdwODh6GSckX+fZiXpu4pCXRHWg0D/GIsufAuqy1iEv0iGwYa1?=
 =?us-ascii?Q?6MFuhs5P2dvyMWANdKUEXHCMdbvPXkXwvnLZLHIGPYi5Tlnd3dEipNr9ve5s?=
 =?us-ascii?Q?vPU6yTlG4dvoQ6t95KJkE9JDdQjP1aybDjvEtou/Xh5tLvsQcW+GJDiQf66M?=
 =?us-ascii?Q?F/tKiZG2reX5KhZzfYmOOi7kSBi1iJaF4hyrHFyJdBOTJOpwCxcWwqsGV/v0?=
 =?us-ascii?Q?pQYoyYif5IJhZ87EiElDatpYDk5gZUA3DJuNgZzbxzJTzf6S2bpkxjqgoBJX?=
 =?us-ascii?Q?yFiH5Q2aEU3JNHV2Uu49G6D8+xZ4IU2+4RWXO6DCGEVMi42I5guWwkhvtCJk?=
 =?us-ascii?Q?TZdw8hD4JsnhfPg7KhevYspCrgTL781Xg4NR0vojRQb0smnXLY9LTfwlKiF6?=
 =?us-ascii?Q?YO3jOaXiDOi7KbqYfkCpTB/3PmNSpZ2N01FnKGuhKlRJBIQkz2m7miuzkvc+?=
 =?us-ascii?Q?YN51L/oscvVtf9Tm6IQgYumGQH3a22IRccbyk8sAPE/HVmeIqbedL6naFwBu?=
 =?us-ascii?Q?us38MH/uWc0/2PKtu9UV1c0w1fifI3S3bwXGS3tTPb/qER24X7URSvMONLir?=
 =?us-ascii?Q?Jla0WeDqv+0gbIiKtyKYZk81FXQQ2EfVhWrTF1FDYaF1YxJo4GeeqkduH5rJ?=
 =?us-ascii?Q?fm1DL/SwxptZoW71hLyvesHxJiFKMhOH0vmLtq4yA+W2LgT9X6ItWFaQ3W79?=
 =?us-ascii?Q?l1BnIW2itrCYIYON2dHMairaUxk1/TEx3MU6zh08?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 597eb8ea-fd60-4b02-f0d9-08dbc968eb16
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 08:14:26.2996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tioS9P8v0c/pVBeKCW6tME7EajBKqyVCU1REufDjSKns7Js42tuVyaM3GclDZxADQDS8zSGt9nwf/WmUMhqU/A==
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

The wdog INT_EN bit in CS register should be set to '1' to trigger
WDOG_ANY external reset on i.MX93.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/watchdog/imx7ulp_wdt.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
index c703586c6e5f..b21d7a74a42d 100644
--- a/drivers/watchdog/imx7ulp_wdt.c
+++ b/drivers/watchdog/imx7ulp_wdt.c
@@ -23,6 +23,7 @@
 #define LPO_CLK_SHIFT		8
 #define WDOG_CS_CLK		(LPO_CLK << LPO_CLK_SHIFT)
 #define WDOG_CS_EN		BIT(7)
+#define WDOG_CS_INT_EN		BIT(6)
 #define WDOG_CS_UPDATE		BIT(5)
 #define WDOG_CS_WAIT		BIT(1)
 #define WDOG_CS_STOP		BIT(0)
@@ -62,6 +63,7 @@ struct imx7ulp_wdt_device {
 	void __iomem *base;
 	struct clk *clk;
 	bool post_rcs_wait;
+	bool ext_reset;
 	const struct imx_wdt_hw_feature *hw;
 };
 
@@ -285,6 +287,9 @@ static int imx7ulp_wdt_init(struct imx7ulp_wdt_device *wdt, unsigned int timeout
 	if (wdt->hw->prescaler_enable)
 		val |= WDOG_CS_PRES;
 
+	if (wdt->ext_reset)
+		val |= WDOG_CS_INT_EN;
+
 	do {
 		ret = _imx7ulp_wdt_init(wdt, timeout, val);
 		toval = readl(wdt->base + WDOG_TOVAL);
@@ -321,6 +326,9 @@ static int imx7ulp_wdt_probe(struct platform_device *pdev)
 		return PTR_ERR(imx7ulp_wdt->clk);
 	}
 
+	/* The WDOG may need to do external reset through dedicated pin */
+	imx7ulp_wdt->ext_reset = of_property_read_bool(dev->of_node, "fsl,ext-reset-output");
+
 	imx7ulp_wdt->post_rcs_wait = true;
 	if (of_device_is_compatible(dev->of_node,
 				    "fsl,imx8ulp-wdt")) {
-- 
2.34.1

