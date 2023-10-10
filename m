Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 029E07BF569
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Oct 2023 10:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378097AbjJJIOw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 10 Oct 2023 04:14:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379442AbjJJIOv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 10 Oct 2023 04:14:51 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2044.outbound.protection.outlook.com [40.107.104.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1297CF;
        Tue, 10 Oct 2023 01:14:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvKLBuVafUH2w2FR2jx7Veorvxz5pdY3d8dy27z/66EMhNExy2nXO/1WecYGcAF0SAnz+5SmEv9YrfkBEB/6c377VVFMpIJK9nCMWAFKh4+tfa+8lRHL7mhNUimeI+pC+VV0KNj7+qv0NqwOHHpDyfSFuR5gLNSFIiHOI0Fq+CGhja1PNWzHoTrFHVTBV1I9PFO1soliOLaUAES5YGCdoBjWp6xyMb2/LpF02BgHyJTZ/YTq3UF/te4TAJnq/b8ttFC1lzcvWlStfkTIvk2ZrdLO+tFSeifOLxj9HwADyG8cF3IGVH7vMkTUK6dvQPRIXng2yOGPXFFSu11wo1TlMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EI44Df2dyABYDF/LfoaOtbdR2ZnVIEfMKKYXFuv/PVg=;
 b=aDhdr+8CIwxzaJrj//0302/A9/2/woP8Z7JL5n7tfRqDo3/rNNfVTEz1rN7nlbpI4RY+FR8bslh2NF4nomqc4F0U1CRAp1qAvDuPo2jMVj7YojR8KYk6CZcknjEZdyf2iR5MW72zIQnLffoksrgLhnrMd4C3vsXJ8odibbLFtFGx15MtJgu4qeelAWUaiTohScoC3Su9HjvU41mHbooMpvv4eritBPsUTLkvYJTwzdXrrHBP6wYX0VWdD5kufC5aDXnZyJV0nURYe6T8i20dx5NhG4PE8XcuevGZMNyZcythjH95CiUbdH6qgnEd2H+hOeGw2F26qFKhuCaceFzXwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EI44Df2dyABYDF/LfoaOtbdR2ZnVIEfMKKYXFuv/PVg=;
 b=BNlYEc4R+ZIQwyCP0i6Z3eCiNzcS/sbwaXRqHJLAtOPTIJP2LDtZ3FJBz+rYoM1+LkTPIquJUnDKdSAes2RE/Oktm21+CRae/ai3N3raVet0su6jC9wx7vIHSbpPZRhUVzBAyuj8fwqxmaNpRcrVt8wBuioZyfVhKuxiMH9fu1E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by DB9PR04MB8298.eurprd04.prod.outlook.com (2603:10a6:10:248::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Tue, 10 Oct
 2023 08:14:46 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::258e:61b0:da64:d168]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::258e:61b0:da64:d168%5]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 08:14:46 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org
Cc:     s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: imx93: Add the 'fsl,ext-reset-output' property for wdog3
Date:   Tue, 10 Oct 2023 16:19:09 +0800
Message-Id: <20231010081909.2899101-3-ping.bai@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4f412b4e-48e5-4af7-6cf8-08dbc968f6f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +ynAOXkqUXxmipho1E9U0NO4TOr8pfavxqwAk2IUcewdvt9TSCHr50ZqNGcINCPpQJ5rYUZw0umuU4ZYd11itvxAzziEc3n/JqOib3tUZpTQLG7Qfc5my9rk6cA4e5OQJ5bzJCEDKaBpssh93HjeGOnsdL6eQryB7br0Z4CUCAPCf1EuoNNvzJatFSS+AyV4XLigIYSZcuZOHrIRwwt15/R3/kM/k6q3FInKN9p0y4XAitxdK/YNGUTWcNjBjeNpBoOKfIK3jjlfLackfAUp4DHMR8wIjDgDSHL/MY+rjOwyqM3tT3e3oAEKA6nf41n1dDqRKHrDJQJa5fsi0ssyXZTYDnYusVN/4/Dkx7hqb8G5BFjJ0ROQzfCm5krunHXVL8xzaLNvEnnvNveor9eNBbECGkmJJjPYew3LMo+2Zg15GAqEbZuLUrStfrDkPZ6FsTKdSn0N3DBh4hWFiLLRfNCmfZ+kUeZMzyfFpVqGe4gEbMm2cM4KZP7E+5uEfkZ43AF62CNPoQg0Ht/leicmGu1N90J1pMgwtD4Q+lJRQBOmxMtwLNm/uF5mqjHDSwXqdxXX38/S+BB150QrDUwHvArnW0Q6edvFHmT9gISepGVuY3jbsSURAye7oxDzBOmu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(39860400002)(396003)(366004)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(2616005)(26005)(52116002)(1076003)(86362001)(38350700002)(36756003)(38100700002)(83380400001)(7416002)(4326008)(2906002)(6486002)(4744005)(6666004)(6512007)(478600001)(8676002)(6506007)(316002)(66476007)(5660300002)(41300700001)(8936002)(66556008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z/F6q+gsVzQh/0ZI+z0kNyDC1GJON6mT7822FkU7yFhNnFYC3UEGAS4nNmih?=
 =?us-ascii?Q?8gx4bq4ok5P5kfyYI9JyU2sU2SNNjSmIIPfs2RSafx6P1bR+JmtSwmjmhU8i?=
 =?us-ascii?Q?7bW6rZ8NfswD4zNjgWX6I7DuEQdglKL9UmJjAeQfQA8M5NrrIEOGMAeHNi+D?=
 =?us-ascii?Q?I2Dk/y8wE3niA9QML7zc7a1ebN6fL2OiLXrtOxchH4stuysaQ05yiKhWn+02?=
 =?us-ascii?Q?EQ82AG8pVFQujVUaSoLgB2nDjmj8kkd/HYmPKF0AzJEqtTD9XULs/sP8oz+4?=
 =?us-ascii?Q?3MCo1lJXOIZFd0TlsEt6T7GgFmXvC6ayot3yKoSM3a1ve+JJLRveJm7/9Yzc?=
 =?us-ascii?Q?9xadQZbrjDlBuLKzNto5P0k3CAVFLMthJFkdx44SVX0dl1NdCOsJ3TKp1I+E?=
 =?us-ascii?Q?SBfb9fv6DsnnvcamcqWV94wz3YyvGunzUuuHZ2NDvRTYdLnuFJLhEgActVBX?=
 =?us-ascii?Q?WEQC9sKqJB+cOUDLnhwZYeT0o40X/CanF1fWf3stpqxr+EcRUbQKiclyH448?=
 =?us-ascii?Q?KP1HEEwpnHgZQ/FWxmv1FjPb+qRbFgtlvi2clFKN9Bnh8Doj7hBwOhxRZqs2?=
 =?us-ascii?Q?1S/4PeiWyc7eFmJUcvcoS3N81aJLbZ1PO6objWqpXRSdAP2SfiTtCPQh/JKc?=
 =?us-ascii?Q?6BCBC+qlt7yCJj4N1VrAP6yjw4YpeBoNFnq+SiqWCzOFUKX4u9oj8virFW2D?=
 =?us-ascii?Q?eaoIgG+IQ2W65KF5k440p6jXF+RZvHFZMiVavfPMOXcHPPzK4EfQOCO2UNTZ?=
 =?us-ascii?Q?OEPpg6AW5/RuRieyZ4NbJdJIlRrtf9n+JjZXOBQ8BIkJjNGwpjzbruLzazF4?=
 =?us-ascii?Q?X/XdJJCMfqk3TQlKoNAOmAhFcpcpWVmYYywcPo3DlZuK6mkHVQ+sIMl3jzhg?=
 =?us-ascii?Q?lkV6V3dzCiCHzQrcIa6LpyvLgLoqSYSWucpOKLqYzNhurQfSewfEJMXb0twD?=
 =?us-ascii?Q?nhv/PuoXmKzCY5sf+1g8diURmlu3MXOh/cKDhKiJs2ufhLxMNzGMn6FycK+3?=
 =?us-ascii?Q?Gf3VJEprWm94DOTEVBzxqr+NWpEYT/wa22qWLjfBVHlIjqYMU6vtXqOQ1Ks7?=
 =?us-ascii?Q?m39L7Ld/0q1BSOfmXVNOnS3KRwgP3aArNveMfQOFunaxVxSE/19V6ax8jFu6?=
 =?us-ascii?Q?+6TI6lK7W49I7JVQRgUOWLfByANdQsq/+vZsGUxY4HoBZwD+RDGv9NW4U/8l?=
 =?us-ascii?Q?Ww/T9a+80NF7PE2en1T7h/FjzOtKwjEFqRtjQR5XQPnBX7TyF/5KnXwUVBKB?=
 =?us-ascii?Q?LJpc9eK+ll17szsTRTYQd+54kf6ssCca8hu0APPjNPGoeIQnbXhshgJ76KT7?=
 =?us-ascii?Q?yP5b1jin0HXDdkPv9z6+mVXiDDn4+uGhV6us7A6sZSRPQ0NzbeajVLUTZY5O?=
 =?us-ascii?Q?upiutBBbxbFa5EyHQnhT2Tci/gIGFBULdixYhO25P7p7QpmWFf0FIPD/A6B7?=
 =?us-ascii?Q?VHcP3foAhex+exWEz7V2xDbhs9WpT1M+3O4tvaVY4HWzZlA7Zd0V5ALzHF74?=
 =?us-ascii?Q?rUOwqFjzxsLxNVxuoHIOuOp84g/sILL2AkuZWQCMTRx8uNY1SGNrakbwkY3D?=
 =?us-ascii?Q?VEoNHGoBcl5S6ZdFrUhImvmqTogwTgiehykxVwI3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f412b4e-48e5-4af7-6cf8-08dbc968f6f1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 08:14:46.2978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hpxbi+fDBf1l9cy+qi//nNhJmAyABtEXPqjGw1m2G1oU3jxanfowc0JXRblRnyK6BSzOc1nydtXF5/t9A9JK6g==
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

Add 'fsl,ext-reset-output' property for wdog3 to let it to trigger
external reset through wdog_any pin.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index f20dd18e0b65..bb40a022601d 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -562,6 +562,7 @@ wdog3: watchdog@42490000 {
 				interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX93_CLK_WDOG3_GATE>;
 				timeout-sec = <40>;
+				fsl,ext-reset-output;
 				status = "disabled";
 			};
 
-- 
2.34.1

