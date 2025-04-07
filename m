Return-Path: <linux-watchdog+bounces-3223-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6C0A7ECA2
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Apr 2025 21:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD58844803B
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Apr 2025 19:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD68221568;
	Mon,  7 Apr 2025 18:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ki9Jd9H5"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392D4221D88;
	Mon,  7 Apr 2025 18:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744052147; cv=fail; b=Hgo0cZZ0yvhaDZkTZ4qBPn1VjDWOzrR2yVpwv5L88YOR6yaq7VCqLrUaxVOTH/WDXk7VWH4kD6sxpwjWKT8LVZzaNVvmrXGv1WVQFr6D1alMwQHVp/OF+YZUv0J2ZfMX6DiJInyyogJ61B5ssRXHs977uHNUn6LNHlLqra8nUpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744052147; c=relaxed/simple;
	bh=ACyP/mmfiUBI4CCc/x05pTsEUGHrcX6cYbuzTzK9w3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CNWzyyZIMtzZvnX1QPCxTTksFtCBpQ5ITko4yqrMf3307yMmRqTRzbehLAUGHVFIRSmvX+GIPYRgucNqv/zb8/58F8xl9GRYs//ZAL1Ocwxu+0rId/DvSfZyYyG1uB2/I9E0GTiqYRaZ4764SbCWMA+ZoRcVgTYn5S1H2xriTxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ki9Jd9H5; arc=fail smtp.client-ip=40.107.21.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wERMUbdDvchwa96rN09drPsqGIVR2TtQ5D2jNf2ASFJUvPfDBChs71egemvZ9F31iXrbjkKT8KLDAYCuw00DzJOWWPDoqw7eFUztmbAmUX4EqeHwVBJ+F6wVFA7KnvUf5elVhlgIVM4xSbgtUshiInvE7tc3qvR7dN171mOpaZpn6qqaoLpVUIpKia8jMSAPMpK3/FQAIDK6ZPe4SBMFanY6JH3vk4RFbofbWxSUKdL2ZysJoo5qt9Sf6z6EZY0cR1d4u8Xh53fzJ8jjsytIgIlNNjCO40I2SXNZpxj3/e43j/F0fgZ5ruUh4v7s38ZFU9TriDUkyRjOGbHXUinaLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++41Dxz4X4/WP3pTcOSKEtCQJaCHfwd1obOQP7YTvJc=;
 b=xbnoNotlUWDFWxHBXX1HQO1TEy5zjQgXkrsUrzYbTVud7SF4wvAxYW+ihaDLaEXHEQmPV5IymhAk5ubPvXAdilbL53V/cAeXZQMNgXgaf39/E8Ox0cEMtz1ltIE4kk/JmPd87ncfJJSvLiK5PtTIUVqge5PBLlaDqT35FQP1JgHwua/Wda3X1u1ltj5XvPF9VytalQpuZ7I5FZa4OhvRtUqqPmx2AK8IVqx0F94EDgvghc6bDKZGvmTF1JuHChFjhLWtpSELIlHwN0fkiw68IVZdLr4R3PhwZ0jgK9fGUQyJCCV0qsYAW+vTEz/6VjpAYxnk7+1Fbd9gVy6LIHHnPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++41Dxz4X4/WP3pTcOSKEtCQJaCHfwd1obOQP7YTvJc=;
 b=ki9Jd9H5TimMQPzqWlZJJKR2aiIFkvmvOAn6JgxpQeXRgvlS5Akz/W5VC1t61wwkNlqco2OghwLpGqVYA+TeQCFLMdrVTai8aiI9p1NRi3QaF5ePbBc5FpVeeElYJ+BLcwG/ujoccMRfcrBcdKF6zzaBRt0qZnIemg+ooVosn7Ya6GskFRiqJ6s/F08POzJpalabJKle0O/2dg27VH+HJWb7g5qJwYxh+x0zBYEIDER2D1NjP4x+NpLS5676ZywzdYdYDbvrreW+qKl1Z/ZWn6DQ4xXK0xoWj0BJWJNY8NrXvpzsp73Dq04gmieyGvDUg+eGg0fjzzE8TxbaaRESPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB9474.eurprd04.prod.outlook.com (2603:10a6:10:368::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 18:55:41 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 18:55:41 +0000
Date: Mon, 7 Apr 2025 14:55:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: fsl,scu-wdt: Document imx8qm
Message-ID: <Z/QfodUQMax4PXzA@lizhi-Precision-Tower-5810>
References: <20250407-imx8qm-watchdog-v1-0-20c219b15fd2@bootlin.com>
 <20250407-imx8qm-watchdog-v1-1-20c219b15fd2@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-imx8qm-watchdog-v1-1-20c219b15fd2@bootlin.com>
X-ClientProxiedBy: PH8PR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::8) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB9474:EE_
X-MS-Office365-Filtering-Correlation-Id: f9724230-fe2a-4556-b077-08dd7605c92a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1BdSiqU7dvMYgPHHyqXFqJImhLFXp/agjoQFIyhgRRSljBOGyaWCd/KWXilN?=
 =?us-ascii?Q?/5diFiUzsC+hnmBDtJnzoN2E4XdoGhUYKqb62/4iAWGHezjAdCDBgg2X6ZdS?=
 =?us-ascii?Q?VLGYQoY5YlNn2HWLzQBDoWGqNze44iI/o1VPt8Oa8Be/d2TowrNKUWr6yxXO?=
 =?us-ascii?Q?DPZhrpHvsRAVJ89lhYWbf5042fXqCg3BQvWt985KtND4uxf7OisC6gafhqUN?=
 =?us-ascii?Q?VXpW8Ya6SrmjVWlCalav6odsLULlpB7oS5xobzpnLeNHCy2BSneohRZXiqWN?=
 =?us-ascii?Q?pZx3Y6l2slwhoQzlaYzNEPVR48ixoUMAWQ1EPQWmdpzVpz/h/XuWbQCyAZVN?=
 =?us-ascii?Q?BOskg0bSPM7C9SmT41sejKdr1O2x4RIPgAYB7LA9o6TaUA9KVmd2AFs09OPB?=
 =?us-ascii?Q?ZQ4y5+YDKEGv7m9XQkuoKrsV+tuNpSAuf0Df36il2Oiz0BcIc53GcySosv0u?=
 =?us-ascii?Q?aLFBpUejc8OcONVJEys2A2HwK+MEPw6uRAxsvcIjlU120EeQXKhXGSruyXE2?=
 =?us-ascii?Q?/iL7KCnZc/d8okSjPXTbx282N5h2y8lpFZtBEIKYVKtKGPfVEHHTHuHRaqFS?=
 =?us-ascii?Q?HgpPjJVmsb22fPDTqgOD3eP+Yy53fr8EZI5qFv47MkDdkx1PjBHhTkbA0Ieo?=
 =?us-ascii?Q?+otRjiV74ih2RLANEnlG8O7hvcoeF4+qyNc26IztnIUYI9cICUnhz9igNcO8?=
 =?us-ascii?Q?PH1jHjyxMiHwePWxXr8lSbg/G1nkICpvqdhk1ejIItonm/eNmbt4Xb31n7KX?=
 =?us-ascii?Q?e9R92FfjwkN3H+6TC1JykkQd2YpfOZVI03MCY1ggsQxwL7HMO5iY6sNtuzUB?=
 =?us-ascii?Q?Bd9sYO7QgDrzyDFPIgQ7LF/hTMGsybU+Hx/lMsM2/XQPUgOlkQxOEdkSEbRy?=
 =?us-ascii?Q?5Cz6ANmxJm6EWVxTqrId7g37UkpISJ2SbIsamHxuJgBPtqdewVkcrbSJIkp5?=
 =?us-ascii?Q?GwK+JSzCI3G99u6dfWXAjON68XH1EKaYl96EusjbkGELEIjx/Ys3Z5wAsCL0?=
 =?us-ascii?Q?+kchMA81ss9gjuvbxwfLaXADc211NjOUT+y+DNcPqqE4dqn76OCjKfH/TJ0N?=
 =?us-ascii?Q?lUsjBvryM/gx4+VlGRTTpYQDH0UNsYVwEwakpY+lXUy7DAtkZRB32ag2Ndbn?=
 =?us-ascii?Q?L8I+HTnafKW8UKmI7CbETLG7kpkvUo+jeFaMsiXyzHBwvG/pkilzAyDbdpSe?=
 =?us-ascii?Q?0um3ffxps1Dn+M/By2geaNvlTBTOI+m4lwahFA1bplzQY+jSzMMRu+2IJ98S?=
 =?us-ascii?Q?x6pkBe/XDSHsdsly2MPUwTfnrBazCiywRhD5LWCCmnqiKJoEItqsAnxamuzy?=
 =?us-ascii?Q?UsCyUK1dvOc+/gwLvGoz2XGNpA3mBKBtFwXKaVC4e//ahyriuMrtJLFRK/bS?=
 =?us-ascii?Q?jF6Q1JVYfgHME1iCzvYK1AdLxch3wmyyYw0C46sMTTpoSkGS9/eHaUp1vZ9G?=
 =?us-ascii?Q?QBLKI55mTMGpqKnaRoegyNKD21DZXHNF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oIlq64DZI/HxlD0rKoi+IasUrnYdanmEIO9HHJ18/nG1Ov9Blyglhu13X3wg?=
 =?us-ascii?Q?ExZihwqK60YKcOcUZ/tR0dikEt6P4hLvjh1bSesPFmOm2jc0BD7s88wBm8yG?=
 =?us-ascii?Q?quCS/zpHLpSSgz9BavPnGEvnj6N9a6c10tfQ3MKBzNzBFkQS0koaF4bQIiEp?=
 =?us-ascii?Q?1XI8P3f4FoagQOjquhS/dyeQJ8TpZk4rLtU9qoXs5EpDiV5naJYbIiG+I+pC?=
 =?us-ascii?Q?h/3h3BOMdjDeC0QbIdisi4wjzNnvhrqwILPS2eCpWSSPm8hW1TBfcuNBC1kL?=
 =?us-ascii?Q?Baf5gO80AUGhf/6lf03uSQmlBxZXmmv77RA+/SksCuYMKnHqsUITlK6xIF6X?=
 =?us-ascii?Q?1yT/OYrpKh95DmCw67d/OkANh75zldSS/H1UsYY9XyCIKOsdtAGGq4SwwlcV?=
 =?us-ascii?Q?BRxNsY0aCYa2ie9g3IYn72o8f1lwRmPjPJ17e2Q7LownFgpesXfCA+Lh/uFz?=
 =?us-ascii?Q?UHXPDEicO509HxWLM2kNaMp6yD6jRK0iKUoBixaH7i1o8TIrm+hijAMA8gzH?=
 =?us-ascii?Q?vIZNPHsROnbB76t57cOYOcW+Wd5GlsJ82OjeXFx/WggpUBSC7EqXrBv7hSuW?=
 =?us-ascii?Q?gmV1lbGi2ric9xgehN3IIuNrqo9J06N6F2MydaFSeLccgToaUdcG0HQYjz2r?=
 =?us-ascii?Q?MBkIZmY8EOg327eS/DMq2JkdPsIJVok+ykdb4mRUC0aNAX3+uZ1IzGkCk4eq?=
 =?us-ascii?Q?nrF9khfEXUa2Y4GZERzt7Xy7GbSCv/+M2Zl8LwteApTcShaZTr2ZCanOtyuF?=
 =?us-ascii?Q?7Lxi/t6ECMWJdAOWuw13G9tsA5LIYNptO3ll1VS670n8Lh9XZkadS7p/bQ7r?=
 =?us-ascii?Q?/XdXeGU+Zc6H+jLOp0oYT/FVC4jv/4HkKYc12xj4LkTcArbXbeX6YlSh/MN6?=
 =?us-ascii?Q?+QsTub0x/3SFbStfMf7g9FS6uWAmNkIOp+fomaQcMjAwWwyu34o4pBa+M1M+?=
 =?us-ascii?Q?G1O/EzrewPOZjFu+0jsXdo5zZBtbyufzBFRR7xw8qi5ekgok0HSjzBcKk86B?=
 =?us-ascii?Q?EVGwYW+I71L2Bbmv7b2P3UusfAvXSKtk6dS53gJiddzx30hWTq62NJ8Jl6oB?=
 =?us-ascii?Q?1usexg7NgSwA7ONFLkSdzLxGmQf3U+Ulz0nxjewCEK6HXy5l8xU9QGvDjq6G?=
 =?us-ascii?Q?l9n1b6nA1uN/ROKzfKLnqLLTxnwRxL7CvcdykLZ2dNGlm/8ROvvCuH7pGv/H?=
 =?us-ascii?Q?InO+qLLyxU1QDUk0P3zqwFV2a+TVaCeeIDQnQmSdJbqzucPaey6NPAIv4eND?=
 =?us-ascii?Q?Ca3nD0egQr0EXo/RUBf4ubhoisXahFqvoaNMwzUOC611G7jJVnLCzmkw8myP?=
 =?us-ascii?Q?p9BPS2dfGny5+JdVGk/KQ1X3I8ThxH2z9tfmKlxIjcM0cNRwTNcybE7OG75B?=
 =?us-ascii?Q?oh/nbXtKlMYO7EaxQxFpIb4gNZ3lt6Iw+W6Xd8xnFU0EVOczBhCnhvPP9FOV?=
 =?us-ascii?Q?tR/6Dz+sJQnYdlcm7KWJ2W/NjQGJyZTjNGqbQRnS5diUPz/cOQExQP6XZJiN?=
 =?us-ascii?Q?ux6IbeUitm/ZTyLy1/v42Odf8VGmvs00HfAnSNv9IbHsmTqtGwY0RTZ3hHai?=
 =?us-ascii?Q?4D07H4xcNQpG8oKC3ExQv/VI+0EprcTK4n9up3gl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9724230-fe2a-4556-b077-08dd7605c92a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 18:55:41.6801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cY6TSqmKSlYMa2nJ76hc7B5GzwtvKgxkBMX0SKFBpt7v2v224uxbSZ0SJgM1g58WJss0/IZhe4nBB04+kJjfwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9474

On Mon, Apr 07, 2025 at 07:03:25PM +0200, Thomas Richard wrote:
> Add an entry for 'fsl,imx8qm-sc-wdt' as imx8qm also contains the SCU
> watchdog block.
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml
> index 8b7aa922249b..1d9f15ec6657 100644
> --- a/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml
> @@ -20,6 +20,7 @@ properties:
>      items:
>        - enum:
>            - fsl,imx8dxl-sc-wdt
> +          - fsl,imx8qm-sc-wdt
>            - fsl,imx8qxp-sc-wdt
>        - const: fsl,imx-sc-wdt
>
>
> --
> 2.39.5
>

