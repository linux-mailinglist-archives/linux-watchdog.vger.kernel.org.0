Return-Path: <linux-watchdog+bounces-1442-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 630CA9414E9
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jul 2024 16:56:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 199E7285317
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jul 2024 14:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7082D1A08AF;
	Tue, 30 Jul 2024 14:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CWDApdvv"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012061.outbound.protection.outlook.com [52.101.66.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428F71A0B00;
	Tue, 30 Jul 2024 14:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722351396; cv=fail; b=Xr08RMk0FuEZQQ4vHkJ19SF//zZ/Hm5MnB2BR9++pNOHx045PhR4id8zM25W0bZJ4Z27dxqFgXGSQWmjnL1Md0OsKSdaMRdBmbLi544q7EdoURXVOzwEcjrEMbprNouid0+bLYw1/lIISifDqMFYsc/joDFPp+lg6x+BQJG6mg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722351396; c=relaxed/simple;
	bh=InMLUzlMRs7ArwK4GscOYXtxW/Eo+NgeXcsjArLiYwo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ESM5GHvaLY4f28yLzgGu5aatf9o1YvfGnWgKBQeZgW4+WPrenv/Tuawf7zk0B5v3u6R80+3AcNJUQfZ4m3bAmLkro7kHUZFQbl9dhp3eKMLFkFzfcE2INTCCY7CYaiihBvzt+MDNIiDW6DbuqjqNAy84FylxoFtm1OftmwEZ2qE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CWDApdvv; arc=fail smtp.client-ip=52.101.66.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ACgtlUsS3mVJNsHiWmNiLPSmh3nkE8VI3o0Av9TAHOXwaej9pdwL8oxNqyDb7Dr4xcKSwj1STADBqscLtzKOkCCLCJJKYfGgS4YjStxKDMr0a07Ffu1HPKkrpTXPIqmuaAuges/1dSU1JIW8uWEu5JyxGa4+h/f0yLZ/V/IlS7mj3AmxgQ4aYaLaHrkWuvpP8u42Aa/y+CuaKjatJvIqQbuq+pq99Y0EkxxQYI60Q4JmM04i0MOgHEQG56sLgR7WnDHjYzvh+em5gLSsoH1gAqcDDdEWLAFBbE1lPNeouCBL2zgO60RJfmfx+W9/nQNacdUs3Dd/bPyRqPmj+04fRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ILsSJG+6XwIdEFtdYEL47mIpstMWKgf3WYfhZo+xWZ8=;
 b=q6M1ahiSVjpw1LgbbuthmGHmmNKz+WGQQ/DOeVqf7MD84c2sAyJXKOBaH3dmHwncXDK0Tz5vZYj05ShTv+hfr/f0EABHnACrSFaJQdY7I21RPs2gPBA/b3Io4sxnWAsPS8kkAUfOwyRJGj4Il0aF1wO2t+zq7xTANWxORt2yyOVk1RzCwlymUpllirWMWFQqiJP2rgrtEwX7s104xJBYOjXKbzQLHA2pFZwp6uOP8cGX9paPHjqUCIAXYrEtX/gaEesMscwEIGMOAdh+AeQvU8nwTTZKmI2FQhkpV44IjNUiCniqjKhxD2TLxsb1ihL0CvdYnpzh2vnBd4vepokM4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ILsSJG+6XwIdEFtdYEL47mIpstMWKgf3WYfhZo+xWZ8=;
 b=CWDApdvvjYz/JD1DeSJd+vhxwRvem5aRHLCaicpjeHc5tErZhY91A6EGLdcHOnUuZ6sM7gUbr0+Hu+Vxmn6gwNPbbIEcln8DfduQkkAksHQ6tFD6wyQIwY40Nq8UbWwZbAh9ALLmPnbiOIVzQ5gsgr8oTVOk3DCR0EAHkJLn7Wvs9eONBZWv6pM9BmuP4XyuChCPMi/e8a5/dzKAyYNdguEh59zvDmbFVNj+WPUgFvkZvZwOLjwOVAcrfm6fEWod2XA/zzJ9Gxg3k1Pj1c3eAZdIqTnz9qqJp4DhnfoN+9v4DkcmF8skg7E4yNai+jZWwnt6SiiwsW3bAa5Z1IgIng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8912.eurprd04.prod.outlook.com (2603:10a6:102:20f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Tue, 30 Jul
 2024 14:56:31 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 14:56:31 +0000
From: Frank Li <Frank.Li@nxp.com>
To: christophe.jaillet@wanadoo.fr
Cc: Frank.Li@nxp.com,
	alice.guo@nxp.com,
	festevam@gmail.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux@roeck-us.net,
	s.hauer@pengutronix.de,
	shawnguo@kernel.org,
	wim@linux-watchdog.org,
	ye.li@nxp.com
Subject: [PATCH v5 1/1] watchdog: imx7ulp_wdt: move post_rcs_wait into struct imx_wdt_hw_feature
Date: Tue, 30 Jul 2024 10:56:10 -0400
Message-Id: <20240730145610.2177627-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0108.namprd05.prod.outlook.com
 (2603:10b6:a03:334::23) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8912:EE_
X-MS-Office365-Filtering-Correlation-Id: bb77ae74-f84f-4670-d27e-08dcb0a7cc07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6Zh2JoqP473C0giP1g6ZqeOncbEIwO0JiIoQP6ccaXlTTQ9rZ2rnP4LvUmT8?=
 =?us-ascii?Q?A4uPPheEdoCyPWnSDwqkjVfsPzut9kTnZoaEn76rkdCMg9d+aZiQhvmmYYCF?=
 =?us-ascii?Q?VTvdHbkw4kWxV+UIXWFu7AilQ3GBaEFlBxV6hot6DjdEFvKzRUKJnHoyJeMl?=
 =?us-ascii?Q?QgLjGH0FIIQ5wZ65D73aKvL0ziDezd98bmtR44SbmQhQfVXD6FfeeP5lxE9S?=
 =?us-ascii?Q?QiylRsPQPcfyfg2ukw8sAwZ/xyTvjA5RgpcPoWhVVQecdvXNxkRCQgv7thfy?=
 =?us-ascii?Q?wN/amos9YiAAerBCDdscyqYvaD9VZ/j+EuZ5MTh1ADLDXtvKUiKxkXLCzdZ2?=
 =?us-ascii?Q?0FIEmqAY9vYVvgx7FJIPAiMpwQ3CFie3/88yFWsc4iy5ZEH/ulefzVeia/of?=
 =?us-ascii?Q?Idhs//HikLKty88Mt3HN+BKXJ06wxU6GQNnzuvd/mQ3qO+oxC5Uew11VgHa0?=
 =?us-ascii?Q?Fs2PCI5gM4FT9hBb36s5OP548KO1/AarzKyrwua/2qN0DDHMDuAIV4seqVpl?=
 =?us-ascii?Q?KbXKvHfPzazNOYbEtiUNiUBhVe3xvMlFR8LaewygIzLUW7JnywBwrAw+0+vN?=
 =?us-ascii?Q?D8HRkalK6HK3w/TZ4RFW2qqbVxbNAsnYMk+m5WYeaRq3I+AbSfJcw80ibyIv?=
 =?us-ascii?Q?HCa6m+6OjLvBAmCG5FnwKLF7x2TzJZ/En4z64Wz0nRlyF7d0egg3rEJF28hw?=
 =?us-ascii?Q?4npDhrYcAYAyQyoD55HKWJnln00FNq/AxfjPh9gisONBXnq8cmsjUeSPtdFA?=
 =?us-ascii?Q?JGyfdndyCdg721ldqJiov/wiIadOhCwhoWp5wb72Q0ykzCjJtTJE7SRVblY0?=
 =?us-ascii?Q?UOYFqKHkI4UbaduveTsDJ0Ik3YZfRtWydSyR8tGXQ/wB87TPyNIfzAtA9DJd?=
 =?us-ascii?Q?soUEPCOYzRlTMfs0nosJ3e58tqR+aTBPs+wgksR2TgRFecCQYZdaAOqBDhs4?=
 =?us-ascii?Q?kPSBCgXRhRjz3JS0hieoZFmFaL+7UBc8t71oajhQ+V+ANXXiJEIu409TtYRB?=
 =?us-ascii?Q?tgHf8iAIoJjow6TJg6qm9cCJlEEGr6iT5bVPSIWgntCik+wmoVdZgKBa4GbD?=
 =?us-ascii?Q?nZsOeSfCQs/BGkUSdPXAaCUiHY3rp/PdgaecMsitGBHfTSisCbDPBqrwKE3M?=
 =?us-ascii?Q?qtuXty33ibl0vWD/EEbt+i2LxP0bD96Rct5eIPbUbamX7pzL9iREEAPsunVy?=
 =?us-ascii?Q?5ejxNkZ7VU5JcjHUQ83yOf1YR1GLC+UBXA6X9hkjUfq59LSttmaBAONVVyOW?=
 =?us-ascii?Q?XM0qAQ2qXCoKI25KrFYPveCKUp8evrch4o7JuvkrTd0BLEFNuGj38R6t6Mu7?=
 =?us-ascii?Q?PjAZGMKo/9bv6OVlTQNM1hTO+butUhFv8rIH/rXrvY9pHJDb3ME1Ub7a2BVV?=
 =?us-ascii?Q?7IlIO8BBAYyFf+0nZYTRHsb6OMYisHvGGNTj74sdsJoGLuN/kw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1ej9/HfHcliFGoMdocRgHieSakZatYNYypq2TqiLNqIyFeF0wmHf0XMkoLYO?=
 =?us-ascii?Q?bLcoNotH35HbJDzJQ3HrFyTimZN3BRTWGekkhXA/bMKeV3CHmg/eR2kRiD+0?=
 =?us-ascii?Q?edrg5KeA2ei7A2AoEpoDmd+idtjXCFiapEJvYl43GEQDKn5VNtFnImbTMZIu?=
 =?us-ascii?Q?BstILdDBnYH3bhQM9lG7DPxVzNNjgXz6UckWVU1VMw21ocerZ2dWbQFk87mj?=
 =?us-ascii?Q?iNAJt7TZs3zaNqruZObFk1IBpGWBcxsoAt5UBn1N8xN9i2qQnvdVbE4oIQu7?=
 =?us-ascii?Q?/4txQrsAbVMMSECciVwhZW0VQkZ7X85FsB9hwVfizKEi2vXvMaOd+yXP7Sja?=
 =?us-ascii?Q?wA97hMWxSbfjf1/bxeBrFPgd6qmtRgr6VDDsrrQAxbtqlv6jDxHduVrJePGk?=
 =?us-ascii?Q?xOY4oheJT3Yj/ZsPats1KamE1TFzYVtXzaPsk+QwZEje3MTnbrMc0xCxbgMO?=
 =?us-ascii?Q?wa3W7LewMfTtR+OJSKrdFi4jJ3nwInkzKG58rON5Pwb9lX7zjiRBq39iuD+6?=
 =?us-ascii?Q?7mFdDoHYPtZl4xrfZ17tVnE9AjY4kuhQ47QSpci2OKMZNYzad1G9unAPzoZv?=
 =?us-ascii?Q?SusVtrUiUGR1y9Gc5qOtTQfEOVLQOAH/quaGX7Rb8qrxmRP/Y1ActkXsunfh?=
 =?us-ascii?Q?F76RqY5To97m497MCNIMqquwy6zblnpgVHclT5OpZ+tokK52H2Dkl9rfVCeH?=
 =?us-ascii?Q?pFe2HRiVkY0TRYwEdiFP0F5UGowa2lUxHjZI1VcqiYFb68qw7OdBunOlHO95?=
 =?us-ascii?Q?q2eXd7582gomj2teAmA+50JVVvdDcem3K5ZKnBcDV++mebqa3KumYIjij0vj?=
 =?us-ascii?Q?6AcR7l7yGjVokQXM4zrL/g2285dxOfI400zdaY3FF6nqJMgH665UvgMDMYXx?=
 =?us-ascii?Q?I7j3GuQpHZv014M9kTd+8aHS2Dzdycm599FGn3wzez+1WDdUeVhuS2hhamOx?=
 =?us-ascii?Q?LsiMv5cDOSrjFWU+ESHJkHQbTX3v8bD1x7h/3Zmb8w6pdNg3tU8BnbPQeKEW?=
 =?us-ascii?Q?p4g6hlJiIB9XT4sorZRq2psJkdNR6qyM0JwenwdRKTSIIjGMWvZcR95/Srfh?=
 =?us-ascii?Q?wwxqpJ2yXRv3U6oJlugEEMssdpJWjBygPOOrVhk/YRmpeEFZ+HSfFNmhB1Tw?=
 =?us-ascii?Q?O3Yo8qlQyGQxhmVFNtoh38frUEj5+L3wqkoSIHmt9/dNoUqwfzuexMXVxNmi?=
 =?us-ascii?Q?BT9/hC+IoGsWxpzxdJxvG6TvbgXR2vqxg3nqquer9pa0/inz+Nau1PWTtpYv?=
 =?us-ascii?Q?519TVMYtMID1JiO1IHDwZ6TzAafw/L1ySIE/YOm021Smhw0GuiPZI4BVwvkr?=
 =?us-ascii?Q?+wmrZTHaUKXg9+7BMvl34coRrNEuOhFPALaIWMPniphWDoymQzkIDDrspn5l?=
 =?us-ascii?Q?EOKTAzIZhiNV5M00Buxj3bTkere3kNfnuiHtYqm5Jid7gjWDW4KLUdMHsHQE?=
 =?us-ascii?Q?kzIv0e9c/yWoj9hKmJEn17Kbck9bhnFOMvMxILTJlyVpDM5LOlecogHDExH1?=
 =?us-ascii?Q?FAdzpex4aJz3rDmlPwPziv+turPFj4oIoVY28vpmtbWFdrJf9RAHLNh8iCbx?=
 =?us-ascii?Q?CSQsF07tWbBmbFfznwYqoUrS2apuViiVnZXIBPoL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb77ae74-f84f-4670-d27e-08dcb0a7cc07
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 14:56:31.0772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: flQ/F45IADI+pW+VCCSbXbXFUyv5T7vOrr5Ke8xQxsRajsxNq7z8lY6rrTQsePT/t0VJml8XEIl3/YIqqyXSJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8912

Move post_rcs_wait into struct imx_wdt_hw_feature to simple code logic for
difference compatible string.

i.MX93 watchdog needn't wait 2.5 clocks after RCS is done. So needn't set
post_rcs_wait.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alice Guo <alice.guo@nxp.com>
Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v4 to v5
- move compatible string 8ulp under 7ulp
Chagne from v3 to v4:
- Go back to v2 according to Guenter's feedback
Change from v2 to v3:
- Set post_rcs_wait to false explicitly to maintain code consistency
- Add Guenter review tag.
Change from v1 to v2:
- Combine to one patch
---
 drivers/watchdog/imx7ulp_wdt.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
index 94914a22daff7..0f13a30533574 100644
--- a/drivers/watchdog/imx7ulp_wdt.c
+++ b/drivers/watchdog/imx7ulp_wdt.c
@@ -55,6 +55,7 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 
 struct imx_wdt_hw_feature {
 	bool prescaler_enable;
+	bool post_rcs_wait;
 	u32 wdog_clock_rate;
 };
 
@@ -62,7 +63,6 @@ struct imx7ulp_wdt_device {
 	struct watchdog_device wdd;
 	void __iomem *base;
 	struct clk *clk;
-	bool post_rcs_wait;
 	bool ext_reset;
 	const struct imx_wdt_hw_feature *hw;
 };
@@ -95,7 +95,7 @@ static int imx7ulp_wdt_wait_rcs(struct imx7ulp_wdt_device *wdt)
 		ret = -ETIMEDOUT;
 
 	/* Wait 2.5 clocks after RCS done */
-	if (wdt->post_rcs_wait)
+	if (wdt->hw->post_rcs_wait)
 		usleep_range(wait_min, wait_min + 2000);
 
 	return ret;
@@ -334,15 +334,6 @@ static int imx7ulp_wdt_probe(struct platform_device *pdev)
 	/* The WDOG may need to do external reset through dedicated pin */
 	imx7ulp_wdt->ext_reset = of_property_read_bool(dev->of_node, "fsl,ext-reset-output");
 
-	imx7ulp_wdt->post_rcs_wait = true;
-	if (of_device_is_compatible(dev->of_node,
-				    "fsl,imx8ulp-wdt")) {
-		dev_info(dev, "imx8ulp wdt probe\n");
-		imx7ulp_wdt->post_rcs_wait = false;
-	} else {
-		dev_info(dev, "imx7ulp wdt probe\n");
-	}
-
 	wdog = &imx7ulp_wdt->wdd;
 	wdog->info = &imx7ulp_wdt_info;
 	wdog->ops = &imx7ulp_wdt_ops;
@@ -403,6 +394,12 @@ static const struct dev_pm_ops imx7ulp_wdt_pm_ops = {
 static const struct imx_wdt_hw_feature imx7ulp_wdt_hw = {
 	.prescaler_enable = false,
 	.wdog_clock_rate = 1000,
+	.post_rcs_wait = true,
+};
+
+static const struct imx_wdt_hw_feature imx8ulp_wdt_hw = {
+	.prescaler_enable = false,
+	.wdog_clock_rate = 1000,
 };
 
 static const struct imx_wdt_hw_feature imx93_wdt_hw = {
@@ -411,8 +408,8 @@ static const struct imx_wdt_hw_feature imx93_wdt_hw = {
 };
 
 static const struct of_device_id imx7ulp_wdt_dt_ids[] = {
-	{ .compatible = "fsl,imx8ulp-wdt", .data = &imx7ulp_wdt_hw, },
 	{ .compatible = "fsl,imx7ulp-wdt", .data = &imx7ulp_wdt_hw, },
+	{ .compatible = "fsl,imx8ulp-wdt", .data = &imx8ulp_wdt_hw, },
 	{ .compatible = "fsl,imx93-wdt", .data = &imx93_wdt_hw, },
 	{ /* sentinel */ }
 };
-- 
2.34.1


